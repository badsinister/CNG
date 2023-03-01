/**
 
 Создание и обновление вида событие.
 
 */

import UIKit
import CoreKitUI
import StoreKit

class CNGEventViewSynchronizer: CKAnyViewSynchronizer {
    
    func makeView() -> CNGEventView {
        return CNGEventView()
    }
    
    func updateView(_ view: CNGEventView, context: CNGEventDataContext) {
        //let contact = context.model
        view.nameLabel.text = "Моразмов Эраст Генрихович"
        view.inactiveLabel.text = "Удалено"
        view.specialtiesLabel.text = "Специальность"
        view.favoriteButton.setImage(UIImage(systemName: "arrow.up.forward.app")!, for: .normal)
        
        // Информация
        view.clearInfo()
        view.addInfo("911 234 56 78", style: .phone)
        view.addInfo("translate@pirate.ru", style: .email)
        view.addInfo("8:00 – 19:30", style: .datetime)
        view.addInfo("Получено согласие на сбор персональных данных", style: .text)
        
        view.startDateTimeControlView.dateTimeView.dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .none)
        view.startDateTimeControlView.dateTimeView.timeLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
        
        view.endDateTimeControlView.dateTimeView.dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .none)
        view.endDateTimeControlView.dateTimeView.timeLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
        
        view.targetControlView.textLabel.text = "Обсуждены профили пациентов по показаниям препаратов компании и по нозологиям. Проведен мониторинг НЯ"
    }
    
}
