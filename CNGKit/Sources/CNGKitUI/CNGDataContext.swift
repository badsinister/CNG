
import Foundation
import CoreKitUI

/// Контекст передачи данных для отображения.
public struct CNGDataContext<Item>: CKAnyDataContext {

    public var model: Item

    public init(_ model: Item) {
        self.model = model
    }

}
