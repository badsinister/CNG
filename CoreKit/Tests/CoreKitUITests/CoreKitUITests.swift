import XCTest
@testable import CoreKitUI

final class CoreKitUITests: XCTestCase {

    var headerView: CKHeaderView!
    
    override func setUp() {
        headerView = CKHeaderView {
            $0.showsSeparator = true
            $0.showsDetailText = true
            $0.showsIconImage = true
        }
    }
    
    func testHeaderView() throws {
        headerView.titleLabel.text = "Title"
        headerView.detailLabel?.text = "Detail"
        XCTAssertEqual(headerView.titleLabel.text, "Title")
        XCTAssertNotNil(headerView.detailLabel)
        XCTAssertEqual(headerView.detailLabel?.text, "Detail")
    }
    
    override func tearDown() {
        headerView = nil
    }

}
