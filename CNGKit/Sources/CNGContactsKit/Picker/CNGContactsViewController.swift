
import UIKit
import CoreKitUI
import StoreKit
import CNGKitUI
import Combine

class CNGContactsViewController: CKViewController<CNGContactsDataProvider, CNGContactsViewSynchronizer> {
    
    /// Типы используемых фильтров
    enum FilterType: Int {
        /// Фильтр по специальности
        case speciality
        /// Фильтр по типу организации
        case organizationType
        /// Фильтр по Таргет
        case target
    }
    
    fileprivate var coordinator: CNGContactsNavigationController? {
        return navigationController as? CNGContactsNavigationController
    }
    
    private var titleLabel = {
        let label = CKLabel(textStyle: .body, weight: .regular)
        label.text = "Contacts"
        return label
    }()
    
    private var segmentedControl = UISegmentedControl(items: ["All", "Favorited"])
    
    /// Кнопка Добавить (+)
    private var addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: nil, action: nil)
    /// Кнопка поиск
    private var searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: nil, action: nil)
    
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Initializers
    
    init(dataProvider: CNGContactsDataProvider) {
        super.init(viewSynchronizer: CNGContactsViewSynchronizer(), dataProvider: dataProvider)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        contentView.delegate = self
        segmentedControl.selectedSegmentIndex = 0
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
        navigationItem.rightBarButtonItems = [addButton, searchButton]
        navigationItem.titleView = segmentedControl
    }
    
    private func styleSubviews() {
        let style = contentView.style()
        segmentedControl.selectedSegmentTintColor = style.color.customRed
        segmentedControl.setTitleTextAttributes([.foregroundColor: style.color.customBlack], for: .selected)

        switch view.traitCollection.userInterfaceStyle {
        case .dark:
            titleLabel.textColor = style.color.customBlack
            segmentedControl.setTitleTextAttributes([.foregroundColor: style.color.customBlack], for: .normal)
        case .light, .unspecified:
            titleLabel.textColor = style.color.customWhite
            segmentedControl.setTitleTextAttributes([.foregroundColor: style.color.customWhite], for: .normal)
        @unknown default: titleLabel.textColor = style.color.customWhite
        }
    }
    
    private func setupGestures() {
        segmentedControl.addTarget(self, action: #selector(didTapSegmentControl(_:)), for: .valueChanged)
        navigationItem.rightBarButtonItems?.forEach {
            $0.target = self
            $0.action = #selector(didTapButton(_:))
        }
    }
    
    @objc
    private func didTapSegmentControl(_ sender: UIControl) {
    }
    
    @objc
    private func didTapButton(_ sender: UIBarButtonItem) {
        switch sender {
        case addButton:
            let viewController = UINavigationController(rootViewController: UIViewController())
            viewController.modalPresentationStyle = .popover
            if #available(iOS 16.0, *) {
                viewController.popoverPresentationController?.sourceItem = sender
            } else {
                viewController.popoverPresentationController?.barButtonItem = sender
            }
            present(viewController, animated: true)
        case searchButton:
            print("search")
        default: fatalError("Target not set up properly")
        }
    }

    private func startObservingDataContext() {
        dataProvider.$contactPositions.sink { [weak self] in
            dump($0)
            dump(self!.dataProvider.contactPositions)
            let context = CNGContactsDataContext(model: $0 as? [DSContactPosition])
            self?.updateView(with: context)
        }.store(in: &cancellables)
    }

}

extension CNGContactsViewController: CNGContactsViewDelegate {
    
    /// Фильтр по специальности контакта
    /// - Parameters:
    ///   - contactsView: Вид отображения контактов
    ///   - sender: Кнопка, инициировавшая событие
    func contactsView(_ contactsView: CNGContactsView, willShowSpeciality sender: Any?) {
        coordinator?.showSpecialtyViewController(sourceView: sender as? UIView, delegate: self)
    }
    
    func contactsView(_ contactsView: CNGContactsView, willShowOrganizationType sender: Any?) {
        coordinator?.showOrganizationTypeViewController(sourceView: sender as? UIView, delegate: self)
    }
    
    func contactsView(_ contactsView: CNGContactsView, willShowTarget sender: Any?) {
        coordinator?.showTargetViewController(sourceView: sender as? UIView, delegate: self)
    }
    
    func contactsView(_ contactsView: CNGContactsView, didSelectContactAt indexPath: IndexPath, sender: Any?) {
        guard let contactPosition = viewSynchronizer.item(for: indexPath) else { return }
        coordinator?.show(contactPosition)
    }
    
}

extension CNGContactsViewController: CNGTargetPickerViewControllerDelegate, CNGSpecialtyPickerViewControllerDelegate, CNGOrganizationTypePickerViewControllerDelegate {

    /// Выбор типа организации
    func organizationTypePicker(_ organizationTypePicker: UIViewController, didSelectItems types: [DSOrganizationType]?) {
        print("Target Picker select \(String(describing: types))")
    }

    /// Выбор Таргет
    func targetPicker(_ targetPicker: UIViewController, didSelectItems targets: [String]?) {
        print("Target Picker select \(String(describing: targets))")
    }
    
    /// Выбор специальности
    func specialtyPicker(_ specialtyPicker: UIViewController, didSelectItems specialties: [DSSpecialty]?) {
        print("Specialty Picker select \(String(describing: specialties))")
    }

}
