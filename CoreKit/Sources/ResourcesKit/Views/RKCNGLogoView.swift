/**
 
 Логотип приложения
 
 */

import UIKit

public class RKCNGLogoView: UIView {
    
    public init() {
        super.init(frame: .zero)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        // This non-generic function dramatically improves compilation times of complex expressions.
        func fastFloor(_ x: CGFloat) -> CGFloat { return floor(x) }
        
        //// Color Declarations
        let fillColor3 = UIColor(red: 0.538, green: 0.133, blue: 0.145, alpha: 1.000)
        let fillColor4 = UIColor(red: 0.878, green: 0.370, blue: 0.168, alpha: 1.000)
        
        //// Subrects
        let group: CGRect = CGRect(x: rect.minX + fastFloor(rect.width * 0.00000 + 0.5), y: rect.minY + fastFloor(rect.height * 0.00000 + 0.5), width: fastFloor(rect.width * 0.99594 + 0.34) - fastFloor(rect.width * 0.00000 + 0.5) + 0.16, height: fastFloor(rect.height * 0.99469 - 0.06) - fastFloor(rect.height * 0.00000 + 0.5) + 0.56)
        
        //// Group
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: group.minX + 0.27785 * group.width, y: group.minY + 0.34852 * group.height))
        bezierPath.addCurve(to: CGPoint(x: group.minX + 0.23972 * group.width, y: group.minY + 0.31611 * group.height), controlPoint1: CGPoint(x: group.minX + 0.26695 * group.width, y: group.minY + 0.32763 * group.height), controlPoint2: CGPoint(x: group.minX + 0.25355 * group.width, y: group.minY + 0.31611 * group.height))
        bezierPath.addCurve(to: CGPoint(x: group.minX + 0.20161 * group.width, y: group.minY + 0.34846 * group.height), controlPoint1: CGPoint(x: group.minX + 0.22590 * group.width, y: group.minY + 0.31611 * group.height), controlPoint2: CGPoint(x: group.minX + 0.21250 * group.width, y: group.minY + 0.32762 * group.height))
        bezierPath.addLine(to: CGPoint(x: group.minX + 0.20787 * group.width, y: group.minY + 0.36461 * group.height))
        bezierPath.addCurve(to: CGPoint(x: group.minX + 0.23972 * group.width, y: group.minY + 0.33834 * group.height), controlPoint1: CGPoint(x: group.minX + 0.21703 * group.width, y: group.minY + 0.34767 * group.height), controlPoint2: CGPoint(x: group.minX + 0.22823 * group.width, y: group.minY + 0.33834 * group.height))
        bezierPath.addCurve(to: CGPoint(x: group.minX + 0.27159 * group.width, y: group.minY + 0.36465 * group.height), controlPoint1: CGPoint(x: group.minX + 0.25122 * group.width, y: group.minY + 0.33834 * group.height), controlPoint2: CGPoint(x: group.minX + 0.26242 * group.width, y: group.minY + 0.34770 * group.height))
        bezierPath.addLine(to: CGPoint(x: group.minX + 0.27785 * group.width, y: group.minY + 0.34852 * group.height))
        bezierPath.close()
        bezierPath.usesEvenOddFillRule = true
        fillColor3.setFill()
        bezierPath.fill()

        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: group.minX + 0.23972 * group.width, y: group.minY + 0.27546 * group.height))
        bezier2Path.addCurve(to: CGPoint(x: group.minX + 0.18910 * group.width, y: group.minY + 0.31622 * group.height), controlPoint1: CGPoint(x: group.minX + 0.22142 * group.width, y: group.minY + 0.27546 * group.height), controlPoint2: CGPoint(x: group.minX + 0.20375 * group.width, y: group.minY + 0.28984 * group.height))
        bezier2Path.addLine(to: CGPoint(x: group.minX + 0.19539 * group.width, y: group.minY + 0.33243 * group.height))
        bezier2Path.addCurve(to: CGPoint(x: group.minX + 0.23972 * group.width, y: group.minY + 0.29769 * group.height), controlPoint1: CGPoint(x: group.minX + 0.20831 * group.width, y: group.minY + 0.30992 * group.height), controlPoint2: CGPoint(x: group.minX + 0.22378 * group.width, y: group.minY + 0.29769 * group.height))
        bezier2Path.addCurve(to: CGPoint(x: group.minX + 0.28407 * group.width, y: group.minY + 0.33248 * group.height), controlPoint1: CGPoint(x: group.minX + 0.25568 * group.width, y: group.minY + 0.29769 * group.height), controlPoint2: CGPoint(x: group.minX + 0.27114 * group.width, y: group.minY + 0.30994 * group.height))
        bezier2Path.addLine(to: CGPoint(x: group.minX + 0.29036 * group.width, y: group.minY + 0.31625 * group.height))
        bezier2Path.addCurve(to: CGPoint(x: group.minX + 0.23972 * group.width, y: group.minY + 0.27546 * group.height), controlPoint1: CGPoint(x: group.minX + 0.27570 * group.width, y: group.minY + 0.28985 * group.height), controlPoint2: CGPoint(x: group.minX + 0.25803 * group.width, y: group.minY + 0.27546 * group.height))
        bezier2Path.close()
        bezier2Path.usesEvenOddFillRule = true
        fillColor3.setFill()
        bezier2Path.fill()

        //// Bezier 3 Drawing
        let bezier3Path = UIBezierPath()
        bezier3Path.move(to: CGPoint(x: group.minX + 0.92352 * group.width, y: group.minY + 0.59528 * group.height))
        bezier3Path.addLine(to: CGPoint(x: group.minX + 0.93970 * group.width, y: group.minY + 0.55553 * group.height))
        bezier3Path.addLine(to: CGPoint(x: group.minX + 0.92379 * group.width, y: group.minY + 0.51647 * group.height))
        bezier3Path.addLine(to: CGPoint(x: group.minX + 0.92937 * group.width, y: group.minY + 0.50277 * group.height))
        bezier3Path.addLine(to: CGPoint(x: group.minX + 0.95085 * group.width, y: group.minY + 0.55553 * group.height))
        bezier3Path.addLine(to: CGPoint(x: group.minX + 0.92909 * group.width, y: group.minY + 0.60896 * group.height))
        bezier3Path.addLine(to: CGPoint(x: group.minX + 0.92352 * group.width, y: group.minY + 0.59528 * group.height))
        bezier3Path.close()
        bezier3Path.usesEvenOddFillRule = true
        fillColor4.setFill()
        bezier3Path.fill()
        
        //// Bezier 4 Drawing
        let bezier4Path = UIBezierPath()
        bezier4Path.move(to: CGPoint(x: group.minX + 0.72165 * group.width, y: group.minY + 0.22439 * group.height))
        bezier4Path.addCurve(to: CGPoint(x: group.minX + 0.53386 * group.width, y: group.minY + 0.00619 * group.height), controlPoint1: CGPoint(x: group.minX + 0.68780 * group.width, y: group.minY + 0.06771 * group.height), controlPoint2: CGPoint(x: group.minX + 0.61290 * group.width, y: group.minY + -0.02560 * group.height))
        bezier4Path.addCurve(to: CGPoint(x: group.minX + 0.40525 * group.width, y: group.minY + 0.21865 * group.height), controlPoint1: CGPoint(x: group.minX + 0.47745 * group.width, y: group.minY + 0.02887 * group.height), controlPoint2: CGPoint(x: group.minX + 0.43133 * group.width, y: group.minY + 0.11031 * group.height))
        bezier4Path.addCurve(to: CGPoint(x: group.minX + 0.52139 * group.width, y: group.minY + 0.03235 * group.height), controlPoint1: CGPoint(x: group.minX + 0.42963 * group.width, y: group.minY + 0.12352 * group.height), controlPoint2: CGPoint(x: group.minX + 0.47107 * group.width, y: group.minY + 0.05257 * group.height))
        bezier4Path.addCurve(to: CGPoint(x: group.minX + 0.69761 * group.width, y: group.minY + 0.24950 * group.height), controlPoint1: CGPoint(x: group.minX + 0.59687 * group.width, y: group.minY + 0.00199 * group.height), controlPoint2: CGPoint(x: group.minX + 0.66824 * group.width, y: group.minY + 0.09548 * group.height))
        bezier4Path.addLine(to: CGPoint(x: group.minX + 0.68467 * group.width, y: group.minY + 0.26302 * group.height))
        bezier4Path.addLine(to: CGPoint(x: group.minX + 0.72055 * group.width, y: group.minY + 0.29472 * group.height))
        bezier4Path.addLine(to: CGPoint(x: group.minX + 0.73612 * group.width, y: group.minY + 0.20928 * group.height))
        bezier4Path.addLine(to: CGPoint(x: group.minX + 0.72165 * group.width, y: group.minY + 0.22439 * group.height))
        bezier4Path.close()
        bezier4Path.usesEvenOddFillRule = true
        fillColor3.setFill()
        bezier4Path.fill()
        
        //// Group 3
        context.saveGState()
        context.beginTransparencyLayer(auxiliaryInfo: nil)
        
        //// Clip Clip
        let clipPath = UIBezierPath()
        clipPath.move(to: CGPoint(x: group.minX + 0.41511 * group.width, y: group.minY + 0.78915 * group.height))
        clipPath.addCurve(to: CGPoint(x: group.minX + 0.60703 * group.width, y: group.minY + 0.98930 * group.height), controlPoint1: CGPoint(x: group.minX + 0.45205 * group.width, y: group.minY + 0.94532 * group.height), controlPoint2: CGPoint(x: group.minX + 0.52872 * group.width, y: group.minY + 1.03156 * group.height))
        clipPath.addCurve(to: CGPoint(x: group.minX + 0.73125 * group.width, y: group.minY + 0.75606 * group.height), controlPoint1: CGPoint(x: group.minX + 0.66292 * group.width, y: group.minY + 0.95915 * group.height), controlPoint2: CGPoint(x: group.minX + 0.70737 * group.width, y: group.minY + 0.87013 * group.height))
        clipPath.addCurve(to: CGPoint(x: group.minX + 0.61897 * group.width, y: group.minY + 0.96100 * group.height), controlPoint1: CGPoint(x: group.minX + 0.70880 * group.width, y: group.minY + 0.85640 * group.height), controlPoint2: CGPoint(x: group.minX + 0.66882 * group.width, y: group.minY + 0.93412 * group.height))
        clipPath.addCurve(to: CGPoint(x: group.minX + 0.43862 * group.width, y: group.minY + 0.76051 * group.height), controlPoint1: CGPoint(x: group.minX + 0.54419 * group.width, y: group.minY + 1.00137 * group.height), controlPoint2: CGPoint(x: group.minX + 0.47103 * group.width, y: group.minY + 0.91451 * group.height))
        clipPath.addLine(to: CGPoint(x: group.minX + 0.45128 * group.width, y: group.minY + 0.74507 * group.height))
        clipPath.addLine(to: CGPoint(x: group.minX + 0.41482 * group.width, y: group.minY + 0.71705 * group.height))
        clipPath.addLine(to: CGPoint(x: group.minX + 0.40097 * group.width, y: group.minY + 0.80641 * group.height))
        clipPath.addLine(to: CGPoint(x: group.minX + 0.41511 * group.width, y: group.minY + 0.78915 * group.height))
        clipPath.close()
        clipPath.usesEvenOddFillRule = true
        clipPath.addClip()
        
        //// Rectangle 2 Drawing
        let rectangle2Path = UIBezierPath(rect: CGRect(x: group.minX + fastFloor(group.width * 0.37665 + 0.22) + 0.28, y: group.minY + fastFloor(group.height * 0.65592) + 0.5, width: fastFloor(group.width * 0.75561 + 0.47) - fastFloor(group.width * 0.37665 + 0.22) - 0.25, height: fastFloor(group.height * 1.06173 - 0.1) - fastFloor(group.height * 0.65592) + 0.1))
        fillColor4.setFill()
        rectangle2Path.fill()
        
        context.endTransparencyLayer()
        context.restoreGState()
        
        //// Bezier 6 Drawing
        let bezier6Path = UIBezierPath()
        bezier6Path.move(to: CGPoint(x: group.minX + 0.08842 * group.width, y: group.minY + 0.71846 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.02477 * group.width, y: group.minY + 0.65757 * group.height), controlPoint1: CGPoint(x: group.minX + 0.06262 * group.width, y: group.minY + 0.71846 * group.height), controlPoint2: CGPoint(x: group.minX + 0.04121 * group.width, y: group.minY + 0.69798 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.00000 * group.width, y: group.minY + 0.50156 * group.height), controlPoint1: CGPoint(x: group.minX + 0.00834 * group.width, y: group.minY + 0.61718 * group.height), controlPoint2: CGPoint(x: group.minX + 0.00000 * group.width, y: group.minY + 0.56469 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.01128 * group.width, y: group.minY + 0.39213 * group.height), controlPoint1: CGPoint(x: group.minX + 0.00000 * group.width, y: group.minY + 0.46070 * group.height), controlPoint2: CGPoint(x: group.minX + 0.00380 * group.width, y: group.minY + 0.42388 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.04359 * group.width, y: group.minY + 0.31515 * group.height), controlPoint1: CGPoint(x: group.minX + 0.01877 * group.width, y: group.minY + 0.36037 * group.height), controlPoint2: CGPoint(x: group.minX + 0.02964 * group.width, y: group.minY + 0.33446 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.08887 * group.width, y: group.minY + 0.28604 * group.height), controlPoint1: CGPoint(x: group.minX + 0.05755 * group.width, y: group.minY + 0.29584 * group.height), controlPoint2: CGPoint(x: group.minX + 0.07278 * group.width, y: group.minY + 0.28604 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.12859 * group.width, y: group.minY + 0.30756 * group.height), controlPoint1: CGPoint(x: group.minX + 0.10255 * group.width, y: group.minY + 0.28604 * group.height), controlPoint2: CGPoint(x: group.minX + 0.11592 * group.width, y: group.minY + 0.29328 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.16150 * group.width, y: group.minY + 0.36871 * group.height), controlPoint1: CGPoint(x: group.minX + 0.14126 * group.width, y: group.minY + 0.32183 * group.height), controlPoint2: CGPoint(x: group.minX + 0.15233 * group.width, y: group.minY + 0.34241 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.16177 * group.width, y: group.minY + 0.36950 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.13906 * group.width, y: group.minY + 0.42295 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.13876 * group.width, y: group.minY + 0.42215 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.08837 * group.width, y: group.minY + 0.36367 * group.height), controlPoint1: CGPoint(x: group.minX + 0.12389 * group.width, y: group.minY + 0.38335 * group.height), controlPoint2: CGPoint(x: group.minX + 0.10694 * group.width, y: group.minY + 0.36367 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.04862 * group.width, y: group.minY + 0.40349 * group.height), controlPoint1: CGPoint(x: group.minX + 0.07272 * group.width, y: group.minY + 0.36367 * group.height), controlPoint2: CGPoint(x: group.minX + 0.05934 * group.width, y: group.minY + 0.37707 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.03247 * group.width, y: group.minY + 0.50169 * group.height), controlPoint1: CGPoint(x: group.minX + 0.03790 * group.width, y: group.minY + 0.42994 * group.height), controlPoint2: CGPoint(x: group.minX + 0.03247 * group.width, y: group.minY + 0.46297 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.03962 * group.width, y: group.minY + 0.57392 * group.height), controlPoint1: CGPoint(x: group.minX + 0.03247 * group.width, y: group.minY + 0.52870 * group.height), controlPoint2: CGPoint(x: group.minX + 0.03487 * group.width, y: group.minY + 0.55300 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.05985 * group.width, y: group.minY + 0.62341 * group.height), controlPoint1: CGPoint(x: group.minX + 0.04437 * group.width, y: group.minY + 0.59484 * group.height), controlPoint2: CGPoint(x: group.minX + 0.05117 * group.width, y: group.minY + 0.61148 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.08893 * group.width, y: group.minY + 0.64138 * group.height), controlPoint1: CGPoint(x: group.minX + 0.06853 * group.width, y: group.minY + 0.63533 * group.height), controlPoint2: CGPoint(x: group.minX + 0.07831 * group.width, y: group.minY + 0.64138 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.11388 * group.width, y: group.minY + 0.62879 * group.height), controlPoint1: CGPoint(x: group.minX + 0.09800 * group.width, y: group.minY + 0.64138 * group.height), controlPoint2: CGPoint(x: group.minX + 0.10639 * group.width, y: group.minY + 0.63714 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.13876 * group.width, y: group.minY + 0.58289 * group.height), controlPoint1: CGPoint(x: group.minX + 0.12138 * group.width, y: group.minY + 0.62045 * group.height), controlPoint2: CGPoint(x: group.minX + 0.12975 * group.width, y: group.minY + 0.60500 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.13909 * group.width, y: group.minY + 0.58209 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.16111 * group.width, y: group.minY + 0.63884 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.16080 * group.width, y: group.minY + 0.63959 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.12592 * group.width, y: group.minY + 0.70125 * group.height), controlPoint1: CGPoint(x: group.minX + 0.14856 * group.width, y: group.minY + 0.66908 * group.height), controlPoint2: CGPoint(x: group.minX + 0.13682 * group.width, y: group.minY + 0.68983 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.08842 * group.width, y: group.minY + 0.71846 * group.height), controlPoint1: CGPoint(x: group.minX + 0.11501 * group.width, y: group.minY + 0.71267 * group.height), controlPoint2: CGPoint(x: group.minX + 0.10239 * group.width, y: group.minY + 0.71846 * group.height))
        bezier6Path.close()
        bezier6Path.usesEvenOddFillRule = true
        fillColor3.setFill()
        bezier6Path.fill()

        //// Bezier 7 Drawing
        let bezier7Path = UIBezierPath()
        bezier7Path.move(to: CGPoint(x: group.minX + 0.24043 * group.width, y: group.minY + 0.46755 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.21458 * group.width, y: group.minY + 0.49217 * group.height), controlPoint1: CGPoint(x: group.minX + 0.23010 * group.width, y: group.minY + 0.46755 * group.height), controlPoint2: CGPoint(x: group.minX + 0.22140 * group.width, y: group.minY + 0.47583 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.20431 * group.width, y: group.minY + 0.55530 * group.height), controlPoint1: CGPoint(x: group.minX + 0.20777 * group.width, y: group.minY + 0.50850 * group.height), controlPoint2: CGPoint(x: group.minX + 0.20431 * group.width, y: group.minY + 0.52975 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.21477 * group.width, y: group.minY + 0.61914 * group.height), controlPoint1: CGPoint(x: group.minX + 0.20431 * group.width, y: group.minY + 0.58107 * group.height), controlPoint2: CGPoint(x: group.minX + 0.20783 * group.width, y: group.minY + 0.60255 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.24055 * group.width, y: group.minY + 0.64417 * group.height), controlPoint1: CGPoint(x: group.minX + 0.22172 * group.width, y: group.minY + 0.63575 * group.height), controlPoint2: CGPoint(x: group.minX + 0.23040 * group.width, y: group.minY + 0.64417 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.26678 * group.width, y: group.minY + 0.61954 * group.height), controlPoint1: CGPoint(x: group.minX + 0.25105 * group.width, y: group.minY + 0.64417 * group.height), controlPoint2: CGPoint(x: group.minX + 0.25987 * group.width, y: group.minY + 0.63589 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.27718 * group.width, y: group.minY + 0.55502 * group.height), controlPoint1: CGPoint(x: group.minX + 0.27368 * group.width, y: group.minY + 0.60323 * group.height), controlPoint2: CGPoint(x: group.minX + 0.27718 * group.width, y: group.minY + 0.58152 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.26678 * group.width, y: group.minY + 0.49176 * group.height), controlPoint1: CGPoint(x: group.minX + 0.27718 * group.width, y: group.minY + 0.52909 * group.height), controlPoint2: CGPoint(x: group.minX + 0.27368 * group.width, y: group.minY + 0.50781 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.24043 * group.width, y: group.minY + 0.46755 * group.height), controlPoint1: CGPoint(x: group.minX + 0.25987 * group.width, y: group.minY + 0.47569 * group.height), controlPoint2: CGPoint(x: group.minX + 0.25101 * group.width, y: group.minY + 0.46755 * group.height))
        bezier7Path.close()
        bezier7Path.move(to: CGPoint(x: group.minX + 0.23451 * group.width, y: group.minY + 0.71595 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.18885 * group.width, y: group.minY + 0.67013 * group.height), controlPoint1: CGPoint(x: group.minX + 0.21699 * group.width, y: group.minY + 0.71595 * group.height), controlPoint2: CGPoint(x: group.minX + 0.20163 * group.width, y: group.minY + 0.70054 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.16958 * group.width, y: group.minY + 0.55615 * group.height), controlPoint1: CGPoint(x: group.minX + 0.17607 * group.width, y: group.minY + 0.63970 * group.height), controlPoint2: CGPoint(x: group.minX + 0.16958 * group.width, y: group.minY + 0.60134 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.18823 * group.width, y: group.minY + 0.44035 * group.height), controlPoint1: CGPoint(x: group.minX + 0.16958 * group.width, y: group.minY + 0.50928 * group.height), controlPoint2: CGPoint(x: group.minX + 0.17586 * group.width, y: group.minY + 0.47032 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.23351 * group.width, y: group.minY + 0.39521 * group.height), controlPoint1: CGPoint(x: group.minX + 0.20060 * group.width, y: group.minY + 0.41040 * group.height), controlPoint2: CGPoint(x: group.minX + 0.21584 * group.width, y: group.minY + 0.39521 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.25654 * group.width, y: group.minY + 0.40558 * group.height), controlPoint1: CGPoint(x: group.minX + 0.24164 * group.width, y: group.minY + 0.39521 * group.height), controlPoint2: CGPoint(x: group.minX + 0.24939 * group.width, y: group.minY + 0.39870 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.27569 * group.width, y: group.minY + 0.43504 * group.height), controlPoint1: CGPoint(x: group.minX + 0.26338 * group.width, y: group.minY + 0.41218 * group.height), controlPoint2: CGPoint(x: group.minX + 0.26982 * group.width, y: group.minY + 0.42209 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.27569 * group.width, y: group.minY + 0.40301 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.31054 * group.width, y: group.minY + 0.40301 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.31054 * group.width, y: group.minY + 0.70816 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.27569 * group.width, y: group.minY + 0.70816 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.27569 * group.width, y: group.minY + 0.67742 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.25635 * group.width, y: group.minY + 0.70656 * group.height), controlPoint1: CGPoint(x: group.minX + 0.26928 * group.width, y: group.minY + 0.69076 * group.height), controlPoint2: CGPoint(x: group.minX + 0.26278 * group.width, y: group.minY + 0.70056 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.23451 * group.width, y: group.minY + 0.71595 * group.height), controlPoint1: CGPoint(x: group.minX + 0.24967 * group.width, y: group.minY + 0.71279 * group.height), controlPoint2: CGPoint(x: group.minX + 0.24232 * group.width, y: group.minY + 0.71595 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.23451 * group.width, y: group.minY + 0.71595 * group.height))
        bezier7Path.close()
        bezier7Path.usesEvenOddFillRule = true
        fillColor3.setFill()
        bezier7Path.fill()

        //// Rectangle 3 Drawing
        let rectangle3Path = UIBezierPath(rect: CGRect(x: group.minX + fastFloor(group.width * 0.33412 - 0.05) + 0.55, y: group.minY + fastFloor(group.height * 0.29332 - 0.43) + 0.93, width: fastFloor(group.width * 0.36580 + 0.45) - fastFloor(group.width * 0.33412 - 0.05) - 0.5, height: fastFloor(group.height * 0.70098 + 0.32) - fastFloor(group.height * 0.29332 - 0.43) - 0.75))
        fillColor3.setFill()
        rectangle3Path.fill()

        //// Rectangle 4 Drawing
        let rectangle4Path = UIBezierPath(rect: CGRect(x: group.minX + fastFloor(group.width * 0.38944 - 0.4) + 0.9, y: group.minY + fastFloor(group.height * 0.29332 - 0.43) + 0.93, width: fastFloor(group.width * 0.42113 + 0.1) - fastFloor(group.width * 0.38944 - 0.4) - 0.5, height: fastFloor(group.height * 0.70098 + 0.32) - fastFloor(group.height * 0.29332 - 0.43) - 0.75))
        fillColor3.setFill()
        rectangle4Path.fill()

        //// Rectangle 5 Drawing
        let rectangle5Path = UIBezierPath(rect: CGRect(x: group.minX + fastFloor(group.width * 0.43526 + 0.2) + 0.3, y: group.minY + fastFloor(group.height * 0.50757 + 0.1) + 0.4, width: fastFloor(group.width * 0.47718 - 0.4) - fastFloor(group.width * 0.43526 + 0.2) + 0.6, height: fastFloor(group.height * 0.58236) - fastFloor(group.height * 0.50757 + 0.1) + 0.1))
        fillColor3.setFill()
        rectangle5Path.fill()

        //// Rectangle 6 Drawing
        let rectangle6Path = UIBezierPath(rect: CGRect(x: group.minX + fastFloor(group.width * 0.61621 + 0.08) + 0.42, y: group.minY + fastFloor(group.height * 0.50757 + 0.1) + 0.4, width: fastFloor(group.width * 0.66812 + 0.43) - fastFloor(group.width * 0.61621 + 0.08) - 0.35, height: fastFloor(group.height * 0.58236) - fastFloor(group.height * 0.50757 + 0.1) + 0.1))
        fillColor3.setFill()
        rectangle6Path.fill()

        //// Bezier 8 Drawing
        let bezier8Path = UIBezierPath()
        bezier8Path.move(to: CGPoint(x: group.minX + 0.56976 * group.width, y: group.minY + 0.70816 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.56976 * group.width, y: group.minY + 0.57439 * group.height))
        bezier8Path.addCurve(to: CGPoint(x: group.minX + 0.56781 * group.width, y: group.minY + 0.50264 * group.height), controlPoint1: CGPoint(x: group.minX + 0.56976 * group.width, y: group.minY + 0.53852 * group.height), controlPoint2: CGPoint(x: group.minX + 0.56911 * group.width, y: group.minY + 0.51437 * group.height))
        bezier8Path.addCurve(to: CGPoint(x: group.minX + 0.56110 * group.width, y: group.minY + 0.47610 * group.height), controlPoint1: CGPoint(x: group.minX + 0.56653 * group.width, y: group.minY + 0.49104 * group.height), controlPoint2: CGPoint(x: group.minX + 0.56427 * group.width, y: group.minY + 0.48211 * group.height))
        bezier8Path.addCurve(to: CGPoint(x: group.minX + 0.54928 * group.width, y: group.minY + 0.46699 * group.height), controlPoint1: CGPoint(x: group.minX + 0.55793 * group.width, y: group.minY + 0.47005 * group.height), controlPoint2: CGPoint(x: group.minX + 0.55395 * group.width, y: group.minY + 0.46699 * group.height))
        bezier8Path.addCurve(to: CGPoint(x: group.minX + 0.53355 * group.width, y: group.minY + 0.48215 * group.height), controlPoint1: CGPoint(x: group.minX + 0.54320 * group.width, y: group.minY + 0.46699 * group.height), controlPoint2: CGPoint(x: group.minX + 0.53791 * group.width, y: group.minY + 0.47209 * group.height))
        bezier8Path.addCurve(to: CGPoint(x: group.minX + 0.52439 * group.width, y: group.minY + 0.52430 * group.height), controlPoint1: CGPoint(x: group.minX + 0.52917 * group.width, y: group.minY + 0.49224 * group.height), controlPoint2: CGPoint(x: group.minX + 0.52609 * group.width, y: group.minY + 0.50642 * group.height))
        bezier8Path.addCurve(to: CGPoint(x: group.minX + 0.52306 * group.width, y: group.minY + 0.58552 * group.height), controlPoint1: CGPoint(x: group.minX + 0.52351 * group.width, y: group.minY + 0.53361 * group.height), controlPoint2: CGPoint(x: group.minX + 0.52306 * group.width, y: group.minY + 0.55421 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.52306 * group.width, y: group.minY + 0.70816 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.49138 * group.width, y: group.minY + 0.70816 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.49138 * group.width, y: group.minY + 0.40301 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.52306 * group.width, y: group.minY + 0.40301 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.52306 * group.width, y: group.minY + 0.43281 * group.height))
        bezier8Path.addCurve(to: CGPoint(x: group.minX + 0.54142 * group.width, y: group.minY + 0.40380 * group.height), controlPoint1: CGPoint(x: group.minX + 0.52976 * group.width, y: group.minY + 0.41905 * group.height), controlPoint2: CGPoint(x: group.minX + 0.53594 * group.width, y: group.minY + 0.40929 * group.height))
        bezier8Path.addCurve(to: CGPoint(x: group.minX + 0.55899 * group.width, y: group.minY + 0.39521 * group.height), controlPoint1: CGPoint(x: group.minX + 0.54712 * group.width, y: group.minY + 0.39809 * group.height), controlPoint2: CGPoint(x: group.minX + 0.55303 * group.width, y: group.minY + 0.39521 * group.height))
        bezier8Path.addCurve(to: CGPoint(x: group.minX + 0.59028 * group.width, y: group.minY + 0.42700 * group.height), controlPoint1: CGPoint(x: group.minX + 0.57122 * group.width, y: group.minY + 0.39521 * group.height), controlPoint2: CGPoint(x: group.minX + 0.58174 * group.width, y: group.minY + 0.40590 * group.height))
        bezier8Path.addCurve(to: CGPoint(x: group.minX + 0.60110 * group.width, y: group.minY + 0.50685 * group.height), controlPoint1: CGPoint(x: group.minX + 0.59746 * group.width, y: group.minY + 0.44495 * group.height), controlPoint2: CGPoint(x: group.minX + 0.60110 * group.width, y: group.minY + 0.47181 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.60110 * group.width, y: group.minY + 0.70816 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.56976 * group.width, y: group.minY + 0.70816 * group.height))
        bezier8Path.close()
        bezier8Path.usesEvenOddFillRule = true
        fillColor3.setFill()
        bezier8Path.fill()

        //// Bezier 9 Drawing
        let bezier9Path = UIBezierPath()
        bezier9Path.move(to: CGPoint(x: group.minX + 0.77460 * group.width, y: group.minY + 0.71846 * group.height))
        bezier9Path.addCurve(to: CGPoint(x: group.minX + 0.72831 * group.width, y: group.minY + 0.69061 * group.height), controlPoint1: CGPoint(x: group.minX + 0.75739 * group.width, y: group.minY + 0.71846 * group.height), controlPoint2: CGPoint(x: group.minX + 0.74182 * group.width, y: group.minY + 0.70910 * group.height))
        bezier9Path.addCurve(to: CGPoint(x: group.minX + 0.69611 * group.width, y: group.minY + 0.61126 * group.height), controlPoint1: CGPoint(x: group.minX + 0.71481 * group.width, y: group.minY + 0.67213 * group.height), controlPoint2: CGPoint(x: group.minX + 0.70397 * group.width, y: group.minY + 0.64543 * group.height))
        bezier9Path.addCurve(to: CGPoint(x: group.minX + 0.68427 * group.width, y: group.minY + 0.50017 * group.height), controlPoint1: CGPoint(x: group.minX + 0.68826 * group.width, y: group.minY + 0.57711 * group.height), controlPoint2: CGPoint(x: group.minX + 0.68427 * group.width, y: group.minY + 0.53973 * group.height))
        bezier9Path.addCurve(to: CGPoint(x: group.minX + 0.70615 * group.width, y: group.minY + 0.35797 * group.height), controlPoint1: CGPoint(x: group.minX + 0.68427 * group.width, y: group.minY + 0.44593 * group.height), controlPoint2: CGPoint(x: group.minX + 0.69163 * group.width, y: group.minY + 0.39809 * group.height))
        bezier9Path.addCurve(to: CGPoint(x: group.minX + 0.77370 * group.width, y: group.minY + 0.28604 * group.height), controlPoint1: CGPoint(x: group.minX + 0.72337 * group.width, y: group.minY + 0.31024 * group.height), controlPoint2: CGPoint(x: group.minX + 0.74610 * group.width, y: group.minY + 0.28604 * group.height))
        bezier9Path.addCurve(to: CGPoint(x: group.minX + 0.81437 * group.width, y: group.minY + 0.30590 * group.height), controlPoint1: CGPoint(x: group.minX + 0.78813 * group.width, y: group.minY + 0.28604 * group.height), controlPoint2: CGPoint(x: group.minX + 0.80181 * group.width, y: group.minY + 0.29273 * group.height))
        bezier9Path.addCurve(to: CGPoint(x: group.minX + 0.84565 * group.width, y: group.minY + 0.36354 * group.height), controlPoint1: CGPoint(x: group.minX + 0.82498 * group.width, y: group.minY + 0.31706 * group.height), controlPoint2: CGPoint(x: group.minX + 0.83551 * group.width, y: group.minY + 0.33645 * group.height))
        bezier9Path.addLine(to: CGPoint(x: group.minX + 0.84594 * group.width, y: group.minY + 0.36430 * group.height))
        bezier9Path.addLine(to: CGPoint(x: group.minX + 0.82307 * group.width, y: group.minY + 0.42014 * group.height))
        bezier9Path.addLine(to: CGPoint(x: group.minX + 0.82276 * group.width, y: group.minY + 0.41932 * group.height))
        bezier9Path.addCurve(to: CGPoint(x: group.minX + 0.77387 * group.width, y: group.minY + 0.36451 * group.height), controlPoint1: CGPoint(x: group.minX + 0.80884 * group.width, y: group.minY + 0.38296 * group.height), controlPoint2: CGPoint(x: group.minX + 0.79239 * group.width, y: group.minY + 0.36451 * group.height))
        bezier9Path.addCurve(to: CGPoint(x: group.minX + 0.73314 * group.width, y: group.minY + 0.40431 * group.height), controlPoint1: CGPoint(x: group.minX + 0.75773 * group.width, y: group.minY + 0.36451 * group.height), controlPoint2: CGPoint(x: group.minX + 0.74403 * group.width, y: group.minY + 0.37791 * group.height))
        bezier9Path.addCurve(to: CGPoint(x: group.minX + 0.71673 * group.width, y: group.minY + 0.50100 * group.height), controlPoint1: CGPoint(x: group.minX + 0.72225 * group.width, y: group.minY + 0.43071 * group.height), controlPoint2: CGPoint(x: group.minX + 0.71673 * group.width, y: group.minY + 0.46324 * group.height))
        bezier9Path.addCurve(to: CGPoint(x: group.minX + 0.73376 * group.width, y: group.minY + 0.60076 * group.height), controlPoint1: CGPoint(x: group.minX + 0.71673 * group.width, y: group.minY + 0.54005 * group.height), controlPoint2: CGPoint(x: group.minX + 0.72246 * group.width, y: group.minY + 0.57362 * group.height))
        bezier9Path.addCurve(to: CGPoint(x: group.minX + 0.77580 * group.width, y: group.minY + 0.64166 * group.height), controlPoint1: CGPoint(x: group.minX + 0.74506 * group.width, y: group.minY + 0.62789 * group.height), controlPoint2: CGPoint(x: group.minX + 0.75920 * group.width, y: group.minY + 0.64166 * group.height))
        bezier9Path.addCurve(to: CGPoint(x: group.minX + 0.80317 * group.width, y: group.minY + 0.62484 * group.height), controlPoint1: CGPoint(x: group.minX + 0.78658 * group.width, y: group.minY + 0.64166 * group.height), controlPoint2: CGPoint(x: group.minX + 0.79579 * group.width, y: group.minY + 0.63600 * group.height))
        bezier9Path.addCurve(to: CGPoint(x: group.minX + 0.82083 * group.width, y: group.minY + 0.57365 * group.height), controlPoint1: CGPoint(x: group.minX + 0.81039 * group.width, y: group.minY + 0.61394 * group.height), controlPoint2: CGPoint(x: group.minX + 0.81633 * group.width, y: group.minY + 0.59672 * group.height))
        bezier9Path.addLine(to: CGPoint(x: group.minX + 0.77304 * group.width, y: group.minY + 0.57365 * group.height))
        bezier9Path.addLine(to: CGPoint(x: group.minX + 0.77304 * group.width, y: group.minY + 0.49826 * group.height))
        bezier9Path.addLine(to: CGPoint(x: group.minX + 0.85737 * group.width, y: group.minY + 0.49826 * group.height))
        bezier9Path.addLine(to: CGPoint(x: group.minX + 0.85761 * group.width, y: group.minY + 0.51656 * group.height))
        bezier9Path.addCurve(to: CGPoint(x: group.minX + 0.84627 * group.width, y: group.minY + 0.61906 * group.height), controlPoint1: CGPoint(x: group.minX + 0.85761 * group.width, y: group.minY + 0.55244 * group.height), controlPoint2: CGPoint(x: group.minX + 0.85379 * group.width, y: group.minY + 0.58691 * group.height))
        bezier9Path.addCurve(to: CGPoint(x: group.minX + 0.81689 * group.width, y: group.minY + 0.69299 * group.height), controlPoint1: CGPoint(x: group.minX + 0.83875 * group.width, y: group.minY + 0.65120 * group.height), controlPoint2: CGPoint(x: group.minX + 0.82886 * group.width, y: group.minY + 0.67607 * group.height))
        bezier9Path.addCurve(to: CGPoint(x: group.minX + 0.77460 * group.width, y: group.minY + 0.71846 * group.height), controlPoint1: CGPoint(x: group.minX + 0.80492 * group.width, y: group.minY + 0.70989 * group.height), controlPoint2: CGPoint(x: group.minX + 0.79069 * group.width, y: group.minY + 0.71846 * group.height))
        bezier9Path.close()
        bezier9Path.usesEvenOddFillRule = true
        fillColor4.setFill()
        bezier9Path.fill()

        //// Bezier 10 Drawing
        let bezier10Path = UIBezierPath()
        bezier10Path.move(to: CGPoint(x: group.minX + 0.93499 * group.width, y: group.minY + 0.46894 * group.height))
        bezier10Path.addCurve(to: CGPoint(x: group.minX + 0.91141 * group.width, y: group.minY + 0.49326 * group.height), controlPoint1: CGPoint(x: group.minX + 0.92559 * group.width, y: group.minY + 0.46894 * group.height), controlPoint2: CGPoint(x: group.minX + 0.91766 * group.width, y: group.minY + 0.47713 * group.height))
        bezier10Path.addCurve(to: CGPoint(x: group.minX + 0.90199 * group.width, y: group.minY + 0.55558 * group.height), controlPoint1: CGPoint(x: group.minX + 0.90516 * group.width, y: group.minY + 0.50940 * group.height), controlPoint2: CGPoint(x: group.minX + 0.90199 * group.width, y: group.minY + 0.53037 * group.height))
        bezier10Path.addCurve(to: CGPoint(x: group.minX + 0.91130 * group.width, y: group.minY + 0.61890 * group.height), controlPoint1: CGPoint(x: group.minX + 0.90199 * group.width, y: group.minY + 0.58155 * group.height), controlPoint2: CGPoint(x: group.minX + 0.90512 * group.width, y: group.minY + 0.60285 * group.height))
        bezier10Path.addCurve(to: CGPoint(x: group.minX + 0.93487 * group.width, y: group.minY + 0.64306 * group.height), controlPoint1: CGPoint(x: group.minX + 0.91747 * group.width, y: group.minY + 0.63492 * group.height), controlPoint2: CGPoint(x: group.minX + 0.92540 * group.width, y: group.minY + 0.64306 * group.height))
        bezier10Path.addCurve(to: CGPoint(x: group.minX + 0.95862 * group.width, y: group.minY + 0.61860 * group.height), controlPoint1: CGPoint(x: group.minX + 0.94435 * group.width, y: group.minY + 0.64306 * group.height), controlPoint2: CGPoint(x: group.minX + 0.95233 * group.width, y: group.minY + 0.63483 * group.height))
        bezier10Path.addCurve(to: CGPoint(x: group.minX + 0.96810 * group.width, y: group.minY + 0.55558 * group.height), controlPoint1: CGPoint(x: group.minX + 0.96491 * group.width, y: group.minY + 0.60237 * group.height), controlPoint2: CGPoint(x: group.minX + 0.96810 * group.width, y: group.minY + 0.58117 * group.height))
        bezier10Path.addCurve(to: CGPoint(x: group.minX + 0.95879 * group.width, y: group.minY + 0.49298 * group.height), controlPoint1: CGPoint(x: group.minX + 0.96810 * group.width, y: group.minY + 0.53002 * group.height), controlPoint2: CGPoint(x: group.minX + 0.96497 * group.width, y: group.minY + 0.50896 * group.height))
        bezier10Path.addCurve(to: CGPoint(x: group.minX + 0.93499 * group.width, y: group.minY + 0.46894 * group.height), controlPoint1: CGPoint(x: group.minX + 0.95261 * group.width, y: group.minY + 0.47703 * group.height), controlPoint2: CGPoint(x: group.minX + 0.94461 * group.width, y: group.minY + 0.46894 * group.height))
        bezier10Path.close()
        bezier10Path.move(to: CGPoint(x: group.minX + 0.93459 * group.width, y: group.minY + 0.71595 * group.height))
        bezier10Path.addCurve(to: CGPoint(x: group.minX + 0.88922 * group.width, y: group.minY + 0.66927 * group.height), controlPoint1: CGPoint(x: group.minX + 0.91696 * group.width, y: group.minY + 0.71595 * group.height), controlPoint2: CGPoint(x: group.minX + 0.90168 * group.width, y: group.minY + 0.70025 * group.height))
        bezier10Path.addCurve(to: CGPoint(x: group.minX + 0.87042 * group.width, y: group.minY + 0.55586 * group.height), controlPoint1: CGPoint(x: group.minX + 0.87675 * group.width, y: group.minY + 0.63830 * group.height), controlPoint2: CGPoint(x: group.minX + 0.87042 * group.width, y: group.minY + 0.60014 * group.height))
        bezier10Path.addCurve(to: CGPoint(x: group.minX + 0.89166 * group.width, y: group.minY + 0.43669 * group.height), controlPoint1: CGPoint(x: group.minX + 0.87042 * group.width, y: group.minY + 0.50842 * group.height), controlPoint2: CGPoint(x: group.minX + 0.87757 * group.width, y: group.minY + 0.46833 * group.height))
        bezier10Path.addCurve(to: CGPoint(x: group.minX + 0.93448 * group.width, y: group.minY + 0.39521 * group.height), controlPoint1: CGPoint(x: group.minX + 0.90402 * group.width, y: group.minY + 0.40917 * group.height), controlPoint2: CGPoint(x: group.minX + 0.91842 * group.width, y: group.minY + 0.39521 * group.height))
        bezier10Path.addCurve(to: CGPoint(x: group.minX + 0.96735 * group.width, y: group.minY + 0.41678 * group.height), controlPoint1: CGPoint(x: group.minX + 0.94607 * group.width, y: group.minY + 0.39521 * group.height), controlPoint2: CGPoint(x: group.minX + 0.95714 * group.width, y: group.minY + 0.40246 * group.height))
        bezier10Path.addCurve(to: CGPoint(x: group.minX + 0.99137 * group.width, y: group.minY + 0.47540 * group.height), controlPoint1: CGPoint(x: group.minX + 0.97755 * group.width, y: group.minY + 0.43111 * group.height), controlPoint2: CGPoint(x: group.minX + 0.98564 * group.width, y: group.minY + 0.45083 * group.height))
        bezier10Path.addCurve(to: CGPoint(x: group.minX + 1.00000 * group.width, y: group.minY + 0.55530 * group.height), controlPoint1: CGPoint(x: group.minX + 0.99710 * group.width, y: group.minY + 0.49996 * group.height), controlPoint2: CGPoint(x: group.minX + 1.00000 * group.width, y: group.minY + 0.52684 * group.height))
        bezier10Path.addCurve(to: CGPoint(x: group.minX + 0.99131 * group.width, y: group.minY + 0.63605 * group.height), controlPoint1: CGPoint(x: group.minX + 1.00000 * group.width, y: group.minY + 0.58394 * group.height), controlPoint2: CGPoint(x: group.minX + 0.99708 * group.width, y: group.minY + 0.61111 * group.height))
        bezier10Path.addCurve(to: CGPoint(x: group.minX + 0.96763 * group.width, y: group.minY + 0.69479 * group.height), controlPoint1: CGPoint(x: group.minX + 0.98555 * group.width, y: group.minY + 0.66097 * group.height), controlPoint2: CGPoint(x: group.minX + 0.97758 * group.width, y: group.minY + 0.68074 * group.height))
        bezier10Path.addCurve(to: CGPoint(x: group.minX + 0.93459 * group.width, y: group.minY + 0.71595 * group.height), controlPoint1: CGPoint(x: group.minX + 0.95769 * group.width, y: group.minY + 0.70883 * group.height), controlPoint2: CGPoint(x: group.minX + 0.94658 * group.width, y: group.minY + 0.71595 * group.height))
        bezier10Path.addLine(to: CGPoint(x: group.minX + 0.93459 * group.width, y: group.minY + 0.71595 * group.height))
        bezier10Path.close()
        bezier10Path.usesEvenOddFillRule = true
        fillColor4.setFill()
        bezier10Path.fill()
    }
    
}
