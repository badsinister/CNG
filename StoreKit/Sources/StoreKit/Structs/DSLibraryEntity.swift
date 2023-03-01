/**
 
 Файлы. Модель данных.
 
 */

import Foundation

public struct DSLibraryEntity: Codable, Hashable, Identifiable, DSAnyLibraryEntity {

    // MARK: - DSAnyLibraryEntity
    public var id: String
    public var name: String
    public var сategory: DSLibraryEntityCategory
}
