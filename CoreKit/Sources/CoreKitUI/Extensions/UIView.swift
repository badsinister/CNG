
/**
 
 Создание массива NSLayoutConstraint для работы с Layout UIView.
 
 */

import UIKit

public struct LayoutDirection: OptionSet {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let top = LayoutDirection(rawValue: 1 << 0)
    public static let bottom = LayoutDirection(rawValue: 1 << 1)
    public static let leading = LayoutDirection(rawValue: 1 << 2)
    public static let trailing = LayoutDirection(rawValue: 1 << 3)
    
    public static let horizontal: LayoutDirection = [.leading, .trailing]
    public static let vertical: LayoutDirection = [.top, .bottom]
    
    public static let all: LayoutDirection = [.horizontal, .vertical]
}

public extension UIView {
    
    /// Создание массива NSLayoutConstraint эквивалентпого заданному UIView.
    /// - Parameters:
    ///   - other: UIView для соответствия которому будет построен массив NSLayoutConstraint
    ///   - directions: Тип Constraint. Определяется LayoutDirection: [.horizontal, .top]
    /// - Returns: Массив NSLayoutConstraint эквивалентный заданному UIView.
    func constraints(equalTo other: UIView, directions: LayoutDirection = .all) -> [NSLayoutConstraint] {
        var constraints: [NSLayoutConstraint] = []
        if directions.contains(.top) {
            constraints.append(topAnchor.constraint(equalTo: other.topAnchor))
        }
        if directions.contains(.leading) {
            constraints.append(leadingAnchor.constraint(equalTo: other.leadingAnchor))
        }
        if directions.contains(.bottom) {
            constraints.append(bottomAnchor.constraint(equalTo: other.bottomAnchor))
        }
        if directions.contains(.trailing) {
            constraints.append(trailingAnchor.constraint(equalTo: other.trailingAnchor))
        }
        return constraints
    }
    
    /// Создание массива NSLayoutConstraint эквивалентпого заданному UILayoutGuide.
    /// - Parameters:
    ///   - other: UILayoutGuide для соответствия которому будет построен массив NSLayoutConstraint
    ///   - directions: Тип Constraint. Определяется LayoutDirection: [.horizontal, .top]
    /// - Returns: Массив NSLayoutConstraint эквивалентный заданному UILayoutGuide.
    func constraints(equalTo layoutGuide: UILayoutGuide, directions: LayoutDirection = .all) -> [NSLayoutConstraint] {
        var constraints: [NSLayoutConstraint] = []
        if directions.contains(.top) {
            constraints.append(topAnchor.constraint(equalTo: layoutGuide.topAnchor))
        }
        if directions.contains(.leading) {
            constraints.append(leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor))
        }
        if directions.contains(.bottom) {
            constraints.append(bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor))
        }
        if directions.contains(.trailing) {
            constraints.append(trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor))
        }
        return constraints
    }

}
