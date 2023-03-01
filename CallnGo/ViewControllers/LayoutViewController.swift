/**
 
 Корневой контроллер.
 
 */

import UIKit
import SwiftUI

final class LayoutViewController: UISplitViewController {

    var sectionsManeger: SectionsManager!

    init() {
        super.init(style: .doubleColumn)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Кастомизация строки статуса
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }

    // Setup
    
    private func setup() {
        sectionsManeger = SectionsManager()
        let primaryViewController = MainMenuViewController(manager: sectionsManeger)
        let secondaryViewController = MainTabBarController(controllers: sectionsManeger.makeControllers())
        sectionsManeger.delegate = secondaryViewController
        setViewController(primaryViewController, for: .primary)
        setViewController(secondaryViewController, for: .secondary)
        //preferredPrimaryColumnWidth = 60.0
        minimumPrimaryColumnWidth = 60.0
        maximumPrimaryColumnWidth = 60.0
        //preferredPrimaryColumnWidthFraction = 0.1
        if #available(iOS 14.5, *) {
            displayModeButtonVisibility = .never
        } else {
        }
        
        //presentsWithGesture = false
        
        setStatusBarStyle()
    }
    
    /// Кастомизация строки статуса
    private func setStatusBarStyle() {
        
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        guard let statusBarHeight = windowScene?.statusBarManager?.statusBarFrame.height else { return }
        
        let statusbarView = UIView()
        statusbarView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        statusbarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(statusbarView)
        
        NSLayoutConstraint.activate([
            statusbarView.heightAnchor.constraint(equalToConstant: statusBarHeight),
            statusbarView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0),
            statusbarView.topAnchor.constraint(equalTo: view.topAnchor),
            statusbarView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
}

// MARK: - Preview

struct LayoutView_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreviewer {
            LayoutViewController()
        }
    }
}
