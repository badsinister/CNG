import XCTest
@testable import RemoteSynchronizationKit
@testable import StoreKit

final class RemoteSynchronizationKitTest: XCTestCase {

    func testRemoteSynchronization() throws {
        XCTAssertNoThrow(try testRemoteCollectionDecode())

        XCTAssertNoThrow(try testEventTypesDecode())
        XCTAssertNoThrow(try testEventsDecode())

        XCTAssertNoThrow(try testOrganizationTypesDecode())
        XCTAssertNoThrow(try testOrganizationsDecode())
        
        XCTAssertNoThrow(try testLibraryDecode())
    }
    
    func testRemoteCollectionDecode() throws {
        let remoteCollectionJSON = """
        {"context": {
            "last_pull_date":1675455020,
            "presentation_ids":[6,7]
        },
        "data_files":[
            "event_types-2c3c6c877c02b3203a74.json",
            "users-d007e12baae1cfe170c5.json",
            "specialities-ba511badf7744279b651.json",
            "organization_types-2d904777ba40dd27ef3f.json",
            "organizations-d058a5e243cb978865cf.json",
            "contacts-e6a1e04aaba25d1d288f.json",
            "contact_positions-a8b61d946cf59c0c2c9d.json",
            "products-a87dcd30d450c80cc1de.json",
            "skus-8cb59b9dfaa62b20913d.json",
            "presentations-2bd8b0a6fd11be884fa0.json",
            "slides-7f48330c5550f6ea5edb.json",
            "visit_scenarios-c2e5f5aab361773ae7a1.json",
            "product_scenarios-24f495d9a21ec54dbaab.json",
            "events-53d4b54a059907b562ac.json",
            "library_directories-ab425ee6209cb8c395f4.json",
            "library_files-e67d834fc5522a8487f7.json"
        ],
        "presentation_files":[
            "6.zip",
            "7.zip"
        ]}
        """.data(using: .utf8)!
        
        XCTAssertNoThrow(try JSONDecoder().decode(RSRemoteCollection.self, from: remoteCollectionJSON))
    }

    func testEventTypesDecode() throws {
        let eventTypesJSON = """
        {"event_types": [
            {
                "id":30,
                "name":"Visit",
                "group":1,
                "position":1,
                "__id":30
            }
        ]}
        """.data(using: .utf8)!
        
        let collection = try JSONDecoder().decode(Dictionary<String, [RSEventType]>.self, from: eventTypesJSON)
        XCTAssertEqual(collection.keys.first, RSEventTypesKey)
        
        XCTAssertEqual(collection[RSEventTypesKey]?[0].id, 30)
        XCTAssertEqual(collection[RSEventTypesKey]?[0].name, "Visit")
        XCTAssertEqual(collection[RSEventTypesKey]?[0].group, 1)
        XCTAssertEqual(collection[RSEventTypesKey]?[0].position, 1)
    }

    func testEventsDecode() throws {
        let eventsJSON = """
        {"events":[
            {
                "id":"31A89595-EEAD-42A7-9FF0-D4144CFA22FA",
                "deleted":false,
                "organization_id":"9b158f58-f2e3-4374-a259-8571e788ce37",
                "starts_at":1673574300,
                "ends_at":1673577900,
                "started_at":null,
                "ended_at":null,
                "state":"planned",
                "event_type_id":30,
                "type":"Visit",
                "description":null,
                "result":null,
                "location":null,
                "show_actions":[{
                    "id":"784B1D60-96CE-452E-91A5-2328076A2909",
                    "event_id":"31A89595-EEAD-42A7-9FF0-D4144CFA22FA",
                    "__id":2032,
                    "started_at":null,
                    "ended_at":null,
                    "comment":null,
                    "contact_ids":["f088ff9e-551f-482f-b25e-2bc812acfed9"],
                    "visit_scenario_id":13,
                    "scenario_version_id":null,
                    "slide_data":null,
                    "duration":0.0
                }],
                "__id":2032,
                "dynamic_data":null
            }
        ]}
        """.data(using: .utf8)!
    }

    func testOrganizationTypesDecode() throws {
        let organizationTypesJSON = """
        {"organization_types":[
            {
                "id":3,
                "deleted":false,
                "name":"Аптека",
                "code":"pharmacy",
                "__id":3
            }
        ]}
        """.data(using: .utf8)!

        let collection = try JSONDecoder().decode(Dictionary<String, [RSOrganizationType]>.self, from: organizationTypesJSON)
        XCTAssertEqual(collection.keys.first, RSOrganizationTypesKey)
        
        XCTAssertEqual(collection[RSOrganizationTypesKey]?[0].id, 3)
        XCTAssertEqual(collection[RSOrganizationTypesKey]?[0].deleted, false)
        XCTAssertEqual(collection[RSOrganizationTypesKey]?[0].name, "Аптека")
        XCTAssertEqual(collection[RSOrganizationTypesKey]?[0].code, RSOrganizationTypeCode.pharmacy)
    }
    
    func testOrganizationsDecode() throws {
        let organizationsJSON = """
        {"organizations":[
            {
                "id":"fdea5096-9847-4e98-8df2-9612d30361ed",
                "deleted":false,
                "name":"Фарма",
                "city":"Москва",
                "address":"улица Юных Ленинцев, 78",
                "phone":"",
                "location":{"latitude":55.69814175787227,"longitude":37.776183988898985},
                "organization_type_id":3,
                "favorite":false,
                "inactivated":false,
                "on_review":false,
                "__id":401,
                "dynamic_data":null
            }
        ]}
        """.data(using: .utf8)!

        let collection = try JSONDecoder().decode(Dictionary<String, [RSOrganization]>.self, from: organizationsJSON)
        XCTAssertEqual(collection.keys.first, RSOrganizationsKey)
    }
    
    func testLibraryDecode() throws {
        let libraryDirectoriesJSON = """
        {"library_directories":[
            {
                "id":1,
                "deleted":false,
                "name":"Инструкции",
                "path":"/Инструкции",
                "parent_id":null,
                "__id":1
            }
        ]}
        """.data(using: .utf8)!
        
        let directoriesCollection = try JSONDecoder().decode(Dictionary<String, [RSLibraryDirectory]>.self, from: libraryDirectoriesJSON)
        XCTAssertEqual(directoriesCollection.keys.first, RSLibraryDirectoriesKey)

        let libraryFilesJSON = """
        {"library_files":[
            {
                "id":37,
                "deleted":false,
                "name":"Инструкция",
                "path":"/Инструкции/Инструкция",
                "parent_id":1,
                "file_url":"/content/library/3/37/(Demo)Руководство_пользователя_Call-n-Go_2022.docx",
                "file_size":6533106,
                "file_updated_at":1668075700,
                "__id":37
            }
        ]}
        """.data(using: .utf8)!
        
        let filesCollection = try JSONDecoder().decode(Dictionary<String, [RSLibraryFile]>.self, from: libraryFilesJSON)
        XCTAssertEqual(filesCollection.keys.first, RSLibraryFilesKey)
    }

}
