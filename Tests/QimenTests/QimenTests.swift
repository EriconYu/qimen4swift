import XCTest
@testable import Qimen

final class QimenTests: XCTestCase {
    private let fixedInput: [String: Any] = [
        "year": 2026, "month": 4, "day": 10, "hour": 14, "minute": 0,
        "timezone": "Asia/Shanghai",
    ]

    func testFixedChart() throws {
        let result = try calculateQimen(fixedInput)
        XCTAssertEqual(result["algorithmVersion"] as? String, "qimen-zhuanpan-chaibu-v1")
        XCTAssertEqual(result["dunType"] as? String, "yang")
        XCTAssertEqual(result["juNumber"] as? Int, 1)
        XCTAssertEqual((result["zhiFu"] as? [String: Any])?["palace"] as? Int, 4)
        XCTAssertEqual((result["zhiShi"] as? [String: Any])?["palace"] as? Int, 8)
        XCTAssertEqual((result["palaces"] as? [Any])?.count, 9)
    }

    func testCanonical() throws {
        let result = try canonicalQimen(fixedInput)
        XCTAssertEqual((result["九宫盘"] as? [Any])?.count, 9)
    }

    func testLateZi() throws {
        let first = try calculateQimen([
            "year": 2026, "month": 4, "day": 10, "hour": 23, "minute": 30,
            "timezone": "Asia/Shanghai",
        ])
        let second = try calculateQimen([
            "year": 2026, "month": 4, "day": 11, "hour": 0, "minute": 30,
            "timezone": "Asia/Shanghai",
        ])
        let firstPillars = first["siZhu"] as! [String: String]
        let secondPillars = second["siZhu"] as! [String: String]
        XCTAssertEqual(firstPillars, secondPillars)
    }
}
