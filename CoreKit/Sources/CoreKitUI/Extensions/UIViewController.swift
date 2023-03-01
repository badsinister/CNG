
import UIKit

internal extension UIViewController {
    
    func clearContainment() {
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
    
    func setupContainment(in containerViewController: UIViewController, stackView: CKStackView, animated: Bool = false) {
        containerViewController.addChild(self)
        stackView.addArrangedSubview(view, animated: animated)
        didMove(toParent: containerViewController)
    }
    
    func setupContainment(in containerViewController: UIViewController, stackView: CKStackView, at index: Int, animated: Bool = false) {
        containerViewController.addChild(self)
        stackView.insertArrangedSubview(view, at: index, animated: animated)
        didMove(toParent: containerViewController)
    }
    
}
