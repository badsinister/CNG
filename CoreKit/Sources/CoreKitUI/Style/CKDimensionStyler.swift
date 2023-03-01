
import UIKit

/// Определение значений для задания размеров.
public protocol CKDimensionStyler {
    var separatorHeight: CGFloat { get }
    
    var stackSpacing1: CGFloat { get }

    var cornerRadius: CGFloat { get }
    var cornerRadius2: CGFloat { get }

    var spacing: CGFloat { get }
    var spacing2: CGFloat { get }
    var spacing3: CGFloat { get }
    var spacing4: CGFloat { get }

    var imageHeight2: CGFloat { get }
    var imageHeight1: CGFloat { get }
    
    var pointSize3: CGFloat { get }
    var pointSize2: CGFloat { get }
    var pointSize1: CGFloat { get }
    
    var symbolPointSize5: CGFloat { get }
    var symbolPointSize4: CGFloat { get }
    var symbolPointSize3: CGFloat { get }
    var symbolPointSize2: CGFloat { get }
    var symbolPointSize1: CGFloat { get }
    
    var directionalInsets: NSDirectionalEdgeInsets { get }
    var directionalInsets2: NSDirectionalEdgeInsets { get }
    var directionalInsets3: NSDirectionalEdgeInsets { get }
    var directionalInsets4: NSDirectionalEdgeInsets { get }

    var buttonHeight4: CGFloat { get }
    var buttonHeight3: CGFloat { get }
    var buttonHeight2: CGFloat { get }
    var buttonHeight: CGFloat { get }
}

/// Значения для задания размеров поумолчанию.
public extension CKDimensionStyler {
    var separatorHeight: CGFloat { 2.0 / UIScreen.main.scale }
    
    var stackSpacing1: CGFloat { 8 }

    var cornerRadius: CGFloat { 4 }
    var cornerRadius2: CGFloat { 8 }

    var spacing: CGFloat { 8 }
    var spacing2: CGFloat { 16 }
    var spacing3: CGFloat { 24 }
    var spacing4: CGFloat { 32 }

    var imageHeight2: CGFloat { 40 }
    var imageHeight1: CGFloat { 150 }
    
    var pointSize3: CGFloat { 11 }
    var pointSize2: CGFloat { 14 }
    var pointSize1: CGFloat { 17 }
    
    var symbolPointSize5: CGFloat { 8 }
    var symbolPointSize4: CGFloat { 12 }
    var symbolPointSize3: CGFloat { 16 }
    var symbolPointSize2: CGFloat { 20 }
    var symbolPointSize1: CGFloat { 30 }
    
    var directionalInsets: NSDirectionalEdgeInsets { NSDirectionalEdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 24) }
    var directionalInsets2: NSDirectionalEdgeInsets { NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16) }
    var directionalInsets3: NSDirectionalEdgeInsets { NSDirectionalEdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12) }
    var directionalInsets4: NSDirectionalEdgeInsets { NSDirectionalEdgeInsets(top: 32, leading: 24, bottom: 32, trailing: 24) }

    var buttonHeight4: CGFloat { 20 }
    var buttonHeight3: CGFloat { 15 }
    var buttonHeight2: CGFloat { 20 }
    var buttonHeight: CGFloat { 40 }
}

/// Объект для задания размеров.
public struct CKDimensionStyle: CKDimensionStyler {
    public init() {}
}

private extension NSDirectionalEdgeInsets {
    init(value: CGFloat) {
        self.init(top: value, leading: value, bottom: value, trailing: value)
    }
}
