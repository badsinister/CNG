/**
 
 Создание и обновление вида контакта.
 
 */

import UIKit
import CoreKitUI
import StoreKit

class CNGContactViewSynchronizer: CKAnyViewSynchronizer {
    
    func makeView() -> CNGSimpleContactView {
        return CNGSimpleContactView()
    }
    
    func updateView(_ view: CNGSimpleContactView, context: CNGContactDataContext) {
        //let contact = context.model
        view.nameLabel.text = "Моразмов Эраст Генрихович"
        view.inactiveLabel.text = "Удалено"
        view.specialtiesLabel.text = "Специальность"
        view.favoriteButton.setImage(UIImage(systemName: "star")!, for: .normal)

        // Информация
        view.additionalInfoView.clear()
        view.additionalInfoView.insertText("911 234 56 78", bulletStyle: .phone)
        view.additionalInfoView.insertText("translate@pirate.ru", bulletStyle: .email)
        view.additionalInfoView.insertText("8:00 – 19:30", bulletStyle: .datetime)
        view.additionalInfoView.insertText("Получено согласие на сбор персональных данных", bulletStyle: .checkmark)
    }

}
