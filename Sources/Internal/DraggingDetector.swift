import UIKit

internal class DraggingDetector: NSObject, UIScrollViewDelegate {
  private let snapMode: SnapMode

  internal var captureSnapID: (() -> SnapID?)?
  internal var flickTarget: ((CGPoint) -> SnapID?)?
  internal var scrollTo: ((SnapID?) -> Void)?

  internal init(snapMode: SnapMode) {
    self.snapMode = snapMode
  }

  // MARK: UIScrollViewDelegate methods

  internal func scrollViewWillEndDragging(
    _ scrollView: UIScrollView,
    withVelocity velocity: CGPoint,
    targetContentOffset: UnsafeMutablePointer<CGPoint>
  ) {
    guard case .immediately(let flickConsidered) = snapMode.snapTiming else { return }

    let currentSnapID = captureSnapID?()
    if flickConsidered {
      // The velocity in UIScrollViewDelegate is in points/millisecond
      // https://stackoverflow.com/a/40720012
      let pps = CGPoint(x: velocity.x * 1000, y: velocity.y * 1000)
      // The velocity detected as a flick would be 300 points/second
      // https://stackoverflow.com/a/49361860
      let isFlicked = pps.distance(.zero) >= 300

      if isFlicked {
        scrollTo?(flickTarget?(pps))
      } else {
        scrollTo?(currentSnapID)
      }
    } else {
      scrollTo?(currentSnapID)
    }
  }

  internal func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
    guard case .immediately = snapMode.snapTiming else { return }

    let currentSnapID = captureSnapID?()
    scrollTo?(currentSnapID)
  }

  internal func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    guard case .afterScrolling = snapMode.snapTiming else { return }

    if !decelerate {
      let currentSnapID = captureSnapID?()
      scrollTo?(currentSnapID)
    } else {
      // Wait for calling `scrollViewDidEndDecelerating`
    }
  }

  internal func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    guard case .afterScrolling = snapMode.snapTiming else { return }

    let currentSnapID = captureSnapID?()
    scrollTo?(currentSnapID)
  }
}
