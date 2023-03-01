
import UIKit
import CoreKitUI
import CNGKitUI
import Combine

/// Стартовый экран раздела Синхронизация. Отображения состояния измененных данных, открытие окон синхронизации и сервиса.
class CNGSynchronizationViewController: CKViewController<CNGSynchronizationDataProvider, CNGSynchronizationViewSynchronizer> {
    
    /// Диспетчер навигации экранов.
    var coordinator: CNGSynchronizationCoordinable? {
        return navigationController as? CNGSynchronizationNavigationController
    }
    
    private lazy var titleLabel = {
        let label = UILabel(frame: .zero)
        label.text = "Synchronization"
        return label
    }()
    
    private let serviceButton = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: nil, action: nil)
    
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Initializers
    
    init() {
        super.init(viewSynchronizer: CNGSynchronizationViewSynchronizer(), dataProvider: CNGSynchronizationDataProvider())
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Live Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.delegate = self
        setup()
        startObservingDataContext()
    }
    
    // MARK: - Make View
    
    private func setup() {
        addSubviews()
        styleSubviews()
        setupGestures()
    }
    
    private func addSubviews() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.rightBarButtonItems = [serviceButton]
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
        [serviceButton].forEach { $0.target = self; $0.action = #selector(didTapButton) }
    }
    
    @objc
    private func didTapButton(_ sender: UIControl) {
        coordinator?.presentServiceViewController()
    }
    
    override open func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        styleSubviews()
    }

    // MARK: - Observing DataContext
    
    private func startObservingDataContext() {
        dataProvider.$synchronizationState.sink { [weak self] in
            self?.updateView(with: CNGDataContext($0))
        }.store(in: &cancellables)
    }
    
}

extension CNGSynchronizationViewController: CNGSynchronizationViewViewDelegate {

    func synchronizationView(_ synchronizationView: CNGSynchronizationView, willStartSynchronization sender: Any?) {
        coordinator?.presentExchangeViewController()
    }
    
}
