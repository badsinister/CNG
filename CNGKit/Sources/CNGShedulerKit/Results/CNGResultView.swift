/**
 
 Результат события. Вид.
 
 */

import UIKit
import CoreKitUI
import ResourcesKit

public class CNGResultView: CKView {
    
    private let contentBackgroundView = CKView()
    
    /// Заполнитель
    private let fillView = CKView()
    
    /// Основной контейнер
    private let stackView = CKStackView.vertical()
    
    private let contentStackView: CKStackView = {
        let stack = CKStackView.vertical()
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()

    lazy var textView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.font = UIFont.preferredCustomFont(forTextStyle: .body, weight: .regular)
        textView.tintColor = .label
        return textView
    }()
    
    public let titleLabel = CKLabel(textStyle: .subheadline, weight: .regular)
    
    private let spaceView = CKView()
    
    // MARK: - Make View
    
    public override func setup() {
        super.setup()
        addSubviews()
        constrainSubviews()
        styleSubviews()
    }
    
    private func addSubviews() {
        [contentBackgroundView, fillView].forEach { stackView.addArrangedSubview($0) }
        [titleLabel, textView].forEach { contentStackView.addArrangedSubview($0) }
        contentBackgroundView.addSubview(contentStackView)
        addSubview(stackView)
    }
    
    private func constrainSubviews() {
        [contentBackgroundView, fillView, contentStackView, stackView, titleLabel, textView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        var constraints = stackView.constraints(equalTo: self, directions: [.trailing, .leading, .bottom])
        constraints += contentStackView.constraints(equalTo: contentBackgroundView)
        constraints += [
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            textView.heightAnchor.constraint(equalToConstant: 200)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func styleSubviews() {
        let style = style()
        contentStackView.directionalLayoutMargins = style.dimension.directionalInsets
        contentBackgroundView.backgroundColor = style.color.customWhite
        contentStackView.spacing = style.dimension.spacing
        stackView.spacing = style.dimension.spacing3
        titleLabel.textColor = style.color.customGray
        textView.layer.borderColor = style.color.border.cgColor
        textView.layer.borderWidth = style.dimension.separatorHeight
        textView.layer.cornerRadius = style.dimension.cornerRadius
    }
    
}
