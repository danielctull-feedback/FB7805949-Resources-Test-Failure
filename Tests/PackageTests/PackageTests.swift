
import Package
import XCTest

final class PackageTests: XCTestCase {

    func testExample() throws {
        let resources = try XCTUnwrap(Bundle.module.url(forResource: "Resources", withExtension: nil))
        let url = resources.appendingPathComponent("Test.txt")
        let package = try Package(url: url)
        XCTAssertEqual(package.contents, "Hello World!\n")
    }
}
