/**
 
 Вид отображения цели.
 
 */

import UIKit
import CoreKitUI

public protocol CNGTargetControlViewDelegate: AnyObject {
    
    func didSelectTargetControlView(_ targetControlView: CNGTargetControlView)
    
}

/// Цель.
///
/// ```
///    +-------------------------------+
///    | Title label                   |
///    | +---+                   +---+ |
///    | |   |  Text             | > | |
///    | +---+                   +---+ |
///    +-------------------------------+
/// ```
open class CNGTargetControlView: CKView {
    
    public weak var delegate: CNGTargetControlViewDelegate?
    
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
    
    /// Многостроковый текст основного размера.
    public let textLabel: CKLabel = {
        let label = CKLabel(textStyle: .body, weight: .regular)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.animatesTextChanges = true
        return label
    }()

    /// Изображение цели.
    public let iconImageView = UIImageView(image: UIImage(systemName: "target"))
    
    /// Контент вида - изображение + текст + шеврон (>).
    private let contentStackView: CKStackView = {
        let stackView = CKStackView.horizontal()
        stackView.alignment = .firstBaseline
        //stackView.distribution = .fillProportionally
        return stackView
    }()

    // Button that displays the highlighted state for the view.
    private lazy var backgroundButton = CKAnimatedButton(contentView: stackView, highlightOptions: [.defaultFade, .defaultDelayOnSelect], handlesSelection: false)

    // MARK: Life Cycle
    
    /// Основной конструктор вида.
    /// Содержимое определяется конфигурацией вида `Configuration`.
    public init(title: String? = nil) {
        self.titleLabel.text = title
        self.textLabel.text = "Goal"
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
        setupGestures()
        styleSubviews()
        isAccessibilityElement = true
    }
    
    private func addSubviews() {
        [titleLabel, contentStackView].forEach { stackView.addArrangedSubview($0) }
        [iconImageView, textLabel, detailDisclosureImageView].forEach { contentStackView.addArrangedSubview($0) }
        addSubview(backgroundButton)
    }
    
    private func styleSubviews() {
        let style = style()
        stackView.spacing = style.dimension.spacing
        contentStackView.spacing = style.dimension.spacing2
    }
    
    private func constrainSubviews() {
        [backgroundButton, stackView, titleLabel, contentStackView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        detailDisclosureImageView.contentMode = .scaleAspectFit
        detailDisclosureImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        var constraints = backgroundButton.constraints(equalTo: self) +
        stackView.constraints(equalTo: backgroundButton/*.layoutMarginsGuide*/)
        constraints += [
            iconImageView.widthAnchor.constraint(equalToConstant: 22),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor),
            detailDisclosureImageView.widthAnchor.constraint(equalToConstant: 22),
            detailDisclosureImageView.heightAnchor.constraint(equalTo: detailDisclosureImageView.widthAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    private func setupGestures() {
        backgroundButton.addTarget(self, action: #selector(viewTapped(_:)), for: .touchUpInside)
    }

    override open func styleDidChange() {
        super.styleDidChange()
        let style = self.style()
        titleLabel.textColor = style.color.customGray
        iconImageView.tintColor = style.color.customGray2
        detailDisclosureImageView.tintColor = style.color.customGray2
    }

    @objc
    private func viewTapped(_ sender: UIControl) {
        delegate?.didSelectTargetControlView(self)
    }

}
