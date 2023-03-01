/**
 
 Набор элементов.
 
 */

import Foundation

public struct DSDataCollection<Item>: Codable, Hashable, Identifiable where Item: Hashable, Item: Codable {
 
    public var id: String
    public var title: String?
    public var items: [Item]
    
}

extension DSDataCollection {

    public init(items: [Item], title: String? = nil) {
        self.id = UUID().uuidString
        self.title = title
        self.items = items
    }

}

extension DSDataCollection: Comparable {
    
    public static func < (lhs: DSDataCollection<Item>, rhs: DSDataCollection<Item>) -> Bool {
        return lhs.title ?? "" < rhs.title ?? ""
    }
    
}
