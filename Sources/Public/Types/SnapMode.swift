import UIKit

public struct SnapMode {
  public static let afterScrolling: SnapMode = afterScrolling(decelerationRate: .fast)
  public static let immediately: SnapMode = immediately(decelerationRate: .normal, withFlick: true)

  internal let decelerationRate: DecelerationRate
  internal let snapTiming: SnapTiming

  public static func afterScrolling(decelerationRate: DecelerationRate) -> SnapMode {
    SnapMode(decelerationRate: decelerationRate, snapTiming: .afterScrolling)
  }
  public static func immediately(decelerationRate: DecelerationRate, withFlick: Bool = true) -> SnapMode {
    SnapMode(decelerationRate: decelerationRate, snapTiming: .immediately(withFlick: withFlick))
  }
}
