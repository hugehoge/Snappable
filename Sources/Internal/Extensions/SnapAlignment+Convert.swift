import SwiftUI

internal extension SnapAlignment {
  var unitPoint: UnitPoint {
    switch self {
    case .topLeading:
      return .topLeading

    case .top:
      return .top

    case .topTrailing:
      return .topTrailing

    case .leading:
      return .leading

    case .center:
      return .center

    case .trailing:
      return .trailing

    case .bottomLeading:
      return .bottomLeading

    case .bottom:
      return .bottom

    case .bottomTrailing:
      return .bottomTrailing
    }
  }

  func point(in frame: CGRect) -> CGPoint {
    switch self {
    case .topLeading:
      return CGPoint(x: frame.minX, y: frame.minY)

    case .top:
      return CGPoint(x: frame.midX, y: frame.minY)

    case .topTrailing:
      return CGPoint(x: frame.maxX, y: frame.minY)

    case .leading:
      return CGPoint(x: frame.minX, y: frame.midY)

    case .center:
      return CGPoint(x: frame.midX, y: frame.midY)

    case .trailing:
      return CGPoint(x: frame.maxX, y: frame.midY)

    case .bottomLeading:
      return CGPoint(x: frame.minX, y: frame.maxY)

    case .bottom:
      return CGPoint(x: frame.midX, y: frame.maxY)

    case .bottomTrailing:
      return CGPoint(x: frame.maxX, y: frame.maxY)
    }
  }

  func point(in size: CGSize) -> CGPoint {
    CGPoint(
      x: size.width * unitPoint.x,
      y: size.height * unitPoint.y
    )
  }
}
