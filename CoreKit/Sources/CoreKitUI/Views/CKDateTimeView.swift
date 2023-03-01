/**
 
 Вид выбора даты и времени.
 
 */

import UIKit

/// Описание. Дата и время.
///
/// ```
///    +------------------------------------+
///    | Title label                        |
///    | +---+          +---+         +---+ |
///    | |   |  Date    |   |  Time   | > | |
///    | +---+          +---+         +---+ |
///    +------------------------------------+
/// ```
open class CKDateTimeView: CKView {
    
    /// Стиль заголовка.
    public enum DateTimeStyle {
        /// Дата и время начала
        case startDateTime
        /// Дата и время окончания
        case endDateTime
        
        var title: String {
            switch self {
            case .startDateTime: return "Start date and time"
            case .endDateTime: return "End date and time"
            }
        }
    }
    
    // MARK: Properties
    
    /// Вертикальный стек для основного контента.
    public let stackView: CKStackView = {
        let stackView = CKStackView(style: .plain)
        stackView.axis = .vertical
        return stackView
    }()
    
    /// Изображение отображаемое справа от текста.
    public let detailDisclosureImageView = UIImageView(image: UIImage(systemName: "chevron.right"))
    
    /// Текст заголовка.
    public let titleLabel = CKLabel(textStyle: .subheadline, weight: .regular)

    /// Текст даты.
    public let dateLabel = CKLabel(textStyle: .body, weight: .regular)

    /// Текст времени.
    public let timeLabel = CKLabel(textStyle: .body, weight: .regular)

    /// Изображение календаря.
    public let dateIconImageView = UIImageView(image: UIImage(systemName: "calendar"))
    
    /// Изображение часов.
    public let timeIconImageView = UIImageView(image: UIImage(systemName: "clock"))

    /// Конфигурация вида.
    public let dateTimeStyle: DateTimeStyle
    
    /// Контент вида - изображение + текст + изображение + текст + шеврон (>).
    private let contentStackView: CKStackView = {
        let stackView = CKStackView.horizontal()
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    // MARK: Life Cycle
    
    /// Основной конструктор вида.
    /// Тип заголовка определяется `DateTimeStyle`.
    public init(dateTimeStyle: DateTimeStyle) {
        self.dateTimeStyle = dateTimeStyle
        self.titleLabel.text = dateTimeStyle.title
        self.dateLabel.text = "Select Date"
        self.timeLabel.text = "Select Time"
        super.init()
        accessibilityTraits = [.header, .button]
    }

    @available(*, unavailable)
    public required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        [titleLabel, contentStackView].forEach { stackView.addArrangedSubview($0) }
        [dateIconImageView, dateLabel, timeIconImageView, timeLabel, detailDisclosureImageView].forEach { contentStackView.addArrangedSubview($0) }
        addSubview(stackView)
    }
    
    private func styleSubviews() {
        let style = style()
        stackView.spacing = style.dimension.spacing
        contentStackView.spacing = style.dimension.spacing2
    }
    
    private func constrainSubviews() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        detailDisclosureImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        detailDisclosureImageView.contentMode = .scaleAspectFit
        dateIconImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        dateIconImageView.contentMode = .scaleAspectFit
        timeIconImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        timeIconImageView.contentMode = .scaleAspectFit

        var constraints = stackView.constraints(equalTo: self)
        constraints += [
            dateIconImageView.widthAnchor.constraint(equalToConstant: 22),
            dateIconImageView.heightAnchor.constraint(equalTo: dateIconImageView.widthAnchor),
            timeIconImageView.widthAnchor.constraint(equalToConstant: 22),
            timeIconImageView.heightAnchor.constraint(equalTo: timeIconImageView.widthAnchor),
            detailDisclosureImageView.widthAnchor.constraint(equalToConstant: 22),
            detailDisclosureImageView.heightAnchor.constraint(equalTo: detailDisclosureImageView.widthAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    override open func styleDidChange() {
        super.styleDidChange()
        let style = self.style()
        titleLabel.textColor = style.color.customGray
        
        dateIconImageView.tintColor = style.color.customGray2
        timeIconImageView.tintColor = style.color.customGray2
        detailDisclosureImageView.tintColor = style.color.customGray2
    }
    
}
