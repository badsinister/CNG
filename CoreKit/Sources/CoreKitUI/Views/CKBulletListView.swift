/**
 
 Список строк с иконками.
 
 */

import UIKit

/// Список позиций из иконки и строки текста.
/// Для добавление текстаиспользуется метод `insertText`.
/// Удаление всех элементов списка `clear`
///
/// ```
///    +-----------------------------------+
///    | +----+                            |
///    | |icon|  Text                      |
///    | +----+                            |
///    |               . . .               |
///    | +----+                            |
///    | |icon|  Text                      |
///    | +----+                            |
///    +-----------------------------------+
/// ```
open class CKBulletListView: CKView {
    
    public enum BulletStyle {
        case datetime
        case email
        case phone
        case checkmark
        
        /// Иконка для списка
        var image: UIImage {
            let configuration = UIImage.SymbolConfiguration(pointSize: 16, weight: .regular)
            let image: UIImage?
            switch self {
            case .datetime: image = UIImage(systemName: "clock", withConfiguration: configuration)!
            case .email: image = UIImage(systemName: "envelope", withConfiguration: configuration)!
            case .phone: image = UIImage(systemName: "phone", withConfiguration: configuration)!
            case .checkmark: image = UIImage(systemName: "checkmark.circle", withConfiguration: configuration)!
            }
            return image ?? UIImage()
        }
    }
    
    private let stackView = CKStackView.vertical()
    
    // MARK: Methods
    
    open override func setup() {
        super.setup()
        addSubviews()
        constrainSubviews()
        styleSubviews()
        isAccessibilityElement = true
    }
    
    private func addSubviews() {
        addSubview(stackView)
    }
    
    private func styleSubviews() {
        let style = style()
        stackView.spacing = style.dimension.spacing
    }
    
    private func constrainSubviews() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(stackView.constraints(equalTo: self))
    }
    
    // MARK: - Основные методы
    
    /// Удаление всех элементов из списка.
    open func clear() {
        stackView.clear()
    }
    
    /// Добавление нового элемента в список.
    ///
    /// - Parameters:
    ///   - text: Строка текста.
    ///   - bulletStyle: Иконка, определяется стилем `BulletStyle`.
    open func insertText(_ text: String, bulletStyle: BulletStyle) {
        let style = style()
        let stackView = CKStackView.horizontal()
        stackView.spacing = style.dimension.spacing
        stackView.alignment = .firstBaseline
        
        let imageView = UIImageView(image: bulletStyle.image)
        imageView.tintColor = style.color.customGray
        var constraints = [imageView.widthAnchor.constraint(equalToConstant: 20)]
        if bulletStyle != .email {
            constraints += [imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)]
        }
        NSLayoutConstraint.activate(constraints)
        
        let textLabel = CKLabel(textStyle: .subheadline, weight: .regular)
        textLabel.textColor = style.color.customGray
        textLabel.text = text
        
        [imageView, textLabel].forEach { stackView.addArrangedSubview($0) }
        self.stackView.addArrangedSubview(stackView)
    }
    
}
