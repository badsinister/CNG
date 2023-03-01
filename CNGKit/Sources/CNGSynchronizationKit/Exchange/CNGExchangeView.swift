/**
 
 Окно синхронизация. Вид.
 
 */

import UIKit
import CNGKitUI
import CoreKitUI

/// Протокол поддержки событий вида.
protocol CNGExchangeViewDelegate: AnyObject {
    
    func exchangeView(_ exchangeView: CNGExchangeView, willCancelExchange sender: Any?)
}

/// ```
///     +---------------------------------------------+
///     |                                             |
///     |                 Title label                 |
///     |                                             |
///     |                                             |
///     |                     \|/                     |
///     |                    --*--                    |
///     |                     /|\                     |
///     |                                             |
///     |                                             |
///     |       ==================-------------       |
///     |                Subtitle Label               |
///     |                                             |
///     |                                             |
///     |                  [ Start ]                  |
///     |                                             |
///     +---------------------------------------------+
/// ```
class CNGExchangeView: CKView {
    
    weak var delegate: CNGExchangeViewDelegate?
    
    /// Контейнер содержимого вида
    let stackView: CKStackView = {
        let stackView = CKStackView.vertical()
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()

    /// Контейнер строки состояния
    let progressStackView = CKStackView.vertical()
    
    private let titleLabel: CKLabel = {
        let label = CKLabel(textStyle: .title2, weight: .regular)
        label.text = "Synchronization"
        return label
    }()
    
    let activityIndicatorView = UIActivityIndicatorView(style: .large)
    
    let progressView = UIProgressView(progressViewStyle: .default)
    
    let messageLabel: CKLabel = {
        let label = CKLabel(textStyle: .body, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Buttons
    
    private lazy var button = CNGButton("Cancel")
    
    // MARK: - Make View
    
    override func setup() {
        super.setup()
        addSubviews()
        constrainSubviews()
        styleSubviews()
        setupGestures()
    }
    
    private func addSubviews() {
        [titleLabel, activityIndicatorView, progressStackView, button].forEach { stackView.addArrangedSubview($0) }
        [progressView, messageLabel].forEach { progressStackView.addArrangedSubview($0) }
        addSubview(stackView)
    }
    
    private func constrainSubviews() {
        [stackView, progressStackView, titleLabel, activityIndicatorView, progressView, messageLabel, button].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        var constraints = stackView.constraints(equalTo: self)
        constraints += [
            progressStackView.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.8),
            button.widthAnchor.constraint(equalTo: button.heightAnchor, multiplier: 4),
            button.heightAnchor.constraint(equalToConstant: style().dimension.buttonHeight)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func styleSubviews() {
        let style = style()
        stackView.directionalLayoutMargins = style.dimension.directionalInsets
        stackView.setCustomSpacing(32, after: progressStackView)
        progressStackView.spacing = 8
        progressView.tintColor = style.color.customRed
        activityIndicatorView.color = style.color.customGray
    }
    
    private func setupGestures() {
        [button].forEach { $0.addTarget(self, action: #selector(didTapButton), for: .touchUpInside) }
    }
    
    @objc
    private func didTapButton(_ sender: UIButton) {
        switch sender {
        case button: delegate?.exchangeView(self, willCancelExchange: sender)
        default: fatalError("Target not set up properly")
        }
    }
    
    override open func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        styleSubviews()
    }
}
