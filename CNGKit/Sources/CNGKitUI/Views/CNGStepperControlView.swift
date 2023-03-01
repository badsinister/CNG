/**
 
 Вид отображения выбора значения.
 
 */

import UIKit
import CoreKitUI

public protocol CNGStepperControlViewDelegate: AnyObject {
    
    /// Запрос на выбор следующего значения.
    /// - Parameter headerView: Вид заголовка.
    func headerViewWillSelectNextValue(_ headerView: CNGStepperControlView)
    
    /// Запрос на выбор предыдущего значения.
    /// - Parameter headerView: Вид заголовка.
    func headerViewWillSelectPreviousValue(_ headerView: CNGStepperControlView)

}

/// Заголовок. Переключатель.
///
/// ```
///    +-----------------------------------+
///    |                                   |
///    |          [<]  Title  [>]          |
///    |                                   |
///    +-----------------------------------+
/// ```
public class CNGStepperControlView: CKView {
    
    // MARK: Properties
    
    public weak var delegate: CNGStepperControlViewDelegate?
        
    private let stackView: CKStackView = {
        let stackView = CKStackView.vertical()
        stackView.alignment = .center
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    /// Контейнер элементов.
    private let contentStackView = CKStackView.horizontal()
    
    /// Текст заголовка.
    public let titleLabel = CKLabel(textStyle: .body, weight: .regular)
        
    fileprivate let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        return button
    }()

    fileprivate let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        return button
    }()
    
    // MARK: Methods
    
    public override func setup() {
        addSubviews()
        constrainSubviews()
        setupGestures()
    }
    
    private func addSubviews() {
        [previousButton, titleLabel, nextButton].forEach { contentStackView.addArrangedSubview($0) }
        [contentStackView].forEach { stackView.addArrangedSubview($0) }
        addSubview(stackView)
    }
    
    private func constrainSubviews() {
        [stackView, contentStackView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        NSLayoutConstraint.activate(stackView.constraints(equalTo: self))
    }
    
    public override func styleDidChange() {
        super.styleDidChange()
        let style = self.style()
        stackView.directionalLayoutMargins = style.dimension.directionalInsets
        contentStackView.spacing = style.dimension.spacing3
    }
    
    private func setupGestures() {
        [previousButton, nextButton].forEach {
            $0.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        }
    }
    
    @objc
    private func didTapButton(_ sender: UIControl) {
        switch sender {
        case previousButton: delegate?.headerViewWillSelectPreviousValue(self)
        case nextButton: delegate?.headerViewWillSelectNextValue(self)
        default: fatalError("Target not set up properly")
        }
    }

}
