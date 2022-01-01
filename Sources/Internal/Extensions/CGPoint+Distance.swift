import UIKit

internal extension CGPoint {
  func distance(_ point: CGPoint) -> CGFloat {
    let xDistance = x - point.x
    let yDistance = y - point.y

    return sqrt(xDistance * xDistance + yDistance * yDistance)
  }

  func innerProduct(_ point: CGPoint) -> CGFloat {
    x * point.x + y * point.y
  }

  func subtract(_ point: CGPoint) -> CGPoint {
    CGPoint(x: x - point.x, y: y - point.y)
  }
}
