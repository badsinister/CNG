
/**
 
 Основное меню
 
 */

import UIKit
import SwiftUI
import CoreKitUI

class MainMenuViewController: UIViewController {
    
    var sectionsManager: SectionsManager
    
    let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    /// Кнопки переключения разделов. Строятся на основе секций SectionsManager.
    let buttons: [UIButton]!
    
    // MARK: Constructors
    
    init(manager: SectionsManager) {
        sectionsManager = manager
        buttons = MainMenuViewController.makeSectionButtons(with: manager)
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // И подарок от SplitViewController
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.2078431373, green: 0.231372549, blue: 0.2862745098, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
    }

    // MARK: Methods
    
    func reloadData() {
        for (index, button) in buttons.enumerated() {
            if sectionsManager.selectedIndex == index {
                button.backgroundColor = CKStyle().color.customRed2
            } else {
                button.backgroundColor = .clear
            }
        }
    }
    
    private static func makeSectionButtons(with manager: SectionsManager) -> [UIButton] {
        var buttons: [UIButton] = []
        manager.sections.forEach {
            let button = UIButton()
            
            button.setImage($0.icon, for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            button.imageEdgeInsets = UIEdgeInsets(top: 15.0, left: 15.0, bottom: 15.0, right: 15.0)
            button.contentVerticalAlignment = .fill
            button.contentHorizontalAlignment = .fill
            button.accessibilityLabel = $0.title

            buttons.append(button)
        }
        return buttons
    }
    
    private func setup() {
        addSubviews()
        constrainSubviews()
        setupGestures()
        styleSubviews()
        isAccessibilityElement = true
    }
    
    private func addSubviews() {
        buttons.forEach { contentStackView.addArrangedSubview($0) }
        
        if buttons.count > 0 {
            let emptyView = UIView(frame: .zero)
            emptyView.translatesAutoresizingMaskIntoConstraints = false
            contentStackView.insertArrangedSubview(emptyView, at: buttons.count - 1)
        }

        view.addSubview(contentStackView)
    }

    private func constrainSubviews() {
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        var constraints = contentStackView.constraints(equalTo: view, directions: .vertical)
        
        buttons.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            let heightConstraint = $0.heightAnchor.constraint(equalTo: $0.widthAnchor)
            constraints.append(heightConstraint)
        }
        
        let widthConstraint = contentStackView.widthAnchor.constraint(equalToConstant: 60.0)
        let trailingConstraint = contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        constraints.append(contentsOf: [widthConstraint, trailingConstraint])

        NSLayoutConstraint.activate(constraints)
    }

    private func setupGestures() {
        buttons.forEach {
            $0.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        }
    }
    
    private func styleSubviews() {
        let style = CKStyle()
        view.backgroundColor = style.color.menuBackground
        navigationItem.titleView = CNGIconView()
        buttons.forEach { $0.tintColor = style.color.white }
    }
    
    // MARK: - Actions

    @objc
    private func didTapButton(_ sender: UIButton) {
        guard let index = buttons.firstIndex(of: sender) else { return }
        sectionsManager.selectSection(at: index)
        reloadData()
    }

}

// MARK: - Preview

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreviewer {
            MainMenuViewController(manager: SectionsManager())
        }
    }
}
