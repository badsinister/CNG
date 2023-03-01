/**
 
 Типовое событие.
 Событие происходит во времени, определяется датой начала и окончания.
 
 */

import Foundation
import CoreLocation

/// Событие.
public protocol DSAnyEvent {
    
    /// Дата начала события.
    var startDate: Date { get set }
    
    /// Дата окончания события.
    var endDate: Date { get set }
    
    /// Признак события занимающего весь день.
    /// Для такого собыия время начала всегда 00:00, время окончания 23:59
    var isAllDay: Bool { get set }
    
    /// Название события.
    var title: String? { get set }
    
    /// Описание события.
    var details: String? { get set }
    
    /// Координаты события.
    var coordinate: CLLocationCoordinate2D? { get }
    
}
