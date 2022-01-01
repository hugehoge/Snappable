import SwiftUI

internal struct SnapIDModifier<ID>: ViewModifier where ID: Hashable {
  @Environment(\.coordinateSpaceName) private var coordinateSpaceName: UUID
  @Environment(\.snapAlignment) private var snapAlignment: SnapAlignment

  private let id: ID

  internal init(id: ID) {
    self.id = id
  }

  internal func body(content: Content) -> some View {
    content
      .id(id)
      .background(
        GeometryReader { proxy in
          Color.clear
            .preference(
              key: SnapAnchorPreferenceKey.self,
              value: [
                id: snapAlignment.point(in: proxy.frame(in: CoordinateSpace.named(coordinateSpaceName)))
              ]
            )
        }
      )
  }
}
