/**
 
 Наборы цветов.
 
 */

import UIKit

public enum RKPalette {
    case white
    case black
    case gray
    case red
    case secondaryRed
    case yellow
    case border
    case fill
    case secondaryFill
    case menuFill
}

extension RKPalette {
    public var color: UIColor {
        switch self {
        case .white: return UIColor(named: "WhiteColor", in: .module, compatibleWith: nil)!
        case .black: return UIColor(named: "BlackColor", in: .module, compatibleWith: nil)!
        case .red: return UIColor(named: "RedColor", in: .module, compatibleWith: nil)!
        case .secondaryRed: return UIColor(named: "DarkRedColor", in: .module, compatibleWith: nil)!
        case .gray: return UIColor(named: "GrayColor", in: .module, compatibleWith: nil)!
        case .yellow: return UIColor(named: "YellowColor", in: .module, compatibleWith: nil)!
        case .border: return UIColor(named: "BorderColor", in: .module, compatibleWith: nil)!
        case .fill: return UIColor(named: "CustomFill", in: .module, compatibleWith: nil)!
        case .secondaryFill: return UIColor(named: "SecondaryCustomFill", in: .module, compatibleWith: nil)!
        case .menuFill: return UIColor(named: "MenuFill", in: .module, compatibleWith: nil)!
        }
    }
}
