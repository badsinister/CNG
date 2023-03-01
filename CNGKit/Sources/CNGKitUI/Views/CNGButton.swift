
import UIKit
import CoreKitUI

/// Копка с фоновым цветом.
///
///     +--------------------------+
///     |         [Title]          |
///     +--------------------------+
///
open class CNGButton: CKAnimatedButton<CKLabel> {
    
    // MARK: Properties
    
    /// Label in the center of the button.
    public let label: CKLabel = {
        let label = CKLabel(textStyle: .subheadline, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    // MARK: Life Cycle
    
    public init(_ text: String? = nil) {
        super.init(contentView: label, highlightOptions: [.defaultDelayOnSelect, .defaultOverlay], handlesSelection: false)
        label.text = text
        constrainSubviews()
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    
    override open func setStyleForSelectedState(_ isSelected: Bool) {
        let completionString = isSelected ? "COMPLETED" : "MARK_COMPLETE"
        let attributedText = NSMutableAttributedString(string: completionString)
        
        // Set a checkmark next to the text if the button is in the completed state
        if isSelected, let checkmark = UIImage.from(systemName: "checkmark") {
            let attachment = NSTextAttachment(image: checkmark)
            let checkmarkString = NSAttributedString(attachment: attachment)
            attributedText.append(.init(string: " "))
            attributedText.append(checkmarkString)
        }
        
        label.attributedText = attributedText
        
        updateColors()
    }
    
    override open func styleDidChange() {
        super.styleDidChange()
        let style = self.style()
        updateColors()
        layer.cornerRadius = style.appearance.cornerRadius
        directionalLayoutMargins = style.dimension.directionalInsets2
    }
    
    override open func tintColorDidChange() {
        super.tintColorDidChange()
        updateColors()
    }
    
    private func constrainSubviews() {
        NSLayoutConstraint.activate(label.constraints(equalTo: layoutMarginsGuide))
    }
    
    private func updateColors() {
        let style = self.style()
        backgroundColor = isSelected ? style.color.customRed2 : tintColor
        label.textColor = isSelected ? tintColor : style.color.customWhite
    }
}

private extension UIImage {
    static func from(systemName: String) -> UIImage? {
        let image = UIImage(systemName: systemName)
        assert(image != nil, "Unable to locate symbol for system name: \(systemName)")
        return image
    }
}
