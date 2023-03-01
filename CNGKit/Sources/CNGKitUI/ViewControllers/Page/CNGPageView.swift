/**
 
 Вид отображения заголовка и основного вида.
 
 */

import UIKit
import CoreKitUI

/// ```
///     +------------------------------------------------+
///     |================================================|
///     |                   HeaderView                   |
///     |================================================|
///     |                                                |
///     |                                                |
///     |                                                |
///     |                    BodyView                    |
///     |                                                |
///     |                                                |
///     |                                                |
///     +------------------------------------------------+
/// ```
internal class CNGPageView: CKView {
    
    // MARK: Properties
    
    /// Контенер содержимого.
    let stackView = CKStackView.vertical()
    
    private let headerBackgroundView = {
        let view = CKView()
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return view
    }()
    
    private let headerView: UIView
    private let bodyView: UIView
    
    private let separatorView = CKSeparatorView()
    
    private let secondSeparatorView = CKSeparatorView()
    
    // MARK: Life cycle
    
    init(headerView: UIView, bodyView: UIView) {
        self.headerView = headerView
        self.bodyView = bodyView
        super.init()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    
    override func setup() {
        addSubviews()
        constrainSubviews()
    }
    
    private func addSubviews() {
        [separatorView, headerView, secondSeparatorView, bodyView].forEach { stackView.addArrangedSubview($0) }
        headerView.insertSubview(headerBackgroundView, at: 0)
        addSubview(stackView)
    }
    
    private func constrainSubviews() {
        [stackView, bodyView, headerView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        NSLayoutConstraint.activate(stackView.constraints(equalTo: self))
    }
    
    override func styleDidChange() {
        super.styleDidChange()
        let style = self.style()
        headerBackgroundView.backgroundColor = style.color.customWhite
        directionalLayoutMargins = style.dimension.directionalInsets
    }
    
}
