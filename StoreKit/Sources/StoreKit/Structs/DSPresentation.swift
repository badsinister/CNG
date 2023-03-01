/**
 
 Презентация. Модель данных.
 
 */

import Foundation

public struct DSPresentation: Codable, Hashable, Identifiable, DSAnyPresentation {
    
    // MARK: - DSAnyPresentation
    public var id: String
    public var name: String
    public var slidesCount: String
    public var asset: String?
    public var updatedDate: Date?
    
}
