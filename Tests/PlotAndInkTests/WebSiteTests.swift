import XCTest
@testable import PlotAndInk

final class WebSiteTests: XCTestCase {
    func testThatItShouldGetPreferences_GivenConstructed() throws {
        let preferences = Preferences(projectRoot: ".")
        let site = WebSite(with: preferences)
        XCTAssertNotNil(site.preferences)
    }
}
