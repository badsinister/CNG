
import UIKit
import ResourcesKit

/// Определение значений цветов.
public protocol CKColorStyler {
    var label: UIColor { get }
    var secondaryLabel: UIColor { get }
    var tertiaryLabel: UIColor { get }
    
    var border: UIColor { get }
    var separator: UIColor { get }
    
    var menuBackground: UIColor { get }
    
    var customFill: UIColor { get }
    var secondaryCustomFill: UIColor { get }
    var tertiaryCustomFill: UIColor { get }
    var quaternaryCustomFill: UIColor { get }
    
    var customBackground: UIColor { get }
    
    var customRed: UIColor { get }
    var customRed2: UIColor { get }
    var customWhite: UIColor { get }
    var customBlack: UIColor { get }

    var customYellow: UIColor { get }

    var customGray: UIColor { get }
    var customGray2: UIColor { get }
    var customGray3: UIColor { get }
    var customGray4: UIColor { get }
    var customGray5: UIColor { get }
    
    var white: UIColor { get }
    var black: UIColor { get }
    var clear: UIColor { get }
}

/// Значения цветов поумолчанию.
public extension CKColorStyler {
    var label: UIColor { .label }
    var secondaryLabel: UIColor { .secondaryLabel }
    var tertiaryLabel: UIColor { .tertiaryLabel }
    
    var border: UIColor { RKPalette.border.color }
    var separator: UIColor { RKPalette.border.color }

    var menuBackground: UIColor { RKPalette.menuFill.color }

    var customFill: UIColor { RKPalette.fill.color }
    var secondaryCustomFill: UIColor { RKPalette.secondaryFill.color }
    var tertiaryCustomFill: UIColor { .tertiarySystemFill }
    var quaternaryCustomFill: UIColor { .quaternarySystemFill }
    
    var customBackground: UIColor { .systemBackground }
    
    var customRed: UIColor { RKPalette.red.color }
    var customRed2: UIColor { RKPalette.secondaryRed.color }
    var customWhite: UIColor { RKPalette.white.color }
    var customBlack: UIColor { RKPalette.black.color }

    var customYellow: UIColor { RKPalette.yellow.color }

    var customGray: UIColor { RKPalette.gray.color }
    var customGray2: UIColor { .systemGray2 }
    var customGray3: UIColor { .systemGray3 }
    var customGray4: UIColor { .systemGray4 }
    var customGray5: UIColor { .systemGray5 }
    
    var white: UIColor { .white }
    var black: UIColor { .black }
    var clear: UIColor { .clear }
}

/// Объект значений цветов.
public struct CKColorStyle: CKColorStyler {
    public init() {}
}
