
import CoreGraphics

/// Определение значений размеров визуальных элементов.
public protocol CKAppearanceStyler {
    var opacity: CGFloat { get }
    var lineWidth: CGFloat { get }
    
    var cornerRadius: CGFloat { get }
    var cornerRadius1: CGFloat { get }
    var cornerRadius2: CGFloat { get }
    
    var borderWidth1: CGFloat { get }
    var borderWidth2: CGFloat { get }
}

/// Значения размеров визуальных элементов поумолчанию.
public extension CKAppearanceStyler {
    var opacity: CGFloat { 0.45 }
    var lineWidth: CGFloat { 4 }
    
    var cornerRadius: CGFloat { 4 }
    var cornerRadius1: CGFloat { 12 }
    var cornerRadius2: CGFloat { 26 }
    
    var borderWidth1: CGFloat { 3 }
    var borderWidth2: CGFloat { 2 }
}

/// Объект размеров визуальных элементов.
public struct CKAppearanceStyle: CKAppearanceStyler {
    public init() {}
}
