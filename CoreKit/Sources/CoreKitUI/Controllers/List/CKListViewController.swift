/**
 
 Базовый контроллер списков.
 
 */

import UIKit

open class CKListViewController: UIViewController {
    
    // MARK: Properties
    
    /// Список отображающий скролируемый набор видов.
    var listView: CKListView {
        guard let view = self.view as? CKListView else { fatalError("Unsupported view type.") }
        return view
    }
    
    // MARK: - Life cycle
    
    override open func loadView() {
        view = CKListView()
    }
    
    // MARK: - Methods
    
    /// Sets up the containment of `viewController` in OCKListViewController and appends its view
    /// to the vertical stack of listed views.
    ///
    /// - Parameters:
    ///   - viewController: The view controller with the view to append. If the new child view controller
    ///   is already the child of a container view controller, it is removed from that container before being appended..
    ///   - animated: Pass `true` to animate the addition of the `viewController`'s view.
    open func appendViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.setupContainment(in: self, stackView: listView.stackView, animated: animated)
    }
    
    /// Appends `view` to the vertical stack of listed views.
    ///
    /// - Parameters:
    ///   - view: The view to append to the current end of the list.
    ///   - animated: Pass `true` to animate the addition of the view.
    open func appendView(_ view: UIView, animated: Bool) {
        listView.stackView.addArrangedSubview(view, animated: animated)
    }
    
    /// Sets up the containment of `viewController` in OCKListViewController and inserts its view
    /// in the vertical stack of listed views at the specified index.
    ///
    /// - Parameters:
    ///   - viewController: The view controller with the view to insert. If the view controller is already the child of
    ///   a container view controller, it is removed from that container before being inserted.
    ///   - index: The index at which to insert the `viewController`'s view. This value must not be greater
    ///   than the number of views in the `OCKListViewController`. If the index is out of bounds, this method
    ///    throws an internalInconsistencyException exception.
    ///   - animated: Pass `true` to animate the insertion of `viewController`'s view.
    open func insertViewController(_ viewController: UIViewController, at index: Int, animated: Bool) {
        viewController.setupContainment(in: self, stackView: listView.stackView, at: index, animated: animated)
    }
    
    /// Inserts a view in the vertical stack of listed views at the specified index.
    ///
    /// - Parameters:
    ///   - view: The view to insert in the list.
    ///   - index: The index at which to insert `view`. This value must not be greater than the number of views
    ///   in the `OCKListViewController`. If the index is out of bounds, this method throws an
    ///   internalInconsistencyException exception.
    ///   - animated: Pass `true` to animate the insertion of `view`.
    open func insertView(_ view: UIView, at index: Int, animated: Bool) {
        listView.stackView.insertArrangedSubview(view, at: index, animated: animated)
    }
    
    /// Удаление вида из позиции с `index`.
    ///
    /// - Parameter index: Индекс удаляемого вида.
    open func remove(at index: Int) {
        let view = listView.stackView.arrangedSubviews[index]
        if let viewController = children.first(where: { $0.view == view }) {
            viewController.clearContainment()
        } else {
            view.removeFromSuperview()
        }
    }
    
    /// Удаляет все отображаемые виды без анимации.
    open func clear() {
        listView.stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        children.forEach { $0.clearContainment() }
    }
    
}
