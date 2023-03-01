/**
 
 Вид заголовка.
 
 */

import UIKit

/// Заголовок и детальное описание. Дополнительная кнопка
///
/// ```
///    +------------------------------------+
///    | +----+                       +---+ |
///    | |icon|  Title                | > | |
///    | +----+  Details              +---+ |
///    | ================================== |
///    +------------------------------------+
/// ```
open class CKHeaderView: CKView {
    
    /// Стиль кнопки дополнительной информации
    public enum DisclosureStyle {
        /// Стрелка вправо
        case chevron
        /// Пустой круг
        case circle
        /// Заполненный круг с галочкой
        case checkmark
        
        var image: UIImage? {
            switch self {
            case .chevron: return UIImage(systemName: "chevron.right")
            case .circle: return UIImage(systemName: "circle")
            case .checkmark: return UIImage(systemName: "checkmark.circle.fill")
            }
        }
    }
    
    /// Конфигурация вида.
    public struct Configuration {
        /// Флаг отображения разделителя внизу вида.
        public var showsSeparator: Bool = false
        
        /// Флаг отображения дополнительного текста.
        public var showsDetailText: Bool = false

        /// Стиль отображения кнопки справа от текста.
        public var detailDisclosureStyle: DisclosureStyle? = nil
        
        /// Флаг отображения изображения слева от текста.
        public var showsIconImage: Bool = false
    }
    
    // MARK: Properties
    
    /// Вертикальный стек для основного контента.
    public let contentStackView: CKStackView = {
        let stackView = CKStackView(style: .plain)
        stackView.axis = .vertical
        return stackView
    }()
    
    /// Изображение отображаемое справа от текста. Отображение определяется в конфигурации при создании.
    public let detailDisclosureImage: UIImageView?
    
    /// Многостроковый текст основного размера.
    public let titleLabel: CKLabel = {
        let label = CKLabel(textStyle: .body, weight: .regular)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.animatesTextChanges = true
        return label
    }()
    
    /// Многостроковый дополнительный текст.
    public let detailLabel: CKLabel?
    
    /// Изображение оторажаемое слева от текста.
    public let iconImageView: UIImageView?
    
    /// Конфигурация вида.
    private let configuration: Configuration
    
    /// Текст + комментарий.
    private let headerTextStackView = CKStackView.vertical()
    
    /// Контент вида - изображение + текст + изображение.
    private let headerStackView: CKStackView = {
        let stackView = CKStackView.horizontal()
        stackView.alignment = .center
        return stackView
    }()

    /// Разделитель.
    private let separatorView: CKSeparatorView?

    // MARK: Life Cycle

    /// Основной конструктор вида.
    /// Содержимое определяется конфигурацией вида `Configuration`.
    public init(configurationHandler: (inout Configuration) -> Void = { _ in }) {
        var configuration = Configuration()
        configurationHandler(&configuration)
        self.configuration = configuration
        
        iconImageView = configuration.showsIconImage ? CKHeaderView.makeIconImageView() : nil
        if let disclosureStyle = configuration.detailDisclosureStyle {
            detailDisclosureImage = UIImageView(image: disclosureStyle.image)
        } else {
            detailDisclosureImage = nil
        }
        separatorView = configuration.showsSeparator ? CKSeparatorView() : nil
        detailLabel = configuration.showsDetailText ? CKHeaderView.mekeDetailLabel() : nil
        super.init()
        accessibilityTraits = configuration.detailDisclosureStyle != nil ? [.header, .button] : [.header]
    }

    public required init?(coder aDecoder: NSCoder) {
        self.configuration = Configuration()
        iconImageView = nil
        detailDisclosureImage = nil
        separatorView = nil
        detailLabel = nil
        super.init(coder: aDecoder)
    }

    // MARK: Methods

    open override func setup() {
        super.setup()
        addSubviews()
        constrainSubviews()
        styleSubviews()
        isAccessibilityElement = true
    }

    private func addSubviews() {
        [titleLabel].forEach { headerTextStackView.addArrangedSubview($0) }
        [headerTextStackView].forEach { headerStackView.addArrangedSubview($0) }
        [headerStackView].forEach { contentStackView.addArrangedSubview($0) }
        
        // Добавление видов заданных в конфигурации
        if let separatorView = separatorView { contentStackView.addArrangedSubview(separatorView) }
        if let detailDisclosureImage = detailDisclosureImage { headerStackView.addArrangedSubview(detailDisclosureImage) }
        if let iconImageView = iconImageView { headerStackView.insertArrangedSubview(iconImageView, at: 0) }
        if let detailLabel = detailLabel { headerTextStackView.addArrangedSubview(detailLabel) }
        
        addSubview(contentStackView)
    }

    private func styleSubviews() {
        let style = style()
        let margin = style.dimension.directionalInsets.top
        contentStackView.spacing = margin
        headerStackView.spacing = margin / 2.0
        headerTextStackView.spacing = margin / 4.0
        contentStackView.setCustomSpacing(style.dimension.spacing2, after: headerStackView)
    }

    private static func makeIconImageView() -> UIImageView {
        let imageView = CKCircleImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }

    private static func mekeDetailLabel() -> CKLabel {
        let label = CKLabel(textStyle: .caption1, weight: .medium)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.animatesTextChanges = true
        return label
    }

    private func constrainSubviews() {
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        detailDisclosureImage?.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        iconImageView?.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        var constraints = contentStackView.constraints(equalTo: self)
        
        if let imageView = iconImageView {
            constraints += [
                imageView.heightAnchor.constraint(equalToConstant: 40),
                imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
            ]
        }
        
        NSLayoutConstraint.activate(constraints)
    }

    override open func styleDidChange() {
        super.styleDidChange()
        let style = self.style()
        titleLabel.textColor = style.color.label
        detailLabel?.textColor = style.color.label
        
        detailDisclosureImage?.tintColor = style.color.customGray3
        iconImageView?.tintColor = style.color.customGray3

        if let detailDisclosureStyle = configuration.detailDisclosureStyle {
            switch detailDisclosureStyle {
            case .chevron: detailDisclosureImage?.tintColor = style.color.customGray
            case .circle: detailDisclosureImage?.tintColor = style.color.separator
            case .checkmark: detailDisclosureImage?.tintColor = style.color.customRed
            }
        }
    }

}
