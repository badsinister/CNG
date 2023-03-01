/**

 Знак приложения (логотип из левого меню)

 */

import UIKit
import CoreKitUI

final class CNGIconView: CKView {

    override init() {
        super.init(frame: CGRect(origin: .zero, size: CGSize(width: 33.0, height: 40.0)))
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }

    override func draw(_ rect: CGRect) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        // This non-generic function dramatically improves compilation times of complex expressions.
        func fastFloor(_ x: CGFloat) -> CGFloat { return floor(x) }

        //// Color Declarations
        let fillColor = style().color.white
        let fillColor2 = UIColor(red: 0.208, green: 0.231, blue: 0.286, alpha: 1.000)

        //// Subrects
        let group2: CGRect = CGRect(x: rect.minX + fastFloor(rect.width * 0.00000 + 0.5), y: rect.minY + fastFloor(rect.height * 0.00000 + 0.5), width: fastFloor(rect.width * 1.00200 + 0.43) - fastFloor(rect.width * 0.00000 + 0.5) + 0.07, height: fastFloor(rect.height * 0.99858 - 0.44) - fastFloor(rect.height * 0.00000 + 0.5) + 0.94)

        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: group2.minX + 0.95942 * group2.width, y: group2.minY + 0.19442 * group2.height))
        bezierPath.addCurve(to: CGPoint(x: group2.minX + 0.43252 * group2.width, y: group2.minY + 0.00537 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.86443 * group2.width, y: group2.minY + 0.05867 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.65428 * group2.width, y: group2.minY + -0.02218 * group2.height))
        bezierPath.addCurve(to: CGPoint(x: group2.minX + 0.07165 * group2.width, y: group2.minY + 0.18945 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.27425 * group2.width, y: group2.minY + 0.02501 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.14483 * group2.width, y: group2.minY + 0.09558 * group2.height))
        bezierPath.addCurve(to: CGPoint(x: group2.minX + 0.39751 * group2.width, y: group2.minY + 0.02803 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.14005 * group2.width, y: group2.minY + 0.10703 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.25634 * group2.width, y: group2.minY + 0.04555 * group2.height))
        bezierPath.addCurve(to: CGPoint(x: group2.minX + 0.89197 * group2.width, y: group2.minY + 0.21619 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.60929 * group2.width, y: group2.minY + 0.00172 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.80957 * group2.width, y: group2.minY + 0.08273 * group2.height))
        bezierPath.addLine(to: CGPoint(x: group2.minX + 0.85567 * group2.width, y: group2.minY + 0.22790 * group2.height))
        bezierPath.addLine(to: CGPoint(x: group2.minX + 0.95633 * group2.width, y: group2.minY + 0.25537 * group2.height))
        bezierPath.addLine(to: CGPoint(x: group2.minX + 1.00000 * group2.width, y: group2.minY + 0.18134 * group2.height))
        bezierPath.addLine(to: CGPoint(x: group2.minX + 0.95942 * group2.width, y: group2.minY + 0.19442 * group2.height))
        bezierPath.close()
        bezierPath.usesEvenOddFillRule = true
        fillColor.setFill()
        bezierPath.fill()

        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: group2.minX + 0.09932 * group2.width, y: group2.minY + 0.82168 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.63782 * group2.width, y: group2.minY + 0.99095 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.20296 * group2.width, y: group2.minY + 0.95376 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.41808 * group2.width, y: group2.minY + 1.02669 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.98635 * group2.width, y: group2.minY + 0.79369 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.79463 * group2.width, y: group2.minY + 0.96545 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.91934 * group2.width, y: group2.minY + 0.89017 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.67132 * group2.width, y: group2.minY + 0.96702 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.92337 * group2.width, y: group2.minY + 0.87855 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.81118 * group2.width, y: group2.minY + 0.94428 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.16528 * group2.width, y: group2.minY + 0.79745 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.46149 * group2.width, y: group2.minY + 1.00116 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.25622 * group2.width, y: group2.minY + 0.92770 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.20080 * group2.width, y: group2.minY + 0.78440 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.09849 * group2.width, y: group2.minY + 0.76070 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.05964 * group2.width, y: group2.minY + 0.83627 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.09932 * group2.width, y: group2.minY + 0.82168 * group2.height))
        bezier2Path.close()
        bezier2Path.usesEvenOddFillRule = true
        fillColor.setFill()
        bezier2Path.fill()

        //// Bezier 3 Drawing
        let bezier3Path = UIBezierPath()
        bezier3Path.move(to: CGPoint(x: group2.minX + 0.26463 * group2.width, y: group2.minY + 0.70511 * group2.height))
        bezier3Path.addCurve(to: CGPoint(x: group2.minX + 0.07415 * group2.width, y: group2.minY + 0.64883 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.18742 * group2.width, y: group2.minY + 0.70511 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.12333 * group2.width, y: group2.minY + 0.68618 * group2.height))
        bezier3Path.addCurve(to: CGPoint(x: group2.minX + 0.00000 * group2.width, y: group2.minY + 0.50464 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.02495 * group2.width, y: group2.minY + 0.61149 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.00000 * group2.width, y: group2.minY + 0.56299 * group2.height))
        bezier3Path.addCurve(to: CGPoint(x: group2.minX + 0.03377 * group2.width, y: group2.minY + 0.40350 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.00000 * group2.width, y: group2.minY + 0.46687 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.01136 * group2.width, y: group2.minY + 0.43284 * group2.height))
        bezier3Path.addCurve(to: CGPoint(x: group2.minX + 0.13047 * group2.width, y: group2.minY + 0.33234 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.05617 * group2.width, y: group2.minY + 0.37413 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.08871 * group2.width, y: group2.minY + 0.35019 * group2.height))
        bezier3Path.addCurve(to: CGPoint(x: group2.minX + 0.26597 * group2.width, y: group2.minY + 0.30544 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.17223 * group2.width, y: group2.minY + 0.31449 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.21782 * group2.width, y: group2.minY + 0.30544 * group2.height))
        bezier3Path.addCurve(to: CGPoint(x: group2.minX + 0.38484 * group2.width, y: group2.minY + 0.32532 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.30693 * group2.width, y: group2.minY + 0.30544 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.34693 * group2.width, y: group2.minY + 0.31213 * group2.height))
        bezier3Path.addCurve(to: CGPoint(x: group2.minX + 0.48336 * group2.width, y: group2.minY + 0.38185 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.42278 * group2.width, y: group2.minY + 0.33852 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.45592 * group2.width, y: group2.minY + 0.35754 * group2.height))
        bezier3Path.addLine(to: CGPoint(x: group2.minX + 0.48417 * group2.width, y: group2.minY + 0.38258 * group2.height))
        bezier3Path.addLine(to: CGPoint(x: group2.minX + 0.41619 * group2.width, y: group2.minY + 0.43198 * group2.height))
        bezier3Path.addLine(to: CGPoint(x: group2.minX + 0.41528 * group2.width, y: group2.minY + 0.43124 * group2.height))
        bezier3Path.addCurve(to: CGPoint(x: group2.minX + 0.26448 * group2.width, y: group2.minY + 0.37719 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.37079 * group2.width, y: group2.minY + 0.39538 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.32005 * group2.width, y: group2.minY + 0.37719 * group2.height))
        bezier3Path.addCurve(to: CGPoint(x: group2.minX + 0.14552 * group2.width, y: group2.minY + 0.41399 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.21763 * group2.width, y: group2.minY + 0.37719 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.17761 * group2.width, y: group2.minY + 0.38957 * group2.height))
        bezier3Path.addCurve(to: CGPoint(x: group2.minX + 0.09717 * group2.width, y: group2.minY + 0.50475 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.11344 * group2.width, y: group2.minY + 0.43843 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.09717 * group2.width, y: group2.minY + 0.46896 * group2.height))
        bezier3Path.addCurve(to: CGPoint(x: group2.minX + 0.11859 * group2.width, y: group2.minY + 0.57151 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.09717 * group2.width, y: group2.minY + 0.52972 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.10437 * group2.width, y: group2.minY + 0.55217 * group2.height))
        bezier3Path.addCurve(to: CGPoint(x: group2.minX + 0.17912 * group2.width, y: group2.minY + 0.61725 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.13279 * group2.width, y: group2.minY + 0.59085 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.15315 * group2.width, y: group2.minY + 0.60623 * group2.height))
        bezier3Path.addCurve(to: CGPoint(x: group2.minX + 0.26617 * group2.width, y: group2.minY + 0.63386 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.20510 * group2.width, y: group2.minY + 0.62827 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.23438 * group2.width, y: group2.minY + 0.63386 * group2.height))
        bezier3Path.addCurve(to: CGPoint(x: group2.minX + 0.34082 * group2.width, y: group2.minY + 0.62223 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.29329 * group2.width, y: group2.minY + 0.63386 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.31841 * group2.width, y: group2.minY + 0.62994 * group2.height))
        bezier3Path.addCurve(to: CGPoint(x: group2.minX + 0.41531 * group2.width, y: group2.minY + 0.57980 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.36327 * group2.width, y: group2.minY + 0.61451 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.38833 * group2.width, y: group2.minY + 0.60024 * group2.height))
        bezier3Path.addLine(to: CGPoint(x: group2.minX + 0.41627 * group2.width, y: group2.minY + 0.57907 * group2.height))
        bezier3Path.addLine(to: CGPoint(x: group2.minX + 0.48218 * group2.width, y: group2.minY + 0.63151 * group2.height))
        bezier3Path.addLine(to: CGPoint(x: group2.minX + 0.48125 * group2.width, y: group2.minY + 0.63221 * group2.height))
        bezier3Path.addCurve(to: CGPoint(x: group2.minX + 0.37688 * group2.width, y: group2.minY + 0.68920 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.44462 * group2.width, y: group2.minY + 0.65946 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.40950 * group2.width, y: group2.minY + 0.67864 * group2.height))
        bezier3Path.addCurve(to: CGPoint(x: group2.minX + 0.26463 * group2.width, y: group2.minY + 0.70511 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.34421 * group2.width, y: group2.minY + 0.69976 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.30644 * group2.width, y: group2.minY + 0.70511 * group2.height))
        bezier3Path.close()
        bezier3Path.usesEvenOddFillRule = true
        fillColor.setFill()
        bezier3Path.fill()

        //// Bezier 4 Drawing
        let bezier4Path = UIBezierPath()
        bezier4Path.move(to: CGPoint(x: group2.minX + 0.74193 * group2.width, y: group2.minY + 0.70511 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.60339 * group2.width, y: group2.minY + 0.67936 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.69041 * group2.width, y: group2.minY + 0.70511 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.64382 * group2.width, y: group2.minY + 0.69645 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.50703 * group2.width, y: group2.minY + 0.60602 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.56298 * group2.width, y: group2.minY + 0.66228 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.53055 * group2.width, y: group2.minY + 0.63761 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.47157 * group2.width, y: group2.minY + 0.50334 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.48351 * group2.width, y: group2.minY + 0.57446 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.47157 * group2.width, y: group2.minY + 0.53991 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.53706 * group2.width, y: group2.minY + 0.37192 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.47157 * group2.width, y: group2.minY + 0.45322 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.49360 * group2.width, y: group2.minY + 0.40900 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.73924 * group2.width, y: group2.minY + 0.30544 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.58860 * group2.width, y: group2.minY + 0.32780 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.65664 * group2.width, y: group2.minY + 0.30544 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.86095 * group2.width, y: group2.minY + 0.32379 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.78242 * group2.width, y: group2.minY + 0.30544 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.82337 * group2.width, y: group2.minY + 0.31162 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.95456 * group2.width, y: group2.minY + 0.37706 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.89272 * group2.width, y: group2.minY + 0.33411 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.92422 * group2.width, y: group2.minY + 0.35203 * group2.height))
        bezier4Path.addLine(to: CGPoint(x: group2.minX + 0.95543 * group2.width, y: group2.minY + 0.37777 * group2.height))
        bezier4Path.addLine(to: CGPoint(x: group2.minX + 0.88700 * group2.width, y: group2.minY + 0.42938 * group2.height))
        bezier4Path.addLine(to: CGPoint(x: group2.minX + 0.88607 * group2.width, y: group2.minY + 0.42862 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.73973 * group2.width, y: group2.minY + 0.37797 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.84440 * group2.width, y: group2.minY + 0.39501 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.79517 * group2.width, y: group2.minY + 0.37797 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.61785 * group2.width, y: group2.minY + 0.41475 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.69142 * group2.width, y: group2.minY + 0.37797 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.65042 * group2.width, y: group2.minY + 0.39035 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.56874 * group2.width, y: group2.minY + 0.50412 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.58525 * group2.width, y: group2.minY + 0.43915 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.56874 * group2.width, y: group2.minY + 0.46922 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.61970 * group2.width, y: group2.minY + 0.59632 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.56874 * group2.width, y: group2.minY + 0.54020 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.58589 * group2.width, y: group2.minY + 0.57123 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.74551 * group2.width, y: group2.minY + 0.63412 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.65353 * group2.width, y: group2.minY + 0.62140 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.69585 * group2.width, y: group2.minY + 0.63412 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.82743 * group2.width, y: group2.minY + 0.61857 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.77777 * group2.width, y: group2.minY + 0.63412 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.80534 * group2.width, y: group2.minY + 0.62889 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.88028 * group2.width, y: group2.minY + 0.57126 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.84904 * group2.width, y: group2.minY + 0.60850 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.86681 * group2.width, y: group2.minY + 0.59258 * group2.height))
        bezier4Path.addLine(to: CGPoint(x: group2.minX + 0.73725 * group2.width, y: group2.minY + 0.57126 * group2.height))
        bezier4Path.addLine(to: CGPoint(x: group2.minX + 0.73725 * group2.width, y: group2.minY + 0.50158 * group2.height))
        bezier4Path.addLine(to: CGPoint(x: group2.minX + 0.98964 * group2.width, y: group2.minY + 0.50158 * group2.height))
        bezier4Path.addLine(to: CGPoint(x: group2.minX + 0.99037 * group2.width, y: group2.minY + 0.51850 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.95642 * group2.width, y: group2.minY + 0.61323 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.99037 * group2.width, y: group2.minY + 0.55165 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.97894 * group2.width, y: group2.minY + 0.58351 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.86850 * group2.width, y: group2.minY + 0.68156 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.93391 * group2.width, y: group2.minY + 0.64293 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.90433 * group2.width, y: group2.minY + 0.66592 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.74193 * group2.width, y: group2.minY + 0.70511 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.83267 * group2.width, y: group2.minY + 0.69719 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.79010 * group2.width, y: group2.minY + 0.70511 * group2.height))
        bezier4Path.close()
        bezier4Path.usesEvenOddFillRule = true
        fillColor.setFill()
        bezier4Path.fill()

        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: group2.minX + fastFloor(group2.width * 0.34576 + 0.37) + 0.13, y: group2.minY + fastFloor(group2.height * 0.54240 + 0.13) + 0.37, width: fastFloor(group2.width * 0.67938 - 0.33) - fastFloor(group2.width * 0.34576 + 0.37) + 0.7, height: fastFloor(group2.height * 0.78052 + 0.43) - fastFloor(group2.height * 0.54240 + 0.13) - 0.3))
        fillColor2.setFill()
        ovalPath.fill()

        //// Group 3
        context.saveGState()
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        //// Clip Clip
        let clipPath = UIBezierPath()
        clipPath.move(to: CGPoint(x: group2.minX + 0.60441 * group2.width, y: group2.minY + 0.76253 * group2.height))
        clipPath.addLine(to: CGPoint(x: group2.minX + 0.57508 * group2.width, y: group2.minY + 0.76253 * group2.height))
        clipPath.addLine(to: CGPoint(x: group2.minX + 0.46367 * group2.width, y: group2.minY + 0.65176 * group2.height))
        clipPath.addLine(to: CGPoint(x: group2.minX + 0.46367 * group2.width, y: group2.minY + 0.76253 * group2.height))
        clipPath.addLine(to: CGPoint(x: group2.minX + 0.43434 * group2.width, y: group2.minY + 0.76253 * group2.height))
        clipPath.addLine(to: CGPoint(x: group2.minX + 0.43434 * group2.width, y: group2.minY + 0.61878 * group2.height))
        clipPath.addLine(to: CGPoint(x: group2.minX + 0.46367 * group2.width, y: group2.minY + 0.61878 * group2.height))
        clipPath.addLine(to: CGPoint(x: group2.minX + 0.57538 * group2.width, y: group2.minY + 0.73005 * group2.height))
        clipPath.addLine(to: CGPoint(x: group2.minX + 0.57538 * group2.width, y: group2.minY + 0.61878 * group2.height))
        clipPath.addLine(to: CGPoint(x: group2.minX + 0.60441 * group2.width, y: group2.minY + 0.61878 * group2.height))
        clipPath.addLine(to: CGPoint(x: group2.minX + 0.60441 * group2.width, y: group2.minY + 0.76253 * group2.height))
        clipPath.close()
        clipPath.usesEvenOddFillRule = true
        clipPath.addClip()

        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: CGRect(x: group2.minX + fastFloor(group2.width * 0.26379 + 0.25) + 0.25, y: group2.minY + fastFloor(group2.height * 0.50735 - 0.3) + 0.8, width: fastFloor(group2.width * 0.77562 + 0.3) - fastFloor(group2.width * 0.26379 + 0.25) - 0.05, height: fastFloor(group2.height * 0.87343 + 0.25) - fastFloor(group2.height * 0.50735 - 0.3) - 0.55))
        fillColor.setFill()
        rectanglePath.fill()

        context.endTransparencyLayer()
        context.restoreGState()
    }

}
