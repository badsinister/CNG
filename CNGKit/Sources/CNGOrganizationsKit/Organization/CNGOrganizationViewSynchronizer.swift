/**
 
 Создание и обновление вида организации.
 
 */

import UIKit
import CoreKitUI
import CNGKitUI
import StoreKit

class CNGOrganizationViewSynchronizer: CKAnyViewSynchronizer {

    func makeView() -> CNGSimpleOrganizationView {
        return CNGSimpleOrganizationView()
    }

    func updateView(_ view: CNGSimpleOrganizationView, context: CNGDataContext<DSOrganization>) {
        view.titleLabel.text = context.model.name
        view.inactiveLabel.text = "Удалено"
        view.addressLabel.text = context.model.postalAddress?.street
        view.favoriteButton.setImage(UIImage(systemName: "star.fill")!, for: .normal)
        view.iconView.style = .organization

        // Информация
        view.additionalInfoView.clear()
        view.additionalInfoView.insertText("911 234 56 78", bulletStyle: .phone)
        view.additionalInfoView.insertText("translate@pirate.ru", bulletStyle: .email)
        view.additionalInfoView.insertText("8:00 – 19:30", bulletStyle: .datetime)
        view.additionalInfoView.insertText("Получено согласие на сбор персональных данных", bulletStyle: .checkmark)
    }

}
