import CoreGraphics
import XCTest

@testable import Snappable

final class CGPointTests: XCTestCase {
  func test_innerProduct_SameDirection_Plus() {
    let criteria = CGPoint(x: 1.0, y: 1.0)

    XCTAssertTrue(criteria.innerProduct(CGPoint(x: 1.0, y: 1.0)) > 0)
    XCTAssertTrue(criteria.innerProduct(CGPoint(x: 1.0, y: 0.0)) > 0)
    XCTAssertTrue(criteria.innerProduct(CGPoint(x: -1.0, y: 1.0001)) > 0)
  }

  func test_innerProduct_OppositeDirection_Minus() {
    let criteria = CGPoint(x: -1.0, y: -1.0)

    XCTAssertTrue(criteria.innerProduct(CGPoint(x: 1.0, y: 1.0)) < 0)
    XCTAssertTrue(criteria.innerProduct(CGPoint(x: 1.0, y: 0.0)) < 0)
    XCTAssertTrue(criteria.innerProduct(CGPoint(x: -1.0, y: 1.0001)) < 0)
  }

  func test_innerProduct_RightAngle_Zero() {
    let criteria = CGPoint(x: 0.0, y: 1.0)

    XCTAssertEqual(0, criteria.innerProduct(CGPoint(x: 2.0, y: 0.0)))
    XCTAssertEqual(0, criteria.innerProduct(CGPoint(x: -0.5, y: 0.0)))
  }

  func test_innerProduct_ZeroPoint_Zero() {
    let criteria = CGPoint(x: 1.0, y: -1.0)

    XCTAssertEqual(0, criteria.innerProduct(CGPoint.zero))

    let zeroCriteria = CGPoint.zero

    XCTAssertEqual(0, zeroCriteria.innerProduct(CGPoint(x: 1.0, y: 1.0)))
    XCTAssertEqual(0, zeroCriteria.innerProduct(CGPoint(x: -1.0, y: 1.0)))
    XCTAssertEqual(0, zeroCriteria.innerProduct(CGPoint(x: -1.0, y: -1.0)))
    XCTAssertEqual(0, zeroCriteria.innerProduct(CGPoint(x: 1.0, y: -1.0)))
  }
}
