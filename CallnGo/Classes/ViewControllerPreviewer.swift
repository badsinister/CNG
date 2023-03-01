import SwiftUI

protocol ViewControllerRepresentable: UIViewControllerRepresentable {
    var builder: () -> UIViewController { get }
}

final class ViewControllerPreviewer: ViewControllerRepresentable {

    typealias UIViewControllerType = UIViewController

    let builder: () -> UIViewController

    init(builder: @escaping () -> UIViewController) {
        self.builder = builder
    }

    func makeUIViewController(context: Context) -> UIViewController {
        builder()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}
