import CoreGraphics
import XCTest

@testable import Snappable

final class SnapAlignmentTests: XCTestCase {
  func test_pointInFrame_NormalFrame_ExpectedPoint() {
    let frame = CGRect(x: 10, y: 20, width: 123, height: 45)

    XCTAssertEqual(CGPoint(x: 71.5, y: 20), SnapAlignment.top.point(in: frame))
    XCTAssertEqual(CGPoint(x: 10, y: 42.5), SnapAlignment.leading.point(in: frame))
    XCTAssertEqual(CGPoint(x: 71.5, y: 42.5), SnapAlignment.center.point(in: frame))
    XCTAssertEqual(CGPoint(x: 133, y: 42.5), SnapAlignment.trailing.point(in: frame))
    XCTAssertEqual(CGPoint(x: 71.5, y: 65), SnapAlignment.bottom.point(in: frame))
  }

  func test_pointInFrame_ZeroSizeFrame_OriginPoint() {
    let frame = CGRect(x: 10, y: 20, width: 0, height: 0)

    XCTAssertEqual(CGPoint(x: 10, y: 20), SnapAlignment.top.point(in: frame))
    XCTAssertEqual(CGPoint(x: 10, y: 20), SnapAlignment.leading.point(in: frame))
    XCTAssertEqual(CGPoint(x: 10, y: 20), SnapAlignment.center.point(in: frame))
    XCTAssertEqual(CGPoint(x: 10, y: 20), SnapAlignment.trailing.point(in: frame))
    XCTAssertEqual(CGPoint(x: 10, y: 20), SnapAlignment.bottom.point(in: frame))
  }

  func test_pointInSize_NormalSize_ExpectedPoint() {
    let size = CGSize(width: 123, height: 45)

    XCTAssertEqual(CGPoint(x: 61.5, y: 0), SnapAlignment.top.point(in: size))
    XCTAssertEqual(CGPoint(x: 0, y: 22.5), SnapAlignment.leading.point(in: size))
    XCTAssertEqual(CGPoint(x: 61.5, y: 22.5), SnapAlignment.center.point(in: size))
    XCTAssertEqual(CGPoint(x: 123, y: 22.5), SnapAlignment.trailing.point(in: size))
    XCTAssertEqual(CGPoint(x: 61.5, y: 45), SnapAlignment.bottom.point(in: size))
  }

  func test_pointInSize_ZeroSize_ZeroPoint() {
    let size = CGSize.zero

    XCTAssertEqual(CGPoint.zero, SnapAlignment.top.point(in: size))
    XCTAssertEqual(CGPoint.zero, SnapAlignment.leading.point(in: size))
    XCTAssertEqual(CGPoint.zero, SnapAlignment.center.point(in: size))
    XCTAssertEqual(CGPoint.zero, SnapAlignment.trailing.point(in: size))
    XCTAssertEqual(CGPoint.zero, SnapAlignment.bottom.point(in: size))
  }
}
