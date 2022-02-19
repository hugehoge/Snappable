import SwiftUI

internal struct SnappableModifier: ViewModifier {
  private let snapAlignment: SnapAlignment
  private let snapMode: SnapMode
  private let draggingDetector: DraggingDetector
  private let coordinateSpaceName: UUID

  @State private var parentAnchor: CGPoint = .zero
  @State private var childSnapAnchors: [SnapID: CGPoint] = [:]
  @State private var snapCandidateID: SnapID?

  internal init(alignment: SnapAlignment, mode: SnapMode) {
    self.snapAlignment = alignment
    self.snapMode = mode
    self.draggingDetector = DraggingDetector(snapMode: mode)
    self.coordinateSpaceName = UUID()
  }

  internal func body(content: Content) -> some View {
    ScrollViewReader { scrollViewProxy in
      content
        .coordinateSpace(name: coordinateSpaceName)
        .environment(\.coordinateSpaceName, coordinateSpaceName)
        .environment(\.snapAlignment, snapAlignment)
        .introspectScrollView { scrollView in
          scrollView.decelerationRate = snapMode.decelerationRate
          scrollView.delegate = draggingDetector
        }
        .background(
          GeometryReader { geometryProxy -> Color in
            DispatchQueue.main.async {
              // This may be called multiple times in ScrollView frame updates
              parentAnchor = snapAlignment.point(in: geometryProxy.size)
            }
            return Color.clear
          }
        )
        .onPreferenceChange(SnapAnchorPreferenceKey.self) { anchors in
          childSnapAnchors = anchors

          let willSnap = anchors.min { leftPair, rightPair in
            let leftDistance = parentAnchor.distance(leftPair.value)
            let rightDistance = parentAnchor.distance(rightPair.value)

            return leftDistance < rightDistance
          }
          if let id = willSnap?.key {
            snapCandidateID = id
          }
        }
        .onAppear {
          draggingDetector.captureSnapID = { snapCandidateID }
          draggingDetector.flickTarget = { velocity in
            guard let current = snapCandidateID,
                  let currentAnchor = childSnapAnchors[current] else { return snapCandidateID }

            let willSnap = childSnapAnchors
              .filter { _, value in
                let fromCurrent = value.subtract(currentAnchor)
                return velocity.innerProduct(fromCurrent) > 0
              }
              .min { leftPair, rightPair in
                let leftDistance = parentAnchor.distance(leftPair.value)
                let rightDistance = parentAnchor.distance(rightPair.value)

                return leftDistance < rightDistance
              }

            return willSnap?.key ?? snapCandidateID
          }
          draggingDetector.scrollTo = { id in
            DispatchQueue.main.async {  // Avoid a crash when scrolling is stopped by touch
              withAnimation {
                scrollViewProxy.scrollTo(id, anchor: snapAlignment.unitPoint)
              }
            }
          }
        }
    }
  }
}
