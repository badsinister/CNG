/**
 
 Окно синхронизация. Вид.
 
 */

import UIKit
import CoreKitUI
import CNGKitUI

/// Протокол поддержки событий вида.
protocol CNGServiceViewDelegate: AnyObject {
    
    func serviceView(_ serviceView: CNGServiceView, willCancelSynchronization sender: Any?)
}

/// ```
///     +-----------------------------------------+
///     |                                         |
///     |               Title label               |
///     |   +---------------------------------+   |
///     |   |                                 |   |
///     |   |                                 |   |
///     |   |                                 |   |
///     |   |                                 |   |
///     |   |                                 |   |
///     |   |                                 |   |
///     |   |                                 |   |
///     |   |                                 |   |
///     |   |                                 |   |
///     |   +---------------------------------+   |
///     |                                         |
///     |   [ Logout ]    [ Reset ]    [ Send ]   |
///     |                                         |
///     +-----------------------------------------+
/// ```
class CNGServiceView: CKView {
    
    weak var delegate: CNGServiceViewDelegate?
    
    /// Контейнер содержимого вида
    let stackView: CKStackView = {
        let stackView = CKStackView.vertical()
        //stackView.alignment = .center
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    /// Контейнер кнопок
    let buttonsStackView: CKStackView = {
        let stackView = CKStackView.horizontal()
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let titleLabel: CKLabel = {
        let label = CKLabel(textStyle: .title2, weight: .regular)
        label.text = "Service"
        label.textAlignment = .center
        return label
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.font = UIFont.preferredCustomFont(forTextStyle: .body, weight: .regular)
        textView.tintColor = .label
        return textView
    }()
    
    // MARK: - Buttons
    
    private var sendButton = CNGButton("Send")

    private var resetButton = CNGButton("Reset")

    private var logoutButton = CNGButton("Logout")
    
    // MARK: - Make View
    
    override func setup() {
        super.setup()
        addSubviews()
        constrainSubviews()
        styleSubviews()
        setupGestures()
    }
    
    private func addSubviews() {
        [titleLabel, textView, buttonsStackView].forEach { stackView.addArrangedSubview($0) }
        [logoutButton, resetButton, sendButton].forEach { buttonsStackView.addArrangedSubview($0) }
        addSubview(stackView)
    }
    
    private func constrainSubviews() {
        [stackView, titleLabel, textView, buttonsStackView, logoutButton, resetButton, sendButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        var constraints = stackView.constraints(equalTo: self)
        constraints += [
        ]
        NSLayoutConstraint.activate(stackView.constraints(equalTo: self))
    }
    
    private func styleSubviews() {
        let style = style()
        stackView.directionalLayoutMargins = style.dimension.directionalInsets
        stackView.spacing = 16
        buttonsStackView.spacing = 32
        textView.layer.borderColor = style.color.border.cgColor
        textView.layer.borderWidth = style.dimension.separatorHeight
        textView.layer.cornerRadius = style.dimension.cornerRadius
    }
    
    private func setupGestures() {
        [logoutButton, resetButton, sendButton].forEach { $0.addTarget(self, action: #selector(didTapButton), for: .touchUpInside) }
    }
    
    @objc
    private func didTapButton(_ sender: UIButton) {
        switch sender {
        case logoutButton: delegate?.serviceView(self, willCancelSynchronization: sender)
        case resetButton: delegate?.serviceView(self, willCancelSynchronization: sender)
        case sendButton: delegate?.serviceView(self, willCancelSynchronization: sender)
        default: fatalError("Target not set up properly")
        }
    }
    
    override open func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        styleSubviews()
    }
}
