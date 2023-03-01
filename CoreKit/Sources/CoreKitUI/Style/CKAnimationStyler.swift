
/// Опредение значений дительности анимации.
public protocol CKAnimationStyler {
    var stateChangeDuration: Double { get }
}

/// Значения длительности анимации поумолчанию.
public extension CKAnimationStyler {
    var stateChangeDuration: Double { 0.2 }
}

/// Объект значений длительности анимацции.
public struct CKAnimationStyle: CKAnimationStyler {
    public init() {}
}
