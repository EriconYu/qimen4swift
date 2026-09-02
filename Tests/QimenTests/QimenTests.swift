import XCTest
@testable import Qimen
final class QimenTests:XCTestCase{
 func testSmoke()throws{let r=try calculateQimen(["year":2026,"month":4,"day":10,"hour":14,"minute":30,"timezone":"Asia/Shanghai"]);XCTAssertEqual((r["palaces"] as? [Any])?.count,9)}
 func testLateZi()throws{let a=try calculateQimen(["year":2026,"month":4,"day":10,"hour":23,"minute":30,"timezone":"Asia/Shanghai"]);let b=try calculateQimen(["year":2026,"month":4,"day":11,"hour":0,"minute":30,"timezone":"Asia/Shanghai"]);XCTAssertEqual(String(describing:a["siZhu"]!),String(describing:b["siZhu"]!))}
}
