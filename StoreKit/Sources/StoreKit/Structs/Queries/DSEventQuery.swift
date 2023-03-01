/**
 
 Протокол запроса событий из хранилища.
 
 */

import Foundation

/// Данные запроса для извлечения событий из хранилища.
public struct DSEventQuery: DSAnyQuery, Equatable {
    
    /// Временной интервал за который происходит выборка.
    public var dateInterval: DateInterval?
    
    /// Список уникальных идентификаторов для выборки.
    public var ids: [String] = []
    
    /// Количество элементов для выборки.
    public var limit: Int?

    public init() { }

    /// Создает новый `DSEventQuery` для заданного временного интервала.
    ///
    /// - Parameters:
    ///   - dateInterval: Временной интервал за который происходит выборка.
    public init(dateInterval: DateInterval) {
        self.dateInterval = dateInterval
    }
    
    /// Создает новый `DSEventQuery` для выбора событий за конкретную дату, продолжительность выборки сутки.
    ///
    /// - Parameters:
    ///   - date: Дата для который происходит выборка с 00:00 до 23:59.
    public init(for date: Date) {
        let startDate = Calendar.current.startOfDay(for: date)
        let endDate = Calendar.current.date(byAdding: DateComponents(day: 1, second: -1), to: startDate)!
        self = Self(dateInterval: DateInterval(start: startDate, end: endDate))
    }
    
}
