
import UIKit

public protocol CKDatePickerViewControllerDelegate: AnyObject {
    
    func datePickerViewController(_ datePickerViewController: UIViewController, didSelectDate date: Date?)
    
    func datePickerViewControllerWillClose(_ datePickerViewController: UIViewController)
    
}

public extension CKDatePickerViewControllerDelegate {
    
    func datePickerViewControllerWillClose(_ datePickerViewController: UIViewController) {
        datePickerViewController.dismiss(animated: true)
    }
    
}

/// Модальный контроллер для выбора даты. Корневой контроллер `UINavigationController`
open class CKDatePickerViewController: UINavigationController {
    
    /// Получатель уведомлений `CKDateTimePickerViewController`.
    public weak var pickerDelegate: CKDatePickerViewControllerDelegate?
    
    public init(startDate: Date? = nil, date: Date = Date(), delegate: CKDatePickerViewControllerDelegate? = nil) {
        let viewController = CKDateTimePickerViewController(startDate: startDate, date: date)
        viewController.navigationItem.title = "Select Date"
        super.init(rootViewController: viewController)
        self.isToolbarHidden = false
        self.pickerDelegate = delegate
        setup()
    }
    
    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        /// Кнопка отмена (закрыть окно)
        topViewController?.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(willClose))
        topViewController?.navigationItem.leftBarButtonItem?.tintColor = CKStyle().color.customGray
        /// Кнопка Добавить (+)
        topViewController?.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(willSelectItems))
    }
    
    @objc
    func willClose() {
        pickerDelegate?.datePickerViewControllerWillClose(self)
    }
    
    @objc
    func willSelectItems() {
        pickerDelegate?.datePickerViewController(self, didSelectDate: (viewControllers.first as? CKDateTimePickerViewController)?.selectedDate)
    }
    
}

/// Контроллер для работы с выбором даты.
open class CKDateTimePickerViewController: UIViewController, CKStylable {
    
    // MARK: Properties
    
    /// Пикер даты.
    private let datePicker = UIDatePicker()
    
    /// Кнопка Сегодня - переход на текущую дату.
    private var nowButton = UIBarButtonItem(title: "Now", style: .plain, target: nil, action: nil)
    
    public var selectedDate: Date {
        return datePicker.date
    }
    
    /// Отображение
    public var contentView: CKView {
        guard let view = self.view as? CKView else { fatalError("View should be of type \(CKView.self)") }
        return view
    }

    // MARK: - Initializers
    
    public init(startDate: Date? = nil, date: Date = Date()) {
        self.datePicker.date = date
        self.datePicker.minimumDate = startDate
        self.datePicker.preferredDatePickerStyle = .inline
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func loadView() {
        view = CKView()
    }
    
    // MARK: - Methods
    
    private func setup() {
        addSubviews()
        constrainSubviews()
        styleSubviews()
        setupGestures()
    }
    
    private func addSubviews() {
        view.addSubview(datePicker)
    }
    
    private func constrainSubviews() {
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        //NSLayoutConstraint.activate(datePicker.constraints(equalTo: view.layoutMarginsGuide))
        datePicker.center = view.center
        preferredContentSize = datePicker.frame.size
    }
    
    private func styleSubviews() {
        let style = style()
        datePicker.tintColor = style.color.customRed
        nowButton.tintColor = style.color.customGray
    }
    
    private func setupGestures() {
        setToolbarItems([UIBarButtonItem(systemItem: .flexibleSpace), nowButton], animated: false)
        [nowButton].forEach {
            $0.target = self
            $0.action = #selector(didTapButton(_:))
        }
    }
    
    @objc
    private func didTapButton(_ sender: UIControl) {
        switch sender {
        case nowButton:
            datePicker.setDate(Date(), animated: true)
        default: fatalError("Target not set up properly")
        }
    }
    
    // MARK: - Stylable
    
    public var customStyle: CKStyler? {
        get { return contentView.customStyle }
        set { contentView.customStyle = newValue }
    }
    
    public func style() -> CKStyler {
        contentView.style()
    }
    
    public func styleDidChange() {
        contentView.styleDidChange()
    }
    
}
