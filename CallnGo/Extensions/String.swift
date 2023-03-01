/**
 
 Расширенные функции для работы со строками.
 
 */

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func capitalized() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalized() {
        self = self.capitalized()
    }
    
}
