/**
 
 Вид отображения селектора.
 
 */

import UIKit
import CoreKitUI

public protocol CNGSegmentedControlViewDelegate: AnyObject {
    
    func headerView(_ headerView: CNGSegmentedControlView, didSelect value: Int)
    
}

/// Заголовок. Сегментный переключатель.
///
/// ```
///    +----------------------------------------+
///    |                                        |
///    |          [Item] [Item] [Item]          |
///    |                                        |
///    +----------------------------------------+
/// ```
public class CNGSegmentedControlView: CKView {
    
    // MARK: Properties
    
    public weak var delegate: CNGSegmentedControlViewDelegate?
    
    /// Меню
    public let segmentedControl: CKSegmentedControl!
    
    private let stackView: CKStackView = {
        let stackView = CKStackView.vertical()
        stackView.alignment = .center
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()

    // MARK: Initialize
    
    public init(items: [Any]?) {
        self.segmentedControl = CKSegmentedControl(items: items)
        super.init()
        self.segmentedControl.addTarget(self, action: #selector(valueDidChanged(_ :)), for: .valueChanged)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    
    public override func setup() {
        addSubviews()
        constrainSubviews()
    }
    
    private func addSubviews() {
        [segmentedControl].forEach { stackView.addArrangedSubview($0) }
        addSubview(stackView)
    }
    
    private func constrainSubviews() {
        [stackView, segmentedControl].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        NSLayoutConstraint.activate(stackView.constraints(equalTo: self))
    }
    
    public override func styleDidChange() {
        super.styleDidChange()
        let style = self.style()
        segmentedControl.backgroundColor = style.color.customWhite
        stackView.directionalLayoutMargins = style.dimension.directionalInsets2
    }
    
    @objc
    func valueDidChanged(_ sender: CKSegmentedControl) {
        delegate?.headerView(self, didSelect: sender.selectedSegmentIndex)
    }
    
}
