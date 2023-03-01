/**
 
 Вид отображения цели.
 
 */

import UIKit
import CoreKitUI

public protocol CNGDateTimeControlViewDelegate: AnyObject {
    
    func didSelectDateTimeControlView(_ dateTimeControlView: CNGDateTimeControlView)
    
}

/// Дата и время.
///
/// ```
///    +-------------------------------+
///    | Title label                   |
///    | +---+                   +---+ |
///    | |   |  Text             | > | |
///    | +---+                   +---+ |
///    +-------------------------------+
/// ```
open class CNGDateTimeControlView: CKView {
    
    public weak var delegate: CNGDateTimeControlViewDelegate?
    
    // MARK: Properties
    
    /// Основной контент.
    public let dateTimeView: CKDateTimeView!
    
    // Button that displays the highlighted state for the view.
    private lazy var backgroundButton = CKAnimatedButton(contentView: dateTimeView, highlightOptions: [.defaultFade, .defaultDelayOnSelect], handlesSelection: false)
    
    // MARK: Life Cycle
    
    /// Основной конструктор вида.
    /// Тип заголовка определяется `DateTimeStyle`.
    public init(dateTimeStyle: CKDateTimeView.DateTimeStyle) {
        self.dateTimeView = CKDateTimeView(dateTimeStyle: dateTimeStyle)
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
        isAccessibilityElement = true
    }
    
    private func addSubviews() {
        addSubview(backgroundButton)
    }
    
    private func constrainSubviews() {
        [backgroundButton, dateTimeView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        NSLayoutConstraint.activate(backgroundButton.constraints(equalTo: self) +
                                    dateTimeView.constraints(equalTo: backgroundButton/*.layoutMarginsGuide*/))
    }
    
    private func setupGestures() {
        backgroundButton.addTarget(self, action: #selector(viewTapped(_:)), for: .touchUpInside)
    }
    
    @objc
    private func viewTapped(_ sender: UIControl) {
        delegate?.didSelectDateTimeControlView(self)
    }
    
}
