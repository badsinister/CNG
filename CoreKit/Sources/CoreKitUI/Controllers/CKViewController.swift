/**

 Базовый ViewController

 */

import UIKit

open class CKViewController<DataProvider: CKAnyDataProvider, ViewSynchronizer: CKAnyViewSynchronizer>: UIViewController {
    
    /// Контроллер для работы с видом.
    public let viewSynchronizer: ViewSynchronizer

    /// Контроллер для работы с данными.
    public let dataProvider: DataProvider
    
    /// Отображение
    public var contentView: ViewSynchronizer.View {
        guard let view = self.view as? ViewSynchronizer.View else { fatalError("View should be of type \(ViewSynchronizer.View.self)") }
        return view
    }

    // MARK: - Initializers
    
    public init(viewSynchronizer: ViewSynchronizer, dataProvider: DataProvider) {
        self.viewSynchronizer = viewSynchronizer
        self.dataProvider = dataProvider
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    open override func loadView() {
        view = viewSynchronizer.makeView()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = CKStyle().color.customFill
        dataProvider.fetchData {}
    }

    // MARK: - Reload View
    public func updateView(with dataContext: ViewSynchronizer.Model) {
        viewSynchronizer.updateView(contentView, context: dataContext)
    }
    
}
