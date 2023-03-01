
import UIKit
import Combine
import StoreKit
import CoreKitUI

class CNGEventViewController: CKViewController<CNGEventDataProvider, CNGEventViewSynchronizer>, CKIndexable {
    
    var index: CKAnyIndex
    
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Initializers
    
    public init(dataProvider: CNGEventDataProvider, index: CNGDetailedEventPageIndex) {
        self.index = index
        super.init(viewSynchronizer: CNGEventViewSynchronizer(), dataProvider: dataProvider)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        navigationItem.title = dataProvider.title
        contentView.delegate = self
        startObservingDataContext()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataProvider.fetchData()
    }
    
    private func startObservingDataContext() {
        dataProvider.$event.sink { [weak self] in
            dump($0)
            dump(self!.dataProvider.event)
            guard let event = $0 as? DSEvent else {
                return
            }
            let context = CNGEventDataContext(model: event)
            self?.updateView(with: context)
        }.store(in: &cancellables)
    }
    
}

extension CNGEventViewController: CNGEventViewDelegate {

    func eventView(_ eventView: CNGEventView, willChangeStartDateTime sender: Any?) {
        let datePickerViewController = UIViewController()
        let datePicker = UIDatePicker()
        datePicker.tintColor = CKStyle().color.customRed
        datePicker.preferredDatePickerStyle = .inline
        datePicker.locale = Locale(identifier: "ru-RU")
        datePickerViewController.preferredContentSize = datePicker.frame.size
        datePickerViewController.view.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(datePicker.constraints(equalTo: datePickerViewController.view.layoutMarginsGuide))
        datePickerViewController.modalPresentationStyle = .popover
        datePickerViewController.popoverPresentationController?.sourceView = eventView.startDateTimeControlView.dateTimeView.detailDisclosureImageView
        present(datePickerViewController, animated: true)
    }
    
    func eventView(_ eventView: CNGEventView, willChangeEndDateTime sender: Any?) {
        let datePickerViewController = CKDatePickerViewController(delegate: self)
        datePickerViewController.modalPresentationStyle = .popover
        datePickerViewController.popoverPresentationController?.sourceView = eventView.endDateTimeControlView.dateTimeView.detailDisclosureImageView
        present(datePickerViewController, animated: true)
    }
    
    func eventView(_ eventView: CNGEventView, willChangeTarget sender: Any?) {
    }
    
    func eventView(_ eventView: CNGEventView, willChange sender: Any?) {
    }
    
}

extension CNGEventViewController: CKDatePickerViewControllerDelegate {

    func datePickerViewController(_ datePickerViewController: UIViewController, didSelectDate date: Date?) {
        print(date ?? "No Date")
    }
    
}
