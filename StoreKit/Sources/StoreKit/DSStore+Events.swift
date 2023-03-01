/**
 
 Хранилище событий.
 
 */

import Foundation

extension DSStore {

    public func fetchEvents(query: DSAnyQuery = DSEventQuery(), callbackQueue: DispatchQueue = .main, completion: @escaping (Result<[DSAnyEvent], DSStoreError>) -> Void) {
        var e1 = DSEvent(startDate: Date(), endDate: Date())
        e1.title = "Встреча на эльбе"

        var e2 = DSEvent(startDate: Date(), endDate: Date())
        e2.title = "Встреча на эльбе"

        var e3 = DSEvent(startDate: Date(timeInterval: 24*60*60, since: Date()), endDate: Date())
        e3.title = "Шышли мышли Сопли вышли"
        
        var e4 = DSEvent(startDate: Date(timeInterval: 24*60*60, since: Date()), endDate: Date())
        e4.title = "Встреча на эльбе"
        
        var e5 = DSEvent(startDate: Date(timeInterval: 24*60*60, since: Date()), endDate: Date())
        e5.title = "Встреча где надо"

        completion(.success([e1, e2, e3, e4, e5]))
    }

    public func addEvents(_ events: [DSAnyEvent], callbackQueue: DispatchQueue = .main, completion: ((Result<[DSAnyEvent], DSStoreError>) -> Void)?) {
    }
    
    public func updateEvents(_ events: [DSAnyEvent], callbackQueue: DispatchQueue = .main, completion: ((Result<[DSAnyEvent], DSStoreError>) -> Void)?) {
    }
    
    public func deleteEvents(_ events: [DSAnyEvent], callbackQueue: DispatchQueue = .main, completion: ((Result<[DSAnyEvent], DSStoreError>) -> Void)?) {
    }

    public func fetchEventTypes(query: DSAnyQuery = DSEventQuery(), callbackQueue: DispatchQueue = .main, completion: @escaping (Result<[DSEventType], DSStoreError>) -> Void) {
        let eventTypes = [
            DSEventType(id: 1, name: "Очный визит", abbr: "Visit", group: "Визит к врачу"),
            DSEventType(id: 2, name: "Дистанционный визит", abbr: "Visit", group: "Визит к врачу"),
            DSEventType(id: 3, name: "Очный совместный визит", abbr: "Visit", group: "Визит к врачу"),
            DSEventType(id: 4, name: "Дистанционные совместные визиты", abbr: "Visit", group: "Визит к врачу"),

            DSEventType(id: 5, name: "Время в пути", abbr: "AdministrativeWork", group: "Внутреннее обучающее мероприятие"),
            DSEventType(id: 6, name: "Отпуск / Отгул / Больничный", abbr: "AdministrativeWork", group: "Внутреннее обучающее мероприятие"),
            DSEventType(id: 7, name: "Подготовка к визитам / внешним мероприятиям", abbr: "AdministrativeWork", group: "Внутреннее обучающее мероприятие"),
            DSEventType(id: 8, name: "Подготовка отчетности, документооборот (заведение лектора, закрытие ТМА и т.д.)", abbr: "AdministrativeWork", group: "Внутреннее обучающее мероприятие"),
            DSEventType(id: 9, name: "Сбор данных, аналитики, подготовка справки", abbr: "AdministrativeWork", group: "Внутреннее обучающее мероприятие"),
            DSEventType(id: 10, name: "Региональное бизнес ревью", abbr: "AdministrativeWork", group: "Внутреннее обучающее мероприятие"),
            DSEventType(id: 11, name: "Триады/Телефонные переговоры/планерки с коллегами", abbr: "AdministrativeWork", group: "Внутреннее обучающее мероприятие"),
            DSEventType(id: 12, name: "Тренинг/Коучинг (вне визита)", abbr: "AdministrativeWork", group: "Внутреннее обучающее мероприятие"),
            DSEventType(id: 13, name: "Цикловая конференция", abbr: "AdministrativeWork", group: "Внутреннее обучающее мероприятие"),
            DSEventType(id: 14, name: "Участие в ПРИБ/КИ", abbr: "AdministrativeWork", group: "Внутреннее обучающее мероприятие"),
            DSEventType(id: 15, name: "Ассесмент и подбор персонала", abbr: "AdministrativeWork", group: "Внутреннее обучающее мероприятие"),
            DSEventType(id: 16, name: "Cкрининговый визит", abbr: "AdministrativeWork", group: "Внутреннее обучающее мероприятие"),
            DSEventType(id: 17, name: "Другое", abbr: "AdministrativeWork", group: "Внутреннее обучающее мероприятие"),

            DSEventType(id: 18, name: "Участие во внешней конференции/круглом столе/вебинаре офлайн/онлайн", abbr: "Meeting", group: "Собрание")
        ]
        completion(.success(eventTypes))
    }
}

/*
"Visit"
"Очный визит",
"Дистанционный визит",
"Очный совместный визит",
"Дистанционные совместные визиты"
                        
"AdministrativeWork"
"Время в пути",
"Отпуск / Отгул / Больничный",
"Подготовка к визитам/ внешним мероприятиям",
"Подготовка отчетности, документооборот (заведение лектора, закрытие ТМА и т.д.)",
"Сбор данных, аналитики, подготовка справки",
"Региональное бизнес ревью",
"Триады/Телефонные переговоры/планерки с коллегами",
"Тренинг / Коучинг (вне визита)",
"Цикловая конференция",
"Участие в ПРИБ/КИ",
"Ассесмент и подбор персонала",
"Cкрининговый визит",
"Другое"
                        
                        
"Meeting"
"Участие во внешней конференции/круглом столе/вебинаре офлайн/онлайн"
*/
