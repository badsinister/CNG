
import UIKit
import SwiftUI

/// Определение параметров для стилизации.
public protocol CKStyler {
    var color: CKColorStyler { get }
    var animation: CKAnimationStyler { get }
    var appearance: CKAppearanceStyler { get }
    var dimension: CKDimensionStyler { get }
}

/// Определение значений параметров стилизации.
public extension CKStyler {
    var color: CKColorStyler { CKColorStyle() }
    var animation: CKAnimationStyler { CKAnimationStyle() }
    var appearance: CKAppearanceStyler { CKAppearanceStyle() }
    var dimension: CKDimensionStyler { CKDimensionStyle() }
}

// Объект стилизации.
public struct CKStyle: CKStyler {
    public init() {}
}

private struct StyleEnvironmentKey: EnvironmentKey {
    static var defaultValue: CKStyler = CKStyle()
}

// MARK: - SwiftUI

public extension EnvironmentValues {
    
    /// Объект стилизации который может использоваться в виде.
    var cartWheelStyle: CKStyler {
        get { self[StyleEnvironmentKey.self] }
        set { self[StyleEnvironmentKey.self] = newValue }
    }
}

public extension View {
    
    /// Предоставляет набор значений для форматирования внешнего вида View.
    /// - Parameter style: Объект стилизации с параметрами отображения вида.
    func cartWheelStyle(_ style: CKStyler) -> some View {
        return self.environment(\.cartWheelStyle, style)
    }
}
