/**
 
 Заголовок секции.
 
 */

import UIKit
import CoreKitUI

/// Заголовок. Дополнительная текст
///
/// ```
///    +------------------------------------+
///    |                                    |
///    | Title                       Detail |
///    |                                    |
///    +------------------------------------+
/// ```
open class CNGSectionHeaderView: CKView {
    
    // MARK: Properties
    
    /// Стек для основного контента.
    public let stackView: CKStackView = {
        let stackView = CKStackView.horizontal()
        stackView.alignment = .center
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    /// Многостроковый текст основного размера.
    public let titleLabel: CKLabel = {
        let label = CKLabel(textStyle: .body, weight: .regular)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.animatesTextChanges = true
        return label
    }()
    
    /// Многостроковый дополнительный текст.
    public let detailLabel: CKLabel = CKLabel(textStyle: .subheadline, weight: .regular)
    
    // MARK: Methods
    
    open override func setup() {
        super.setup()
        addSubviews()
        constrainSubviews()
        styleSubviews()
        isAccessibilityElement = true
    }
    
    private func addSubviews() {
        [titleLabel, detailLabel].forEach { stackView.addArrangedSubview($0) }
        addSubview(stackView)
    }
    
    private func styleSubviews() {
        let style = style()
        stackView.directionalLayoutMargins = style.dimension.directionalInsets3
        stackView.spacing = style.dimension.spacing2
        titleLabel.textColor = style.color.label
        detailLabel.textColor = style.color.customGray
    }
    
    private func constrainSubviews() {
        [stackView, titleLabel, detailLabel].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        NSLayoutConstraint.activate(stackView.constraints(equalTo: self))
    }
    
}
