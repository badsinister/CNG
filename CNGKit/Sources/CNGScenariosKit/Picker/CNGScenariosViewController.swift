
import UIKit
import StoreKit
import CoreKitUI
import Combine

class CNGScenariosViewController: CKViewController<CNGScenariosDataProvider, CNGScenariosViewSynchronizer>, CNGScenariosViewDelegate {
    
    /// Заголовок стрвницы.
    private var titleLabel = {
        let label = CKLabel(textStyle: .body, weight: .regular)
        label.text = "Scenarios"
        return label
    }()

    /// Кнопка поиск.
    private var searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: nil, action: nil)
    
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Initialize
    
    init(actionsStore: DSAnyActionsStore) {
        super.init(viewSynchronizer: CNGScenariosViewSynchronizer(), dataProvider: CNGScenariosDataProvider(store: actionsStore))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        contentView.delegate = self
        setup()
        startObservingDataContext()
    }
    
    override open func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        styleSubviews()
    }
    
    // MARK: - Make View
    
    private func setup() {
        addSubviews()
        styleSubviews()
        setupGestures()
    }
    
    private func addSubviews() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.rightBarButtonItems = [searchButton]
    }
    
    private func styleSubviews() {
        let style = contentView.style()
        
        switch view.traitCollection.userInterfaceStyle {
        case .dark: titleLabel.textColor = style.color.customBlack
        case .light, .unspecified: titleLabel.textColor = style.color.customWhite
        @unknown default: titleLabel.textColor = style.color.customWhite
        }
    }
    
    private func setupGestures() {
        navigationItem.rightBarButtonItems?.forEach {
            $0.target = self
            $0.action = #selector(didTapButton(_:))
        }
    }
    
    // MARK: - Actions
    
    @objc
    private func didTapButton(_ sender: UIBarButtonItem) {
        switch sender {
        case searchButton:
            print("search")
        default: fatalError("Target not set up properly")
        }
    }
    
    private func startObservingDataContext() {
        dataProvider.$scenarios.sink { [weak self] in
            dump($0)
            dump(self!.dataProvider.scenarios)
            self?.updateView(with: CNGScenariosDataContext(model: $0 as? [DSScenario]))
        }.store(in: &cancellables)
    }

    // MARK: - ContentView CNGScenariosViewDelegate

    func scenariosView(_ scenariosView: CNGScenariosView, didSelectScenarioAt indexPath: IndexPath, sender: Any?) {
        guard let scenario = viewSynchronizer.item(for: indexPath) else { return }
        print(scenario)
    }
    
}
