/**
 
 Иконки для событий.
 
 */

import UIKit

public enum RKEventIconStyle: Int {
    case emptiness // пустой круг
    case contact   // visit
    case organization // pharmacyVisit, organizationVisit
    case doubleVisit
    case vacation  // отпуск
    case sickLeave // Больничный
    case conference // конференция
    case appoitntment
    case organizationVisit
    case pharmaMeeting // фармкружок
}

public class RKEventIconView: UIView {
    
    public var style: RKEventIconStyle = .emptiness {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var iconStyle: Int {
        get {
            return style.rawValue
        }
        set {
            style = RKEventIconStyle(rawValue: newValue) ?? .emptiness
        }
    }
    
    /** Инверсия - белая иконка на цветном фоне, иначе цветная иконка в круге */
    @IBInspectable public var isNegative: Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var color: UIColor = RKPalette.gray.color {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public init(style: RKEventIconStyle) {
        self.style = style
        super.init(frame: .zero)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clear
    }
    
    public override func draw(_ rect: CGRect) {
        drawBackgroudCanvas(in: rect)
        drawIcon(in: rect)
    }
    
    func drawIcon(in rect: CGRect) {
        switch style {
        case .contact: drawContactCanvas(in: rect)
        case .organization: drawOrganizationCanvas(in: rect)
        case .doubleVisit: drawDoubleVisitCanvas(in: rect)
        case .vacation: drawVacationCanvas(in: rect)
        case .sickLeave: drawSickLeaveCanvas(in: rect)
        case .emptiness: drawBackgroudCanvas(in: rect)
        case .conference: drawConferenceCanvas(in: rect)
        case .appoitntment: drawAppointmentCanvas(in: rect)
        case .organizationVisit: drawOrganizationVisitCanvas(in: rect)
        case .pharmaMeeting: drawPharmaMeetingCanvas(in: rect)
        }
    }
    
    func fastFloor(_ x: CGFloat) -> CGFloat {
        return floor(x)
    }
    
    enum ColorStyle {
        /** цвет фона */
        case backgroud
        /** цвет обрамления */
        case border
        /** цвет фигур */
        case fill
    }
    
    func color(for style: ColorStyle) -> UIColor {
        switch style {
        case .backgroud: return isNegative ? color : RKPalette.white.color
        case .border: return color
        case .fill: return isNegative ? RKPalette.white.color : color
        }
    }
    
    /// Отрисовывает изображение
    func image() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(frame.size, false, 0.0)
        drawIcon(in: frame)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
}

extension RKEventIconView {
    
    private func drawBackgroudCanvas(in frame: CGRect) {
        let group3: CGRect = CGRect(x: frame.minX + fastFloor(frame.width * 0.00000 + 0.5), y: frame.minY + fastFloor(frame.height * 0.00000 + 0.5), width: fastFloor(frame.width * 1.00000 + 0.5) - fastFloor(frame.width * 0.00000 + 0.5), height: fastFloor(frame.height * 1.00000 + 0.5) - fastFloor(frame.height * 0.00000 + 0.5))
        //// Bezier 3 Drawing
        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: group3.minX + fastFloor(group3.width * 0.00000 + 1), y: group3.minY + fastFloor(group3.height * 0.00000 + 1), width: fastFloor(group3.width * 1.00000 - 1) - fastFloor(group3.width * 0.00000 + 1), height: fastFloor(group3.height * 1.00000 - 1) - fastFloor(group3.height * 0.00000 + 1)))
        color(for: .border).setStroke()
        color(for: .backgroud).setFill()
        ovalPath.lineWidth = 2
        ovalPath.stroke()
        ovalPath.fill()
    }
    
}

extension RKEventIconView {
    
    private func drawContactCanvas(in frame: CGRect) {
        //// Subframes
        let group3: CGRect = CGRect(x: frame.minX + fastFloor(frame.width * 0.00000 + 0.5), y: frame.minY + fastFloor(frame.height * 0.00000 + 0.5), width: fastFloor(frame.width * 1.00000 + 0.5) - fastFloor(frame.width * 0.00000 + 0.5), height: fastFloor(frame.height * 1.00000 + 0.5) - fastFloor(frame.height * 0.00000 + 0.5))
        //// Bezier 3 Drawing
        
        //drawBackgroudCanvas(in: frame)
        
        //// Bezier 4 Drawing
        let bezier4Path = UIBezierPath()
        bezier4Path.move(to: CGPoint(x: group3.minX + 0.63764 * group3.width, y: group3.minY + 0.30120 * group3.height))
        bezier4Path.addLine(to: CGPoint(x: group3.minX + 0.63764 * group3.width, y: group3.minY + 0.31126 * group3.height))
        bezier4Path.addLine(to: CGPoint(x: group3.minX + 0.61992 * group3.width, y: group3.minY + 0.31126 * group3.height))
        bezier4Path.addLine(to: CGPoint(x: group3.minX + 0.61992 * group3.width, y: group3.minY + 0.30120 * group3.height))
        bezier4Path.addCurve(to: CGPoint(x: group3.minX + 0.58065 * group3.width, y: group3.minY + 0.26144 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.61992 * group3.width, y: group3.minY + 0.27917 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.60220 * group3.width, y: group3.minY + 0.26144 * group3.height))
        bezier4Path.addLine(to: CGPoint(x: group3.minX + 0.43887 * group3.width, y: group3.minY + 0.26144 * group3.height))
        bezier4Path.addCurve(to: CGPoint(x: group3.minX + 0.39959 * group3.width, y: group3.minY + 0.30120 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.41732 * group3.width, y: group3.minY + 0.26144 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.39959 * group3.width, y: group3.minY + 0.27917 * group3.height))
        bezier4Path.addLine(to: CGPoint(x: group3.minX + 0.39959 * group3.width, y: group3.minY + 0.31126 * group3.height))
        bezier4Path.addLine(to: CGPoint(x: group3.minX + 0.38187 * group3.width, y: group3.minY + 0.31126 * group3.height))
        bezier4Path.addLine(to: CGPoint(x: group3.minX + 0.38187 * group3.width, y: group3.minY + 0.30120 * group3.height))
        bezier4Path.addCurve(to: CGPoint(x: group3.minX + 0.43935 * group3.width, y: group3.minY + 0.24324 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.38187 * group3.width, y: group3.minY + 0.26959 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.40774 * group3.width, y: group3.minY + 0.24324 * group3.height))
        bezier4Path.addLine(to: CGPoint(x: group3.minX + 0.58112 * group3.width, y: group3.minY + 0.24324 * group3.height))
        bezier4Path.addCurve(to: CGPoint(x: group3.minX + 0.63764 * group3.width, y: group3.minY + 0.30120 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.61226 * group3.width, y: group3.minY + 0.24324 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.63764 * group3.width, y: group3.minY + 0.26911 * group3.height))
        bezier4Path.close()
        bezier4Path.move(to: CGPoint(x: group3.minX + 0.70757 * group3.width, y: group3.minY + 0.32802 * group3.height))
        bezier4Path.addCurve(to: CGPoint(x: group3.minX + 0.74877 * group3.width, y: group3.minY + 0.36969 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.73056 * group3.width, y: group3.minY + 0.32802 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.74924 * group3.width, y: group3.minY + 0.34670 * group3.height))
        bezier4Path.addLine(to: CGPoint(x: group3.minX + 0.74877 * group3.width, y: group3.minY + 0.62690 * group3.height))
        bezier4Path.addCurve(to: CGPoint(x: group3.minX + 0.70230 * group3.width, y: group3.minY + 0.67336 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.74877 * group3.width, y: group3.minY + 0.65229 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.72817 * group3.width, y: group3.minY + 0.67336 * group3.height))
        bezier4Path.addLine(to: CGPoint(x: group3.minX + 0.31673 * group3.width, y: group3.minY + 0.67336 * group3.height))
        bezier4Path.addCurve(to: CGPoint(x: group3.minX + 0.27027 * group3.width, y: group3.minY + 0.62690 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.29135 * group3.width, y: group3.minY + 0.67336 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.27027 * group3.width, y: group3.minY + 0.65277 * group3.height))
        bezier4Path.addLine(to: CGPoint(x: group3.minX + 0.27027 * group3.width, y: group3.minY + 0.36969 * group3.height))
        bezier4Path.addCurve(to: CGPoint(x: group3.minX + 0.31194 * group3.width, y: group3.minY + 0.32802 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.27027 * group3.width, y: group3.minY + 0.34670 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.28895 * group3.width, y: group3.minY + 0.32802 * group3.height))
        bezier4Path.addLine(to: CGPoint(x: group3.minX + 0.70757 * group3.width, y: group3.minY + 0.32802 * group3.height))
        bezier4Path.close()
        bezier4Path.move(to: CGPoint(x: group3.minX + 0.61178 * group3.width, y: group3.minY + 0.53063 * group3.height))
        bezier4Path.addLine(to: CGPoint(x: group3.minX + 0.61178 * group3.width, y: group3.minY + 0.47076 * group3.height))
        bezier4Path.addCurve(to: CGPoint(x: group3.minX + 0.60747 * group3.width, y: group3.minY + 0.46645 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.61178 * group3.width, y: group3.minY + 0.46836 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.60986 * group3.width, y: group3.minY + 0.46645 * group3.height))
        bezier4Path.addLine(to: CGPoint(x: group3.minX + 0.54329 * group3.width, y: group3.minY + 0.46645 * group3.height))
        bezier4Path.addLine(to: CGPoint(x: group3.minX + 0.54329 * group3.width, y: group3.minY + 0.39987 * group3.height))
        bezier4Path.addCurve(to: CGPoint(x: group3.minX + 0.53897 * group3.width, y: group3.minY + 0.39556 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.54329 * group3.width, y: group3.minY + 0.39747 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.54137 * group3.width, y: group3.minY + 0.39556 * group3.height))
        bezier4Path.addLine(to: CGPoint(x: group3.minX + 0.48054 * group3.width, y: group3.minY + 0.39556 * group3.height))
        bezier4Path.addCurve(to: CGPoint(x: group3.minX + 0.47623 * group3.width, y: group3.minY + 0.39987 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.47814 * group3.width, y: group3.minY + 0.39556 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.47623 * group3.width, y: group3.minY + 0.39747 * group3.height))
        bezier4Path.addLine(to: CGPoint(x: group3.minX + 0.47623 * group3.width, y: group3.minY + 0.46645 * group3.height))
        bezier4Path.addLine(to: CGPoint(x: group3.minX + 0.41205 * group3.width, y: group3.minY + 0.46645 * group3.height))
        bezier4Path.addCurve(to: CGPoint(x: group3.minX + 0.40774 * group3.width, y: group3.minY + 0.47076 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.40965 * group3.width, y: group3.minY + 0.46645 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.40774 * group3.width, y: group3.minY + 0.46836 * group3.height))
        bezier4Path.addLine(to: CGPoint(x: group3.minX + 0.40774 * group3.width, y: group3.minY + 0.53063 * group3.height))
        bezier4Path.addCurve(to: CGPoint(x: group3.minX + 0.41205 * group3.width, y: group3.minY + 0.53494 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.40774 * group3.width, y: group3.minY + 0.53302 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.40965 * group3.width, y: group3.minY + 0.53494 * group3.height))
        bezier4Path.addLine(to: CGPoint(x: group3.minX + 0.47623 * group3.width, y: group3.minY + 0.53494 * group3.height))
        bezier4Path.addLine(to: CGPoint(x: group3.minX + 0.47623 * group3.width, y: group3.minY + 0.60152 * group3.height))
        bezier4Path.addCurve(to: CGPoint(x: group3.minX + 0.48054 * group3.width, y: group3.minY + 0.60583 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.47623 * group3.width, y: group3.minY + 0.60391 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.47814 * group3.width, y: group3.minY + 0.60583 * group3.height))
        bezier4Path.addLine(to: CGPoint(x: group3.minX + 0.53897 * group3.width, y: group3.minY + 0.60583 * group3.height))
        bezier4Path.addCurve(to: CGPoint(x: group3.minX + 0.54329 * group3.width, y: group3.minY + 0.60152 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.54137 * group3.width, y: group3.minY + 0.60583 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.54329 * group3.width, y: group3.minY + 0.60391 * group3.height))
        bezier4Path.addLine(to: CGPoint(x: group3.minX + 0.54329 * group3.width, y: group3.minY + 0.53494 * group3.height))
        bezier4Path.addLine(to: CGPoint(x: group3.minX + 0.60747 * group3.width, y: group3.minY + 0.53494 * group3.height))
        bezier4Path.addCurve(to: CGPoint(x: group3.minX + 0.61178 * group3.width, y: group3.minY + 0.53063 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.60986 * group3.width, y: group3.minY + 0.53494 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.61178 * group3.width, y: group3.minY + 0.53302 * group3.height))
        bezier4Path.close()
        color(for: .fill).setFill()
        bezier4Path.fill()
    }
    
}

extension RKEventIconView {
    
    private func drawOrganizationCanvas(in frame: CGRect) {
        let group2: CGRect = CGRect(x: frame.minX + fastFloor(frame.width * 0.00000 + 0.5), y: frame.minY + fastFloor(frame.height * 0.00000 + 0.5), width: fastFloor(frame.width * 1.00000 + 0.5) - fastFloor(frame.width * 0.00000 + 0.5), height: fastFloor(frame.height * 1.00000 + 0.5) - fastFloor(frame.height * 0.00000 + 0.5))
        //// Bezier Drawing
        
        //drawBackgroudCanvas(in: frame)
        
        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: group2.minX + 0.40840 * group2.width, y: group2.minY + 0.45773 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.33640 * group2.width, y: group2.minY + 0.34347 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.36452 * group2.width, y: group2.minY + 0.43094 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.33640 * group2.width, y: group2.minY + 0.38972 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.71922 * group2.width, y: group2.minY + 0.34347 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.56821 * group2.width, y: group2.minY + 0.48638 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.71922 * group2.width, y: group2.minY + 0.41363 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.65451 * group2.width, y: group2.minY + 0.47220 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.55736 * group2.width, y: group2.minY + 0.48793 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.56462 * group2.width, y: group2.minY + 0.48696 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.56101 * group2.width, y: group2.minY + 0.48749 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.54646 * group2.width, y: group2.minY + 0.48896 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.55376 * group2.width, y: group2.minY + 0.48836 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.55013 * group2.width, y: group2.minY + 0.48869 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.54320 * group2.width, y: group2.minY + 0.48915 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.54538 * group2.width, y: group2.minY + 0.48905 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.54429 * group2.width, y: group2.minY + 0.48909 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.52781 * group2.width, y: group2.minY + 0.48967 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.53812 * group2.width, y: group2.minY + 0.48947 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.53300 * group2.width, y: group2.minY + 0.48967 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.52227 * group2.width, y: group2.minY + 0.48959 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.52595 * group2.width, y: group2.minY + 0.48967 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.52411 * group2.width, y: group2.minY + 0.48964 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.52451 * group2.width, y: group2.minY + 0.49021 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.52302 * group2.width, y: group2.minY + 0.48980 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.52377 * group2.width, y: group2.minY + 0.49001 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.54477 * group2.width, y: group2.minY + 0.49636 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.53127 * group2.width, y: group2.minY + 0.49218 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.53805 * group2.width, y: group2.minY + 0.49417 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.55061 * group2.width, y: group2.minY + 0.49833 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.54672 * group2.width, y: group2.minY + 0.49700 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.54868 * group2.width, y: group2.minY + 0.49765 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.56160 * group2.width, y: group2.minY + 0.50247 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.55430 * group2.width, y: group2.minY + 0.49961 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.55796 * group2.width, y: group2.minY + 0.50099 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.57252 * group2.width, y: group2.minY + 0.50739 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.56527 * group2.width, y: group2.minY + 0.50398 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.56892 * group2.width, y: group2.minY + 0.50561 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.58664 * group2.width, y: group2.minY + 0.51536 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.57731 * group2.width, y: group2.minY + 0.50975 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.58204 * group2.width, y: group2.minY + 0.51237 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.59331 * group2.width, y: group2.minY + 0.52002 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.58889 * group2.width, y: group2.minY + 0.51682 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.59112 * group2.width, y: group2.minY + 0.51838 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.61453 * group2.width, y: group2.minY + 0.54027 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.60075 * group2.width, y: group2.minY + 0.52557 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.60787 * group2.width, y: group2.minY + 0.53218 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.61957 * group2.width, y: group2.minY + 0.54678 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.61624 * group2.width, y: group2.minY + 0.54234 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.61792 * group2.width, y: group2.minY + 0.54451 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.62941 * group2.width, y: group2.minY + 0.56681 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.62374 * group2.width, y: group2.minY + 0.55273 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.62711 * group2.width, y: group2.minY + 0.55949 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.63105 * group2.width, y: group2.minY + 0.57288 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.63004 * group2.width, y: group2.minY + 0.56879 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.63059 * group2.width, y: group2.minY + 0.57081 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.63273 * group2.width, y: group2.minY + 0.59190 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.63240 * group2.width, y: group2.minY + 0.57894 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.63302 * group2.width, y: group2.minY + 0.58532 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.63255 * group2.width, y: group2.minY + 0.59402 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.63270 * group2.width, y: group2.minY + 0.59260 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.63260 * group2.width, y: group2.minY + 0.59332 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.62117 * group2.width, y: group2.minY + 0.63370 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.63171 * group2.width, y: group2.minY + 0.60676 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.62792 * group2.width, y: group2.minY + 0.61992 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.60957 * group2.width, y: group2.minY + 0.65388 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.61796 * group2.width, y: group2.minY + 0.64027 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.61414 * group2.width, y: group2.minY + 0.64698 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.60002 * group2.width, y: group2.minY + 0.65116 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.60618 * group2.width, y: group2.minY + 0.65304 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.60303 * group2.width, y: group2.minY + 0.65212 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.57862 * group2.width, y: group2.minY + 0.63384 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.59050 * group2.width, y: group2.minY + 0.64710 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.58401 * group2.width, y: group2.minY + 0.64131 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.58111 * group2.width, y: group2.minY + 0.62985 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.57953 * group2.width, y: group2.minY + 0.63247 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.58029 * group2.width, y: group2.minY + 0.63118 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.59435 * group2.width, y: group2.minY + 0.59682 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.58928 * group2.width, y: group2.minY + 0.61657 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.59300 * group2.width, y: group2.minY + 0.60551 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.59504 * group2.width, y: group2.minY + 0.59017 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.59472 * group2.width, y: group2.minY + 0.59444 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.59496 * group2.width, y: group2.minY + 0.59219 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.59231 * group2.width, y: group2.minY + 0.57575 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.59518 * group2.width, y: group2.minY + 0.58493 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.59409 * group2.width, y: group2.minY + 0.58017 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.58951 * group2.width, y: group2.minY + 0.57002 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.59152 * group2.width, y: group2.minY + 0.57376 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.59058 * group2.width, y: group2.minY + 0.57185 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.58774 * group2.width, y: group2.minY + 0.56706 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.58892 * group2.width, y: group2.minY + 0.56902 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.58838 * group2.width, y: group2.minY + 0.56801 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.57223 * group2.width, y: group2.minY + 0.55218 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.58388 * group2.width, y: group2.minY + 0.56143 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.57933 * group2.width, y: group2.minY + 0.55695 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.56857 * group2.width, y: group2.minY + 0.54976 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.57103 * group2.width, y: group2.minY + 0.55137 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.56993 * group2.width, y: group2.minY + 0.55058 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.56680 * group2.width, y: group2.minY + 0.54877 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.56801 * group2.width, y: group2.minY + 0.54940 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.56738 * group2.width, y: group2.minY + 0.54911 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.56133 * group2.width, y: group2.minY + 0.54573 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.56502 * group2.width, y: group2.minY + 0.54773 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.56323 * group2.width, y: group2.minY + 0.54669 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.55044 * group2.width, y: group2.minY + 0.54085 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.55787 * group2.width, y: group2.minY + 0.54397 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.55420 * group2.width, y: group2.minY + 0.54238 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.55031 * group2.width, y: group2.minY + 0.55633 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.55039 * group2.width, y: group2.minY + 0.54603 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.55034 * group2.width, y: group2.minY + 0.55121 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.55044 * group2.width, y: group2.minY + 0.58566 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.55024 * group2.width, y: group2.minY + 0.56640 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.55026 * group2.width, y: group2.minY + 0.57628 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.55060 * group2.width, y: group2.minY + 0.59232 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.55049 * group2.width, y: group2.minY + 0.58791 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.55054 * group2.width, y: group2.minY + 0.59013 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.55188 * group2.width, y: group2.minY + 0.61505 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.55084 * group2.width, y: group2.minY + 0.60046 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.55124 * group2.width, y: group2.minY + 0.60812 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.55336 * group2.width, y: group2.minY + 0.62719 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.55228 * group2.width, y: group2.minY + 0.61940 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.55276 * group2.width, y: group2.minY + 0.62347 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.55820 * group2.width, y: group2.minY + 0.64429 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.55452 * group2.width, y: group2.minY + 0.63429 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.55609 * group2.width, y: group2.minY + 0.64014 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.63114 * group2.width, y: group2.minY + 0.68122 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.57065 * group2.width, y: group2.minY + 0.66791 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.59070 * group2.width, y: group2.minY + 0.67598 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.65889 * group2.width, y: group2.minY + 0.70682 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.65288 * group2.width, y: group2.minY + 0.68404 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.66209 * group2.width, y: group2.minY + 0.69821 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.53150 * group2.width, y: group2.minY + 0.70682 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.52981 * group2.width, y: group2.minY + 0.70682 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.40244 * group2.width, y: group2.minY + 0.70682 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.43019 * group2.width, y: group2.minY + 0.68122 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.39923 * group2.width, y: group2.minY + 0.69821 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.40845 * group2.width, y: group2.minY + 0.68404 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.50311 * group2.width, y: group2.minY + 0.64429 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.47062 * group2.width, y: group2.minY + 0.67598 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.49068 * group2.width, y: group2.minY + 0.66791 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.50943 * group2.width, y: group2.minY + 0.61529 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.50631 * group2.width, y: group2.minY + 0.63801 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.50826 * group2.width, y: group2.minY + 0.62784 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.51071 * group2.width, y: group2.minY + 0.59255 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.51007 * group2.width, y: group2.minY + 0.60837 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.51047 * group2.width, y: group2.minY + 0.60069 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.51088 * group2.width, y: group2.minY + 0.58594 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.51078 * group2.width, y: group2.minY + 0.59038 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.51084 * group2.width, y: group2.minY + 0.58818 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.51101 * group2.width, y: group2.minY + 0.55658 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.51106 * group2.width, y: group2.minY + 0.57655 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.51108 * group2.width, y: group2.minY + 0.56667 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.51076 * group2.width, y: group2.minY + 0.52792 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.51097 * group2.width, y: group2.minY + 0.54709 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.51085 * group2.width, y: group2.minY + 0.53745 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.50142 * group2.width, y: group2.minY + 0.52520 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.50759 * group2.width, y: group2.minY + 0.52702 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.50445 * group2.width, y: group2.minY + 0.52611 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.49979 * group2.width, y: group2.minY + 0.52472 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.50085 * group2.width, y: group2.minY + 0.52503 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.50035 * group2.width, y: group2.minY + 0.52488 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.48884 * group2.width, y: group2.minY + 0.52142 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.49581 * group2.width, y: group2.minY + 0.52352 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.49216 * group2.width, y: group2.minY + 0.52243 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.43230 * group2.width, y: group2.minY + 0.49949 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.46455 * group2.width, y: group2.minY + 0.51404 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.45581 * group2.width, y: group2.minY + 0.51065 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.40840 * group2.width, y: group2.minY + 0.45773 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.40124 * group2.width, y: group2.minY + 0.48474 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.40332 * group2.width, y: group2.minY + 0.46769 * group2.height))
        bezier2Path.close()
        bezier2Path.move(to: CGPoint(x: group2.minX + 0.53992 * group2.width, y: group2.minY + 0.78335 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.56315 * group2.width, y: group2.minY + 0.84295 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.56124 * group2.width, y: group2.minY + 0.80223 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.56990 * group2.width, y: group2.minY + 0.80409 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.49630 * group2.width, y: group2.minY + 0.78499 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.55591 * group2.width, y: group2.minY + 0.81680 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.54056 * group2.width, y: group2.minY + 0.81761 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.47996 * group2.width, y: group2.minY + 0.72697 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.46812 * group2.width, y: group2.minY + 0.76423 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.47415 * group2.width, y: group2.minY + 0.73951 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.52843 * group2.width, y: group2.minY + 0.72697 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.53030 * group2.width, y: group2.minY + 0.72697 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.53175 * group2.width, y: group2.minY + 0.72697 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.53992 * group2.width, y: group2.minY + 0.78335 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.52545 * group2.width, y: group2.minY + 0.73501 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.51170 * group2.width, y: group2.minY + 0.75836 * group2.height))
        bezier2Path.close()
        bezier2Path.move(to: CGPoint(x: group2.minX + 0.43455 * group2.width, y: group2.minY + 0.25684 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.44640 * group2.width, y: group2.minY + 0.21561 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.41034 * group2.width, y: group2.minY + 0.25684 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.41935 * group2.width, y: group2.minY + 0.23330 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.51604 * group2.width, y: group2.minY + 0.18390 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.46413 * group2.width, y: group2.minY + 0.20401 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.48912 * group2.width, y: group2.minY + 0.19072 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.54477 * group2.width, y: group2.minY + 0.17950 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.52545 * group2.width, y: group2.minY + 0.18152 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.53510 * group2.width, y: group2.minY + 0.17994 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.55015 * group2.width, y: group2.minY + 0.17934 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.54657 * group2.width, y: group2.minY + 0.17942 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.54836 * group2.width, y: group2.minY + 0.17934 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.60658 * group2.width, y: group2.minY + 0.19718 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.56971 * group2.width, y: group2.minY + 0.17934 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.58914 * group2.width, y: group2.minY + 0.18432 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.62656 * group2.width, y: group2.minY + 0.31307 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.64726 * group2.width, y: group2.minY + 0.22720 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.64798 * group2.width, y: group2.minY + 0.27381 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.57587 * group2.width, y: group2.minY + 0.31307 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.59769 * group2.width, y: group2.minY + 0.28049 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.58508 * group2.width, y: group2.minY + 0.30252 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.59281 * group2.width, y: group2.minY + 0.29153 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.55285 * group2.width, y: group2.minY + 0.22009 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.61242 * group2.width, y: group2.minY + 0.24720 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.58751 * group2.width, y: group2.minY + 0.22009 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.54477 * group2.width, y: group2.minY + 0.22062 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.55021 * group2.width, y: group2.minY + 0.22009 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.54751 * group2.width, y: group2.minY + 0.22030 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.52393 * group2.width, y: group2.minY + 0.22613 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.53802 * group2.width, y: group2.minY + 0.22142 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.53102 * group2.width, y: group2.minY + 0.22318 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.51604 * group2.width, y: group2.minY + 0.24044 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.52393 * group2.width, y: group2.minY + 0.22613 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.52799 * group2.width, y: group2.minY + 0.23451 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.50157 * group2.width, y: group2.minY + 0.24466 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.51265 * group2.width, y: group2.minY + 0.24212 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.50803 * group2.width, y: group2.minY + 0.24362 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.44398 * group2.width, y: group2.minY + 0.25591 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.43455 * group2.width, y: group2.minY + 0.25684 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.44041 * group2.width, y: group2.minY + 0.25654 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.43727 * group2.width, y: group2.minY + 0.25684 * group2.height))
        bezier2Path.close()
        color(for: .fill).setFill()
        bezier2Path.fill()
    }
    
}

extension RKEventIconView {
    
    private func drawDoubleVisitCanvas(in frame: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        //// Subframes
        let group: CGRect = CGRect(x: frame.minX + fastFloor(frame.width * 0.00000 + 0.5), y: frame.minY + fastFloor(frame.height * 0.00000 + 0.5), width: fastFloor(frame.width * 1.12101 - 0.19) - fastFloor(frame.width * 0.00000 + 0.5) + 0.69, height: fastFloor(frame.height * 1.00000 + 0.5) - fastFloor(frame.height * 0.00000 + 0.5))
        //// Bezier 5 Drawing
        
        //drawBackgroudCanvas(in: frame)
        
        //// Bezier 6 Drawing
        let bezier6Path = UIBezierPath()
        bezier6Path.move(to: CGPoint(x: group.minX + 0.38074 * group.width, y: group.minY + 0.27531 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.38074 * group.width, y: group.minY + 0.28190 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.37034 * group.width, y: group.minY + 0.28190 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.37034 * group.width, y: group.minY + 0.27531 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.34731 * group.width, y: group.minY + 0.24927 * group.height), controlPoint1: CGPoint(x: group.minX + 0.37034 * group.width, y: group.minY + 0.26088 * group.height), controlPoint2: CGPoint(x: group.minX + 0.35995 * group.width, y: group.minY + 0.24927 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.26415 * group.width, y: group.minY + 0.24927 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.24111 * group.width, y: group.minY + 0.27531 * group.height), controlPoint1: CGPoint(x: group.minX + 0.25151 * group.width, y: group.minY + 0.24927 * group.height), controlPoint2: CGPoint(x: group.minX + 0.24111 * group.width, y: group.minY + 0.26088 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.24111 * group.width, y: group.minY + 0.28190 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.23072 * group.width, y: group.minY + 0.28190 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.23072 * group.width, y: group.minY + 0.27531 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.26443 * group.width, y: group.minY + 0.23734 * group.height), controlPoint1: CGPoint(x: group.minX + 0.23072 * group.width, y: group.minY + 0.25460 * group.height), controlPoint2: CGPoint(x: group.minX + 0.24589 * group.width, y: group.minY + 0.23734 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.34759 * group.width, y: group.minY + 0.23734 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.38074 * group.width, y: group.minY + 0.27531 * group.height), controlPoint1: CGPoint(x: group.minX + 0.36585 * group.width, y: group.minY + 0.23734 * group.height), controlPoint2: CGPoint(x: group.minX + 0.38074 * group.width, y: group.minY + 0.25429 * group.height))
        bezier6Path.close()
        bezier6Path.move(to: CGPoint(x: group.minX + 0.42175 * group.width, y: group.minY + 0.29289 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.44591 * group.width, y: group.minY + 0.32019 * group.height), controlPoint1: CGPoint(x: group.minX + 0.43524 * group.width, y: group.minY + 0.29289 * group.height), controlPoint2: CGPoint(x: group.minX + 0.44619 * group.width, y: group.minY + 0.30512 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.44591 * group.width, y: group.minY + 0.48870 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.41866 * group.width, y: group.minY + 0.51914 * group.height), controlPoint1: CGPoint(x: group.minX + 0.44591 * group.width, y: group.minY + 0.50533 * group.height), controlPoint2: CGPoint(x: group.minX + 0.43383 * group.width, y: group.minY + 0.51914 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.19251 * group.width, y: group.minY + 0.51914 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.16526 * group.width, y: group.minY + 0.48870 * group.height), controlPoint1: CGPoint(x: group.minX + 0.17762 * group.width, y: group.minY + 0.51914 * group.height), controlPoint2: CGPoint(x: group.minX + 0.16526 * group.width, y: group.minY + 0.50564 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.16526 * group.width, y: group.minY + 0.32019 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.18970 * group.width, y: group.minY + 0.29289 * group.height), controlPoint1: CGPoint(x: group.minX + 0.16526 * group.width, y: group.minY + 0.30512 * group.height), controlPoint2: CGPoint(x: group.minX + 0.17622 * group.width, y: group.minY + 0.29289 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.42175 * group.width, y: group.minY + 0.29289 * group.height))
        bezier6Path.close()
        bezier6Path.move(to: CGPoint(x: group.minX + 0.36557 * group.width, y: group.minY + 0.42562 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.36557 * group.width, y: group.minY + 0.38640 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.36304 * group.width, y: group.minY + 0.38357 * group.height), controlPoint1: CGPoint(x: group.minX + 0.36557 * group.width, y: group.minY + 0.38483 * group.height), controlPoint2: CGPoint(x: group.minX + 0.36444 * group.width, y: group.minY + 0.38357 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.32539 * group.width, y: group.minY + 0.38357 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.32539 * group.width, y: group.minY + 0.33996 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.32286 * group.width, y: group.minY + 0.33713 * group.height), controlPoint1: CGPoint(x: group.minX + 0.32539 * group.width, y: group.minY + 0.33839 * group.height), controlPoint2: CGPoint(x: group.minX + 0.32427 * group.width, y: group.minY + 0.33713 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.28859 * group.width, y: group.minY + 0.33713 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.28606 * group.width, y: group.minY + 0.33996 * group.height), controlPoint1: CGPoint(x: group.minX + 0.28719 * group.width, y: group.minY + 0.33713 * group.height), controlPoint2: CGPoint(x: group.minX + 0.28606 * group.width, y: group.minY + 0.33839 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.28606 * group.width, y: group.minY + 0.38357 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.24842 * group.width, y: group.minY + 0.38357 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.24589 * group.width, y: group.minY + 0.38640 * group.height), controlPoint1: CGPoint(x: group.minX + 0.24701 * group.width, y: group.minY + 0.38357 * group.height), controlPoint2: CGPoint(x: group.minX + 0.24589 * group.width, y: group.minY + 0.38483 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.24589 * group.width, y: group.minY + 0.42562 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.24842 * group.width, y: group.minY + 0.42845 * group.height), controlPoint1: CGPoint(x: group.minX + 0.24589 * group.width, y: group.minY + 0.42719 * group.height), controlPoint2: CGPoint(x: group.minX + 0.24701 * group.width, y: group.minY + 0.42845 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.28606 * group.width, y: group.minY + 0.42845 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.28606 * group.width, y: group.minY + 0.47207 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.28859 * group.width, y: group.minY + 0.47489 * group.height), controlPoint1: CGPoint(x: group.minX + 0.28606 * group.width, y: group.minY + 0.47363 * group.height), controlPoint2: CGPoint(x: group.minX + 0.28719 * group.width, y: group.minY + 0.47489 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.32286 * group.width, y: group.minY + 0.47489 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.32539 * group.width, y: group.minY + 0.47207 * group.height), controlPoint1: CGPoint(x: group.minX + 0.32427 * group.width, y: group.minY + 0.47489 * group.height), controlPoint2: CGPoint(x: group.minX + 0.32539 * group.width, y: group.minY + 0.47363 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.32539 * group.width, y: group.minY + 0.42845 * group.height))
        bezier6Path.addLine(to: CGPoint(x: group.minX + 0.36304 * group.width, y: group.minY + 0.42845 * group.height))
        bezier6Path.addCurve(to: CGPoint(x: group.minX + 0.36557 * group.width, y: group.minY + 0.42562 * group.height), controlPoint1: CGPoint(x: group.minX + 0.36444 * group.width, y: group.minY + 0.42845 * group.height), controlPoint2: CGPoint(x: group.minX + 0.36557 * group.width, y: group.minY + 0.42719 * group.height))
        bezier6Path.close()
        color(for: .fill).setFill()
        bezier6Path.fill()
        //// Group 6
        context.saveGState()
        context.beginTransparencyLayer(auxiliaryInfo: nil)
        //// Clip Clip 2
        let clip2Path = UIBezierPath()
        clip2Path.move(to: CGPoint(x: group.minX + 0.16702 * group.width, y: group.minY + 0.10423 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 1.00000 * group.width, y: group.minY + 0.10423 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 1.00000 * group.width, y: group.minY + 0.99116 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 0.16702 * group.width, y: group.minY + 0.99116 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 0.16702 * group.width, y: group.minY + 0.10423 * group.height))
        clip2Path.close()
        clip2Path.move(to: CGPoint(x: group.minX + 0.66175 * group.width, y: group.minY + 0.44179 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 0.66175 * group.width, y: group.minY + 0.44857 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 0.65093 * group.width, y: group.minY + 0.44857 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 0.65093 * group.width, y: group.minY + 0.44179 * group.height))
        clip2Path.addCurve(to: CGPoint(x: group.minX + 0.62694 * group.width, y: group.minY + 0.41499 * group.height), controlPoint1: CGPoint(x: group.minX + 0.65093 * group.width, y: group.minY + 0.42693 * group.height), controlPoint2: CGPoint(x: group.minX + 0.64011 * group.width, y: group.minY + 0.41499 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 0.54037 * group.width, y: group.minY + 0.41499 * group.height))
        clip2Path.addCurve(to: CGPoint(x: group.minX + 0.51638 * group.width, y: group.minY + 0.44179 * group.height), controlPoint1: CGPoint(x: group.minX + 0.52720 * group.width, y: group.minY + 0.41499 * group.height), controlPoint2: CGPoint(x: group.minX + 0.51638 * group.width, y: group.minY + 0.42693 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 0.51638 * group.width, y: group.minY + 0.44857 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 0.50556 * group.width, y: group.minY + 0.44857 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 0.50556 * group.width, y: group.minY + 0.44179 * group.height))
        clip2Path.addCurve(to: CGPoint(x: group.minX + 0.54066 * group.width, y: group.minY + 0.40272 * group.height), controlPoint1: CGPoint(x: group.minX + 0.50556 * group.width, y: group.minY + 0.42048 * group.height), controlPoint2: CGPoint(x: group.minX + 0.52135 * group.width, y: group.minY + 0.40272 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 0.62724 * group.width, y: group.minY + 0.40272 * group.height))
        clip2Path.addCurve(to: CGPoint(x: group.minX + 0.66175 * group.width, y: group.minY + 0.44179 * group.height), controlPoint1: CGPoint(x: group.minX + 0.64625 * group.width, y: group.minY + 0.40272 * group.height), controlPoint2: CGPoint(x: group.minX + 0.66175 * group.width, y: group.minY + 0.42015 * group.height))
        clip2Path.close()
        clip2Path.move(to: CGPoint(x: group.minX + 0.70445 * group.width, y: group.minY + 0.45987 * group.height))
        clip2Path.addCurve(to: CGPoint(x: group.minX + 0.72961 * group.width, y: group.minY + 0.48796 * group.height), controlPoint1: CGPoint(x: group.minX + 0.71849 * group.width, y: group.minY + 0.45987 * group.height), controlPoint2: CGPoint(x: group.minX + 0.72990 * group.width, y: group.minY + 0.47246 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 0.72961 * group.width, y: group.minY + 0.66135 * group.height))
        clip2Path.addCurve(to: CGPoint(x: group.minX + 0.70124 * group.width, y: group.minY + 0.69267 * group.height), controlPoint1: CGPoint(x: group.minX + 0.72961 * group.width, y: group.minY + 0.67846 * group.height), controlPoint2: CGPoint(x: group.minX + 0.71703 * group.width, y: group.minY + 0.69267 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 0.46578 * group.width, y: group.minY + 0.69267 * group.height))
        clip2Path.addCurve(to: CGPoint(x: group.minX + 0.43741 * group.width, y: group.minY + 0.66135 * group.height), controlPoint1: CGPoint(x: group.minX + 0.45028 * group.width, y: group.minY + 0.69267 * group.height), controlPoint2: CGPoint(x: group.minX + 0.43741 * group.width, y: group.minY + 0.67879 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 0.43741 * group.width, y: group.minY + 0.48796 * group.height))
        clip2Path.addCurve(to: CGPoint(x: group.minX + 0.46286 * group.width, y: group.minY + 0.45987 * group.height), controlPoint1: CGPoint(x: group.minX + 0.43741 * group.width, y: group.minY + 0.47246 * group.height), controlPoint2: CGPoint(x: group.minX + 0.44882 * group.width, y: group.minY + 0.45987 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 0.70445 * group.width, y: group.minY + 0.45987 * group.height))
        clip2Path.close()
        clip2Path.move(to: CGPoint(x: group.minX + 0.64596 * group.width, y: group.minY + 0.59645 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 0.64596 * group.width, y: group.minY + 0.55609 * group.height))
        clip2Path.addCurve(to: CGPoint(x: group.minX + 0.64332 * group.width, y: group.minY + 0.55318 * group.height), controlPoint1: CGPoint(x: group.minX + 0.64596 * group.width, y: group.minY + 0.55447 * group.height), controlPoint2: CGPoint(x: group.minX + 0.64479 * group.width, y: group.minY + 0.55318 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 0.60413 * group.width, y: group.minY + 0.55318 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 0.60413 * group.width, y: group.minY + 0.50830 * group.height))
        clip2Path.addCurve(to: CGPoint(x: group.minX + 0.60150 * group.width, y: group.minY + 0.50540 * group.height), controlPoint1: CGPoint(x: group.minX + 0.60413 * group.width, y: group.minY + 0.50669 * group.height), controlPoint2: CGPoint(x: group.minX + 0.60296 * group.width, y: group.minY + 0.50540 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 0.56581 * group.width, y: group.minY + 0.50540 * group.height))
        clip2Path.addCurve(to: CGPoint(x: group.minX + 0.56318 * group.width, y: group.minY + 0.50830 * group.height), controlPoint1: CGPoint(x: group.minX + 0.56435 * group.width, y: group.minY + 0.50540 * group.height), controlPoint2: CGPoint(x: group.minX + 0.56318 * group.width, y: group.minY + 0.50669 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 0.56318 * group.width, y: group.minY + 0.55318 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 0.52399 * group.width, y: group.minY + 0.55318 * group.height))
        clip2Path.addCurve(to: CGPoint(x: group.minX + 0.52135 * group.width, y: group.minY + 0.55609 * group.height), controlPoint1: CGPoint(x: group.minX + 0.52252 * group.width, y: group.minY + 0.55318 * group.height), controlPoint2: CGPoint(x: group.minX + 0.52135 * group.width, y: group.minY + 0.55447 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 0.52135 * group.width, y: group.minY + 0.59645 * group.height))
        clip2Path.addCurve(to: CGPoint(x: group.minX + 0.52399 * group.width, y: group.minY + 0.59936 * group.height), controlPoint1: CGPoint(x: group.minX + 0.52135 * group.width, y: group.minY + 0.59806 * group.height), controlPoint2: CGPoint(x: group.minX + 0.52252 * group.width, y: group.minY + 0.59936 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 0.56318 * group.width, y: group.minY + 0.59936 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 0.56318 * group.width, y: group.minY + 0.64424 * group.height))
        clip2Path.addCurve(to: CGPoint(x: group.minX + 0.56581 * group.width, y: group.minY + 0.64714 * group.height), controlPoint1: CGPoint(x: group.minX + 0.56318 * group.width, y: group.minY + 0.64585 * group.height), controlPoint2: CGPoint(x: group.minX + 0.56435 * group.width, y: group.minY + 0.64714 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 0.60150 * group.width, y: group.minY + 0.64714 * group.height))
        clip2Path.addCurve(to: CGPoint(x: group.minX + 0.60413 * group.width, y: group.minY + 0.64424 * group.height), controlPoint1: CGPoint(x: group.minX + 0.60296 * group.width, y: group.minY + 0.64714 * group.height), controlPoint2: CGPoint(x: group.minX + 0.60413 * group.width, y: group.minY + 0.64585 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 0.60413 * group.width, y: group.minY + 0.59936 * group.height))
        clip2Path.addLine(to: CGPoint(x: group.minX + 0.64332 * group.width, y: group.minY + 0.59936 * group.height))
        clip2Path.addCurve(to: CGPoint(x: group.minX + 0.64596 * group.width, y: group.minY + 0.59645 * group.height), controlPoint1: CGPoint(x: group.minX + 0.64479 * group.width, y: group.minY + 0.59936 * group.height), controlPoint2: CGPoint(x: group.minX + 0.64596 * group.width, y: group.minY + 0.59806 * group.height))
        clip2Path.close()
        clip2Path.usesEvenOddFillRule = true
        clip2Path.addClip()
        //// Bezier 8 Drawing
        let bezier8Path = UIBezierPath()
        bezier8Path.move(to: CGPoint(x: group.minX + 0.66175 * group.width, y: group.minY + 0.44179 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.66175 * group.width, y: group.minY + 0.44857 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.65093 * group.width, y: group.minY + 0.44857 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.65093 * group.width, y: group.minY + 0.44179 * group.height))
        bezier8Path.addCurve(to: CGPoint(x: group.minX + 0.62694 * group.width, y: group.minY + 0.41499 * group.height), controlPoint1: CGPoint(x: group.minX + 0.65093 * group.width, y: group.minY + 0.42693 * group.height), controlPoint2: CGPoint(x: group.minX + 0.64011 * group.width, y: group.minY + 0.41499 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.54037 * group.width, y: group.minY + 0.41499 * group.height))
        bezier8Path.addCurve(to: CGPoint(x: group.minX + 0.51638 * group.width, y: group.minY + 0.44179 * group.height), controlPoint1: CGPoint(x: group.minX + 0.52720 * group.width, y: group.minY + 0.41499 * group.height), controlPoint2: CGPoint(x: group.minX + 0.51638 * group.width, y: group.minY + 0.42693 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.51638 * group.width, y: group.minY + 0.44857 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.50556 * group.width, y: group.minY + 0.44857 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.50556 * group.width, y: group.minY + 0.44179 * group.height))
        bezier8Path.addCurve(to: CGPoint(x: group.minX + 0.54066 * group.width, y: group.minY + 0.40272 * group.height), controlPoint1: CGPoint(x: group.minX + 0.50556 * group.width, y: group.minY + 0.42048 * group.height), controlPoint2: CGPoint(x: group.minX + 0.52135 * group.width, y: group.minY + 0.40272 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.62724 * group.width, y: group.minY + 0.40272 * group.height))
        bezier8Path.addCurve(to: CGPoint(x: group.minX + 0.66175 * group.width, y: group.minY + 0.44179 * group.height), controlPoint1: CGPoint(x: group.minX + 0.64625 * group.width, y: group.minY + 0.40272 * group.height), controlPoint2: CGPoint(x: group.minX + 0.66175 * group.width, y: group.minY + 0.42015 * group.height))
        bezier8Path.close()
        bezier8Path.move(to: CGPoint(x: group.minX + 0.70445 * group.width, y: group.minY + 0.45987 * group.height))
        bezier8Path.addCurve(to: CGPoint(x: group.minX + 0.72961 * group.width, y: group.minY + 0.48796 * group.height), controlPoint1: CGPoint(x: group.minX + 0.71849 * group.width, y: group.minY + 0.45987 * group.height), controlPoint2: CGPoint(x: group.minX + 0.72990 * group.width, y: group.minY + 0.47246 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.72961 * group.width, y: group.minY + 0.66135 * group.height))
        bezier8Path.addCurve(to: CGPoint(x: group.minX + 0.70124 * group.width, y: group.minY + 0.69267 * group.height), controlPoint1: CGPoint(x: group.minX + 0.72961 * group.width, y: group.minY + 0.67846 * group.height), controlPoint2: CGPoint(x: group.minX + 0.71703 * group.width, y: group.minY + 0.69267 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.46578 * group.width, y: group.minY + 0.69267 * group.height))
        bezier8Path.addCurve(to: CGPoint(x: group.minX + 0.43741 * group.width, y: group.minY + 0.66135 * group.height), controlPoint1: CGPoint(x: group.minX + 0.45028 * group.width, y: group.minY + 0.69267 * group.height), controlPoint2: CGPoint(x: group.minX + 0.43741 * group.width, y: group.minY + 0.67879 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.43741 * group.width, y: group.minY + 0.48796 * group.height))
        bezier8Path.addCurve(to: CGPoint(x: group.minX + 0.46286 * group.width, y: group.minY + 0.45987 * group.height), controlPoint1: CGPoint(x: group.minX + 0.43741 * group.width, y: group.minY + 0.47246 * group.height), controlPoint2: CGPoint(x: group.minX + 0.44882 * group.width, y: group.minY + 0.45987 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.70445 * group.width, y: group.minY + 0.45987 * group.height))
        bezier8Path.close()
        bezier8Path.move(to: CGPoint(x: group.minX + 0.64595 * group.width, y: group.minY + 0.59645 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.64595 * group.width, y: group.minY + 0.55609 * group.height))
        bezier8Path.addCurve(to: CGPoint(x: group.minX + 0.64332 * group.width, y: group.minY + 0.55318 * group.height), controlPoint1: CGPoint(x: group.minX + 0.64595 * group.width, y: group.minY + 0.55447 * group.height), controlPoint2: CGPoint(x: group.minX + 0.64479 * group.width, y: group.minY + 0.55318 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.60413 * group.width, y: group.minY + 0.55318 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.60413 * group.width, y: group.minY + 0.50830 * group.height))
        bezier8Path.addCurve(to: CGPoint(x: group.minX + 0.60150 * group.width, y: group.minY + 0.50540 * group.height), controlPoint1: CGPoint(x: group.minX + 0.60413 * group.width, y: group.minY + 0.50669 * group.height), controlPoint2: CGPoint(x: group.minX + 0.60296 * group.width, y: group.minY + 0.50540 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.56581 * group.width, y: group.minY + 0.50540 * group.height))
        bezier8Path.addCurve(to: CGPoint(x: group.minX + 0.56318 * group.width, y: group.minY + 0.50830 * group.height), controlPoint1: CGPoint(x: group.minX + 0.56435 * group.width, y: group.minY + 0.50540 * group.height), controlPoint2: CGPoint(x: group.minX + 0.56318 * group.width, y: group.minY + 0.50669 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.56318 * group.width, y: group.minY + 0.55318 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.52399 * group.width, y: group.minY + 0.55318 * group.height))
        bezier8Path.addCurve(to: CGPoint(x: group.minX + 0.52135 * group.width, y: group.minY + 0.55609 * group.height), controlPoint1: CGPoint(x: group.minX + 0.52252 * group.width, y: group.minY + 0.55318 * group.height), controlPoint2: CGPoint(x: group.minX + 0.52135 * group.width, y: group.minY + 0.55447 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.52135 * group.width, y: group.minY + 0.59645 * group.height))
        bezier8Path.addCurve(to: CGPoint(x: group.minX + 0.52399 * group.width, y: group.minY + 0.59936 * group.height), controlPoint1: CGPoint(x: group.minX + 0.52135 * group.width, y: group.minY + 0.59806 * group.height), controlPoint2: CGPoint(x: group.minX + 0.52252 * group.width, y: group.minY + 0.59936 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.56318 * group.width, y: group.minY + 0.59936 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.56318 * group.width, y: group.minY + 0.64424 * group.height))
        bezier8Path.addCurve(to: CGPoint(x: group.minX + 0.56581 * group.width, y: group.minY + 0.64714 * group.height), controlPoint1: CGPoint(x: group.minX + 0.56318 * group.width, y: group.minY + 0.64585 * group.height), controlPoint2: CGPoint(x: group.minX + 0.56435 * group.width, y: group.minY + 0.64714 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.60150 * group.width, y: group.minY + 0.64714 * group.height))
        bezier8Path.addCurve(to: CGPoint(x: group.minX + 0.60413 * group.width, y: group.minY + 0.64424 * group.height), controlPoint1: CGPoint(x: group.minX + 0.60296 * group.width, y: group.minY + 0.64714 * group.height), controlPoint2: CGPoint(x: group.minX + 0.60413 * group.width, y: group.minY + 0.64585 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.60413 * group.width, y: group.minY + 0.59936 * group.height))
        bezier8Path.addLine(to: CGPoint(x: group.minX + 0.64332 * group.width, y: group.minY + 0.59936 * group.height))
        bezier8Path.addCurve(to: CGPoint(x: group.minX + 0.64595 * group.width, y: group.minY + 0.59645 * group.height), controlPoint1: CGPoint(x: group.minX + 0.64479 * group.width, y: group.minY + 0.59936 * group.height), controlPoint2: CGPoint(x: group.minX + 0.64595 * group.width, y: group.minY + 0.59806 * group.height))
        bezier8Path.close()
        color(for: .fill).setStroke()
        bezier8Path.lineWidth = 2
        bezier8Path.stroke()
        context.endTransparencyLayer()
        context.restoreGState()
        //// Bezier 7 Drawing
        let bezier7Path = UIBezierPath()
        bezier7Path.move(to: CGPoint(x: group.minX + 0.65201 * group.width, y: group.minY + 0.44223 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.65201 * group.width, y: group.minY + 0.44882 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.64161 * group.width, y: group.minY + 0.44882 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.64161 * group.width, y: group.minY + 0.44223 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.61858 * group.width, y: group.minY + 0.41618 * group.height), controlPoint1: CGPoint(x: group.minX + 0.64161 * group.width, y: group.minY + 0.42779 * group.height), controlPoint2: CGPoint(x: group.minX + 0.63122 * group.width, y: group.minY + 0.41618 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.53542 * group.width, y: group.minY + 0.41618 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.51239 * group.width, y: group.minY + 0.44223 * group.height), controlPoint1: CGPoint(x: group.minX + 0.52278 * group.width, y: group.minY + 0.41618 * group.height), controlPoint2: CGPoint(x: group.minX + 0.51239 * group.width, y: group.minY + 0.42779 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.51239 * group.width, y: group.minY + 0.44882 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.50199 * group.width, y: group.minY + 0.44882 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.50199 * group.width, y: group.minY + 0.44223 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.53570 * group.width, y: group.minY + 0.40426 * group.height), controlPoint1: CGPoint(x: group.minX + 0.50199 * group.width, y: group.minY + 0.42151 * group.height), controlPoint2: CGPoint(x: group.minX + 0.51716 * group.width, y: group.minY + 0.40426 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.61886 * group.width, y: group.minY + 0.40426 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.65201 * group.width, y: group.minY + 0.44223 * group.height), controlPoint1: CGPoint(x: group.minX + 0.63712 * group.width, y: group.minY + 0.40426 * group.height), controlPoint2: CGPoint(x: group.minX + 0.65201 * group.width, y: group.minY + 0.42120 * group.height))
        bezier7Path.close()
        bezier7Path.move(to: CGPoint(x: group.minX + 0.69302 * group.width, y: group.minY + 0.45980 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.71718 * group.width, y: group.minY + 0.48710 * group.height), controlPoint1: CGPoint(x: group.minX + 0.70651 * group.width, y: group.minY + 0.45980 * group.height), controlPoint2: CGPoint(x: group.minX + 0.71746 * group.width, y: group.minY + 0.47204 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.71718 * group.width, y: group.minY + 0.65561 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.68993 * group.width, y: group.minY + 0.68605 * group.height), controlPoint1: CGPoint(x: group.minX + 0.71718 * group.width, y: group.minY + 0.67224 * group.height), controlPoint2: CGPoint(x: group.minX + 0.70510 * group.width, y: group.minY + 0.68605 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.46379 * group.width, y: group.minY + 0.68605 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.43654 * group.width, y: group.minY + 0.65561 * group.height), controlPoint1: CGPoint(x: group.minX + 0.44890 * group.width, y: group.minY + 0.68605 * group.height), controlPoint2: CGPoint(x: group.minX + 0.43654 * group.width, y: group.minY + 0.67255 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.43654 * group.width, y: group.minY + 0.48710 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.46098 * group.width, y: group.minY + 0.45980 * group.height), controlPoint1: CGPoint(x: group.minX + 0.43654 * group.width, y: group.minY + 0.47204 * group.height), controlPoint2: CGPoint(x: group.minX + 0.44749 * group.width, y: group.minY + 0.45980 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.69302 * group.width, y: group.minY + 0.45980 * group.height))
        bezier7Path.close()
        bezier7Path.move(to: CGPoint(x: group.minX + 0.63684 * group.width, y: group.minY + 0.59254 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.63684 * group.width, y: group.minY + 0.55331 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.63431 * group.width, y: group.minY + 0.55049 * group.height), controlPoint1: CGPoint(x: group.minX + 0.63684 * group.width, y: group.minY + 0.55174 * group.height), controlPoint2: CGPoint(x: group.minX + 0.63571 * group.width, y: group.minY + 0.55049 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.59667 * group.width, y: group.minY + 0.55049 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.59667 * group.width, y: group.minY + 0.50687 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.59414 * group.width, y: group.minY + 0.50404 * group.height), controlPoint1: CGPoint(x: group.minX + 0.59667 * group.width, y: group.minY + 0.50530 * group.height), controlPoint2: CGPoint(x: group.minX + 0.59554 * group.width, y: group.minY + 0.50404 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.55986 * group.width, y: group.minY + 0.50404 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.55734 * group.width, y: group.minY + 0.50687 * group.height), controlPoint1: CGPoint(x: group.minX + 0.55846 * group.width, y: group.minY + 0.50404 * group.height), controlPoint2: CGPoint(x: group.minX + 0.55734 * group.width, y: group.minY + 0.50530 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.55734 * group.width, y: group.minY + 0.55049 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.51969 * group.width, y: group.minY + 0.55049 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.51716 * group.width, y: group.minY + 0.55331 * group.height), controlPoint1: CGPoint(x: group.minX + 0.51829 * group.width, y: group.minY + 0.55049 * group.height), controlPoint2: CGPoint(x: group.minX + 0.51716 * group.width, y: group.minY + 0.55174 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.51716 * group.width, y: group.minY + 0.59254 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.51969 * group.width, y: group.minY + 0.59536 * group.height), controlPoint1: CGPoint(x: group.minX + 0.51716 * group.width, y: group.minY + 0.59410 * group.height), controlPoint2: CGPoint(x: group.minX + 0.51829 * group.width, y: group.minY + 0.59536 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.55734 * group.width, y: group.minY + 0.59536 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.55734 * group.width, y: group.minY + 0.63898 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.55986 * group.width, y: group.minY + 0.64180 * group.height), controlPoint1: CGPoint(x: group.minX + 0.55734 * group.width, y: group.minY + 0.64055 * group.height), controlPoint2: CGPoint(x: group.minX + 0.55846 * group.width, y: group.minY + 0.64180 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.59414 * group.width, y: group.minY + 0.64180 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.59667 * group.width, y: group.minY + 0.63898 * group.height), controlPoint1: CGPoint(x: group.minX + 0.59554 * group.width, y: group.minY + 0.64180 * group.height), controlPoint2: CGPoint(x: group.minX + 0.59667 * group.width, y: group.minY + 0.64055 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.59667 * group.width, y: group.minY + 0.59536 * group.height))
        bezier7Path.addLine(to: CGPoint(x: group.minX + 0.63431 * group.width, y: group.minY + 0.59536 * group.height))
        bezier7Path.addCurve(to: CGPoint(x: group.minX + 0.63684 * group.width, y: group.minY + 0.59254 * group.height), controlPoint1: CGPoint(x: group.minX + 0.63571 * group.width, y: group.minY + 0.59536 * group.height), controlPoint2: CGPoint(x: group.minX + 0.63684 * group.width, y: group.minY + 0.59410 * group.height))
        bezier7Path.close()
        color(for: .fill).setFill()
        bezier7Path.fill()
    }
    
}

extension RKEventIconView {
    
    private func drawVacationCanvas(in frame: CGRect) {
        let group3: CGRect = CGRect(x: frame.minX + fastFloor(frame.width * 0.02632 + 0.5), y: frame.minY + fastFloor(frame.height * 0.02632 + 0.5), width: fastFloor(frame.width * 0.97368 + 0.5) - fastFloor(frame.width * 0.02632 + 0.5), height: fastFloor(frame.height * 0.97368 + 0.5) - fastFloor(frame.height * 0.02632 + 0.5))
        //// Group 3
        
        //drawBackgroudCanvas(in: frame)
        
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: group3.minX + 0.76348 * group3.width, y: group3.minY + 0.84079 * group3.height))
        bezierPath.addLine(to: CGPoint(x: group3.minX + 0.21441 * group3.width, y: group3.minY + 0.84079 * group3.height))
        bezierPath.addCurve(to: CGPoint(x: group3.minX + 0.43999 * group3.width, y: group3.minY + 0.75710 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.24784 * group3.width, y: group3.minY + 0.79126 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.36851 * group3.width, y: group3.minY + 0.75373 * group3.height))
        bezierPath.addLine(to: CGPoint(x: group3.minX + 0.43999 * group3.width, y: group3.minY + 0.73496 * group3.height))
        bezierPath.addLine(to: CGPoint(x: group3.minX + 0.51461 * group3.width, y: group3.minY + 0.73496 * group3.height))
        bezierPath.addCurve(to: CGPoint(x: group3.minX + 0.51460 * group3.width, y: group3.minY + 0.75677 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.51460 * group3.width, y: group3.minY + 0.74446 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.51460 * group3.width, y: group3.minY + 0.74726 * group3.height))
        bezierPath.addCurve(to: CGPoint(x: group3.minX + 0.76348 * group3.width, y: group3.minY + 0.84079 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.58330 * group3.width, y: group3.minY + 0.74672 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.74305 * group3.width, y: group3.minY + 0.79087 * group3.height))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: group3.minX + 0.29991 * group3.width, y: group3.minY + 0.57578 * group3.height))
        bezierPath.addCurve(to: CGPoint(x: group3.minX + 0.41289 * group3.width, y: group3.minY + 0.33496 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.25007 * group3.width, y: group3.minY + 0.44674 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.25616 * group3.width, y: group3.minY + 0.37740 * group3.height))
        bezierPath.addCurve(to: CGPoint(x: group3.minX + 0.16910 * group3.width, y: group3.minY + 0.38699 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.29563 * group3.width, y: group3.minY + 0.31840 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.23428 * group3.width, y: group3.minY + 0.34104 * group3.height))
        bezierPath.addCurve(to: CGPoint(x: group3.minX + 0.42094 * group3.width, y: group3.minY + 0.27982 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.21040 * group3.width, y: group3.minY + 0.30221 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.32473 * group3.width, y: group3.minY + 0.18360 * group3.height))
        bezierPath.addCurve(to: CGPoint(x: group3.minX + 0.26721 * group3.width, y: group3.minY + 0.15659 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.39778 * group3.width, y: group3.minY + 0.20169 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.34229 * group3.width, y: group3.minY + 0.16256 * group3.height))
        bezierPath.addCurve(to: CGPoint(x: group3.minX + 0.48190 * group3.width, y: group3.minY + 0.28456 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.43011 * group3.width, y: group3.minY + 0.11345 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.49076 * group3.width, y: group3.minY + 0.18254 * group3.height))
        bezierPath.addCurve(to: CGPoint(x: group3.minX + 0.72208 * group3.width, y: group3.minY + 0.26807 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.52409 * group3.width, y: group3.minY + 0.16321 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.67310 * group3.width, y: group3.minY + 0.17649 * group3.height))
        bezierPath.addCurve(to: CGPoint(x: group3.minX + 0.52438 * group3.width, y: group3.minY + 0.31415 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.65024 * group3.width, y: group3.minY + 0.23643 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.56423 * group3.width, y: group3.minY + 0.25879 * group3.height))
        bezierPath.addCurve(to: CGPoint(x: group3.minX + 0.68938 * group3.width, y: group3.minY + 0.49550 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.65476 * group3.width, y: group3.minY + 0.31033 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.69649 * group3.width, y: group3.minY + 0.38692 * group3.height))
        bezierPath.addCurve(to: CGPoint(x: group3.minX + 0.48847 * group3.width, y: group3.minY + 0.36446 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.62932 * group3.width, y: group3.minY + 0.38455 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.51065 * group3.width, y: group3.minY + 0.35325 * group3.height))
        bezierPath.addLine(to: CGPoint(x: group3.minX + 0.48847 * group3.width, y: group3.minY + 0.41894 * group3.height))
        bezierPath.addLine(to: CGPoint(x: group3.minX + 0.46617 * group3.width, y: group3.minY + 0.41894 * group3.height))
        bezierPath.addLine(to: CGPoint(x: group3.minX + 0.46617 * group3.width, y: group3.minY + 0.37209 * group3.height))
        bezierPath.addCurve(to: CGPoint(x: group3.minX + 0.29991 * group3.width, y: group3.minY + 0.57578 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.41793 * group3.width, y: group3.minY + 0.39566 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.31521 * group3.width, y: group3.minY + 0.44761 * group3.height))
        bezierPath.addLine(to: CGPoint(x: group3.minX + 0.29991 * group3.width, y: group3.minY + 0.57578 * group3.height))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: group3.minX + 0.46468 * group3.width, y: group3.minY + 0.44273 * group3.height))
        bezierPath.addLine(to: CGPoint(x: group3.minX + 0.46468 * group3.width, y: group3.minY + 0.49625 * group3.height))
        bezierPath.addLine(to: CGPoint(x: group3.minX + 0.49292 * group3.width, y: group3.minY + 0.49625 * group3.height))
        bezierPath.addLine(to: CGPoint(x: group3.minX + 0.49292 * group3.width, y: group3.minY + 0.44273 * group3.height))
        bezierPath.addLine(to: CGPoint(x: group3.minX + 0.46468 * group3.width, y: group3.minY + 0.44273 * group3.height))
        bezierPath.addLine(to: CGPoint(x: group3.minX + 0.46468 * group3.width, y: group3.minY + 0.44273 * group3.height))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: group3.minX + 0.46468 * group3.width, y: group3.minY + 0.52003 * group3.height))
        bezierPath.addLine(to: CGPoint(x: group3.minX + 0.46468 * group3.width, y: group3.minY + 0.56909 * group3.height))
        bezierPath.addLine(to: CGPoint(x: group3.minX + 0.49441 * group3.width, y: group3.minY + 0.56909 * group3.height))
        bezierPath.addLine(to: CGPoint(x: group3.minX + 0.49441 * group3.width, y: group3.minY + 0.52003 * group3.height))
        bezierPath.addLine(to: CGPoint(x: group3.minX + 0.46468 * group3.width, y: group3.minY + 0.52003 * group3.height))
        bezierPath.addLine(to: CGPoint(x: group3.minX + 0.46468 * group3.width, y: group3.minY + 0.52003 * group3.height))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: group3.minX + 0.45873 * group3.width, y: group3.minY + 0.58990 * group3.height))
        bezierPath.addLine(to: CGPoint(x: group3.minX + 0.49887 * group3.width, y: group3.minY + 0.58990 * group3.height))
        bezierPath.addLine(to: CGPoint(x: group3.minX + 0.49887 * group3.width, y: group3.minY + 0.64192 * group3.height))
        bezierPath.addLine(to: CGPoint(x: group3.minX + 0.45873 * group3.width, y: group3.minY + 0.64192 * group3.height))
        bezierPath.addLine(to: CGPoint(x: group3.minX + 0.45873 * group3.width, y: group3.minY + 0.58990 * group3.height))
        bezierPath.addLine(to: CGPoint(x: group3.minX + 0.45873 * group3.width, y: group3.minY + 0.58990 * group3.height))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: group3.minX + 0.45428 * group3.width, y: group3.minY + 0.66571 * group3.height))
        bezierPath.addLine(to: CGPoint(x: group3.minX + 0.50630 * group3.width, y: group3.minY + 0.66571 * group3.height))
        bezierPath.addLine(to: CGPoint(x: group3.minX + 0.50630 * group3.width, y: group3.minY + 0.71625 * group3.height))
        bezierPath.addLine(to: CGPoint(x: group3.minX + 0.45428 * group3.width, y: group3.minY + 0.71625 * group3.height))
        bezierPath.addLine(to: CGPoint(x: group3.minX + 0.45428 * group3.width, y: group3.minY + 0.66571 * group3.height))
        bezierPath.close()
        color(for: .fill).setFill()
        bezierPath.fill()
    }
    
}

extension RKEventIconView {
    
    private func drawSickLeaveCanvas(in frame: CGRect) {
        //// Subframes
        let group: CGRect = CGRect(x: frame.minX + fastFloor(frame.width * 0.01316) + 0.5, y: frame.minY + fastFloor(frame.height * 0.01316) + 0.5, width: fastFloor(frame.width * 0.98684) - fastFloor(frame.width * 0.01316), height: fastFloor(frame.height * 0.98684) - fastFloor(frame.height * 0.01316))
        
        //drawBackgroudCanvas(in: frame)
        
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: group.minX + 0.38826 * group.width, y: group.minY + 0.49964 * group.height))
        bezierPath.addCurve(to: CGPoint(x: group.minX + 0.32829 * group.width, y: group.minY + 0.43971 * group.height), controlPoint1: CGPoint(x: group.minX + 0.35514 * group.width, y: group.minY + 0.49964 * group.height), controlPoint2: CGPoint(x: group.minX + 0.32829 * group.width, y: group.minY + 0.47281 * group.height))
        bezierPath.addCurve(to: CGPoint(x: group.minX + 0.38826 * group.width, y: group.minY + 0.37979 * group.height), controlPoint1: CGPoint(x: group.minX + 0.32829 * group.width, y: group.minY + 0.40662 * group.height), controlPoint2: CGPoint(x: group.minX + 0.35514 * group.width, y: group.minY + 0.37979 * group.height))
        bezierPath.addCurve(to: CGPoint(x: group.minX + 0.44823 * group.width, y: group.minY + 0.43971 * group.height), controlPoint1: CGPoint(x: group.minX + 0.42138 * group.width, y: group.minY + 0.37979 * group.height), controlPoint2: CGPoint(x: group.minX + 0.44823 * group.width, y: group.minY + 0.40662 * group.height))
        bezierPath.addCurve(to: CGPoint(x: group.minX + 0.43066 * group.width, y: group.minY + 0.48208 * group.height), controlPoint1: CGPoint(x: group.minX + 0.44823 * group.width, y: group.minY + 0.45561 * group.height), controlPoint2: CGPoint(x: group.minX + 0.44191 * group.width, y: group.minY + 0.47085 * group.height))
        bezierPath.addCurve(to: CGPoint(x: group.minX + 0.38826 * group.width, y: group.minY + 0.49964 * group.height), controlPoint1: CGPoint(x: group.minX + 0.41942 * group.width, y: group.minY + 0.49332 * group.height), controlPoint2: CGPoint(x: group.minX + 0.40416 * group.width, y: group.minY + 0.49964 * group.height))
        bezierPath.addLine(to: CGPoint(x: group.minX + 0.38826 * group.width, y: group.minY + 0.49964 * group.height))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: group.minX + 0.22548 * group.width, y: group.minY + 0.67084 * group.height))
        bezierPath.addCurve(to: CGPoint(x: group.minX + 0.25975 * group.width, y: group.minY + 0.70508 * group.height), controlPoint1: CGPoint(x: group.minX + 0.22548 * group.width, y: group.minY + 0.68975 * group.height), controlPoint2: CGPoint(x: group.minX + 0.24083 * group.width, y: group.minY + 0.70508 * group.height))
        bezierPath.addCurve(to: CGPoint(x: group.minX + 0.29402 * group.width, y: group.minY + 0.67084 * group.height), controlPoint1: CGPoint(x: group.minX + 0.27868 * group.width, y: group.minY + 0.70508 * group.height), controlPoint2: CGPoint(x: group.minX + 0.29402 * group.width, y: group.minY + 0.68975 * group.height))
        bezierPath.addLine(to: CGPoint(x: group.minX + 0.29402 * group.width, y: group.minY + 0.60236 * group.height))
        bezierPath.addLine(to: CGPoint(x: group.minX + 0.70524 * group.width, y: group.minY + 0.60236 * group.height))
        bezierPath.addLine(to: CGPoint(x: group.minX + 0.70524 * group.width, y: group.minY + 0.67084 * group.height))
        bezierPath.addCurve(to: CGPoint(x: group.minX + 0.73950 * group.width, y: group.minY + 0.70508 * group.height), controlPoint1: CGPoint(x: group.minX + 0.70524 * group.width, y: group.minY + 0.68975 * group.height), controlPoint2: CGPoint(x: group.minX + 0.72058 * group.width, y: group.minY + 0.70508 * group.height))
        bezierPath.addCurve(to: CGPoint(x: group.minX + 0.77377 * group.width, y: group.minY + 0.67084 * group.height), controlPoint1: CGPoint(x: group.minX + 0.75843 * group.width, y: group.minY + 0.70508 * group.height), controlPoint2: CGPoint(x: group.minX + 0.77377 * group.width, y: group.minY + 0.68975 * group.height))
        bezierPath.addLine(to: CGPoint(x: group.minX + 0.77377 * group.width, y: group.minY + 0.42259 * group.height))
        bezierPath.addCurve(to: CGPoint(x: group.minX + 0.69667 * group.width, y: group.minY + 0.34555 * group.height), controlPoint1: CGPoint(x: group.minX + 0.77377 * group.width, y: group.minY + 0.38004 * group.height), controlPoint2: CGPoint(x: group.minX + 0.73925 * group.width, y: group.minY + 0.34555 * group.height))
        bezierPath.addLine(to: CGPoint(x: group.minX + 0.51676 * group.width, y: group.minY + 0.34555 * group.height))
        bezierPath.addCurve(to: CGPoint(x: group.minX + 0.48249 * group.width, y: group.minY + 0.37979 * group.height), controlPoint1: CGPoint(x: group.minX + 0.49784 * group.width, y: group.minY + 0.34555 * group.height), controlPoint2: CGPoint(x: group.minX + 0.48249 * group.width, y: group.minY + 0.36088 * group.height))
        bezierPath.addLine(to: CGPoint(x: group.minX + 0.48249 * group.width, y: group.minY + 0.53388 * group.height))
        bezierPath.addLine(to: CGPoint(x: group.minX + 0.29402 * group.width, y: group.minY + 0.53388 * group.height))
        bezierPath.addLine(to: CGPoint(x: group.minX + 0.29402 * group.width, y: group.minY + 0.32843 * group.height))
        bezierPath.addCurve(to: CGPoint(x: group.minX + 0.25975 * group.width, y: group.minY + 0.29419 * group.height), controlPoint1: CGPoint(x: group.minX + 0.29402 * group.width, y: group.minY + 0.30952 * group.height), controlPoint2: CGPoint(x: group.minX + 0.27868 * group.width, y: group.minY + 0.29419 * group.height))
        bezierPath.addCurve(to: CGPoint(x: group.minX + 0.22548 * group.width, y: group.minY + 0.32843 * group.height), controlPoint1: CGPoint(x: group.minX + 0.24083 * group.width, y: group.minY + 0.29419 * group.height), controlPoint2: CGPoint(x: group.minX + 0.22548 * group.width, y: group.minY + 0.30952 * group.height))
        bezierPath.addLine(to: CGPoint(x: group.minX + 0.22548 * group.width, y: group.minY + 0.67084 * group.height))
        bezierPath.close()
        color(for: .fill).setFill()
        bezierPath.fill()
    }
    
}

extension RKEventIconView {
    
    private func drawConferenceCanvas(in frame: CGRect) {
        //drawBackgroudCanvas(in: frame)
        
        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: frame.minX + 0.62938 * frame.width, y: frame.minY + 0.41387 * frame.height))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 0.61277 * frame.width, y: frame.minY + 0.43069 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.62020 * frame.width, y: frame.minY + 0.41387 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.61277 * frame.width, y: frame.minY + 0.42140 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.61277 * frame.width, y: frame.minY + 0.51813 * frame.height))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 0.48205 * frame.width, y: frame.minY + 0.65042 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.61277 * frame.width, y: frame.minY + 0.59108 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.55413 * frame.width, y: frame.minY + 0.65042 * frame.height))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 0.35134 * frame.width, y: frame.minY + 0.51813 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.40998 * frame.width, y: frame.minY + 0.65042 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.35134 * frame.width, y: frame.minY + 0.59108 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.35134 * frame.width, y: frame.minY + 0.43069 * frame.height))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 0.33472 * frame.width, y: frame.minY + 0.41387 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.35134 * frame.width, y: frame.minY + 0.42140 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.34390 * frame.width, y: frame.minY + 0.41387 * frame.height))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 0.31810 * frame.width, y: frame.minY + 0.43069 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.32554 * frame.width, y: frame.minY + 0.41387 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.31810 * frame.width, y: frame.minY + 0.42140 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.31810 * frame.width, y: frame.minY + 0.51813 * frame.height))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 0.46544 * frame.width, y: frame.minY + 0.68321 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.31810 * frame.width, y: frame.minY + 0.60395 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.38281 * frame.width, y: frame.minY + 0.67475 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.46544 * frame.width, y: frame.minY + 0.77037 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.42334 * frame.width, y: frame.minY + 0.77037 * frame.height))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 0.40672 * frame.width, y: frame.minY + 0.78719 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.41416 * frame.width, y: frame.minY + 0.77037 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.40672 * frame.width, y: frame.minY + 0.77790 * frame.height))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 0.42334 * frame.width, y: frame.minY + 0.80400 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.40672 * frame.width, y: frame.minY + 0.79648 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.41416 * frame.width, y: frame.minY + 0.80400 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.54077 * frame.width, y: frame.minY + 0.80400 * frame.height))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 0.55739 * frame.width, y: frame.minY + 0.78719 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.54995 * frame.width, y: frame.minY + 0.80400 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.55739 * frame.width, y: frame.minY + 0.79648 * frame.height))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 0.54077 * frame.width, y: frame.minY + 0.77037 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.55739 * frame.width, y: frame.minY + 0.77790 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.54995 * frame.width, y: frame.minY + 0.77037 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.49867 * frame.width, y: frame.minY + 0.77037 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.49867 * frame.width, y: frame.minY + 0.68321 * frame.height))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 0.64600 * frame.width, y: frame.minY + 0.51813 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.58129 * frame.width, y: frame.minY + 0.67475 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.64600 * frame.width, y: frame.minY + 0.60395 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.64600 * frame.width, y: frame.minY + 0.43069 * frame.height))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 0.62938 * frame.width, y: frame.minY + 0.41387 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.64600 * frame.width, y: frame.minY + 0.42140 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.63856 * frame.width, y: frame.minY + 0.41387 * frame.height))
        bezier2Path.close()
        bezier2Path.move(to: CGPoint(x: frame.minX + 0.48205 * frame.width, y: frame.minY + 0.58971 * frame.height))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 0.39187 * frame.width, y: frame.minY + 0.49845 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.43233 * frame.width, y: frame.minY + 0.58971 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.39187 * frame.width, y: frame.minY + 0.54877 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.39187 * frame.width, y: frame.minY + 0.32591 * frame.height))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 0.48205 * frame.width, y: frame.minY + 0.23465 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.39187 * frame.width, y: frame.minY + 0.27559 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.43233 * frame.width, y: frame.minY + 0.23465 * frame.height))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 0.57223 * frame.width, y: frame.minY + 0.32591 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.53178 * frame.width, y: frame.minY + 0.23465 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.57223 * frame.width, y: frame.minY + 0.27559 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.57223 * frame.width, y: frame.minY + 0.49845 * frame.height))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 0.48205 * frame.width, y: frame.minY + 0.58971 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.57223 * frame.width, y: frame.minY + 0.54877 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.53178 * frame.width, y: frame.minY + 0.58971 * frame.height))
        bezier2Path.close()
        color(for: .fill).setFill()
        bezier2Path.fill()
    }
    
}

extension RKEventIconView {
    
    private func drawAppointmentCanvas(in frame: CGRect) {
        //drawBackgroudCanvas(in: frame)
        
        //// Subframes
        let group5: CGRect = CGRect(x: frame.minX + fastFloor(frame.width * 0.08586 + 0.24) + 0.26, y: frame.minY + fastFloor(frame.height * 0.26460 + 0.45) + 0.05, width: fastFloor(frame.width * 0.88085 + 0.03) - fastFloor(frame.width * 0.08586 + 0.24) + 0.21, height: fastFloor(frame.height * 0.73790 + 0.46) - fastFloor(frame.height * 0.26460 + 0.45) - 0.01)
        
        //// Clip Clip 2
        let clip2Path = UIBezierPath()
        clip2Path.move(to: CGPoint(x: group5.minX + 0.99749 * group5.width, y: group5.minY + 0.41362 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.84149 * group5.width, y: group5.minY + 0.01233 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.83126 * group5.width, y: group5.minY + 0.00063 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.83918 * group5.width, y: group5.minY + 0.00637 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.83549 * group5.width, y: group5.minY + 0.00217 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.81895 * group5.width, y: group5.minY + 0.00418 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.82704 * group5.width, y: group5.minY + -0.00091 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.82260 * group5.width, y: group5.minY + 0.00039 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.70955 * group5.width, y: group5.minY + 0.11803 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.70457 * group5.width, y: group5.minY + 0.15439 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.70202 * group5.width, y: group5.minY + 0.12587 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.69979 * group5.width, y: group5.minY + 0.14211 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.71390 * group5.width, y: group5.minY + 0.17841 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.69129 * group5.width, y: group5.minY + 0.19321 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.68440 * group5.width, y: group5.minY + 0.19421 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.68909 * group5.width, y: group5.minY + 0.19465 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.68670 * group5.width, y: group5.minY + 0.19499 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.61454 * group5.width, y: group5.minY + 0.17038 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.49282 * group5.width, y: group5.minY + 0.16807 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.57427 * group5.width, y: group5.minY + 0.15665 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.53331 * group5.width, y: group5.minY + 0.15585 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.42710 * group5.width, y: group5.minY + 0.18791 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.37943 * group5.width, y: group5.minY + 0.22700 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.40910 * group5.width, y: group5.minY + 0.19334 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.39265 * group5.width, y: group5.minY + 0.20701 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.31827 * group5.width, y: group5.minY + 0.21123 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.31465 * group5.width, y: group5.minY + 0.20929 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.31699 * group5.width, y: group5.minY + 0.21089 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.31577 * group5.width, y: group5.minY + 0.21024 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.28680 * group5.width, y: group5.minY + 0.18581 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.29466 * group5.width, y: group5.minY + 0.16560 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.29677 * group5.width, y: group5.minY + 0.14566 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.29697 * group5.width, y: group5.minY + 0.15967 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.29773 * group5.width, y: group5.minY + 0.15250 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.28959 * group5.width, y: group5.minY + 0.12913 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.29582 * group5.width, y: group5.minY + 0.13882 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.29324 * group5.width, y: group5.minY + 0.13288 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.18096 * group5.width, y: group5.minY + 0.01775 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.15851 * group5.width, y: group5.minY + 0.02599 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.17337 * group5.width, y: group5.minY + 0.00998 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.16332 * group5.width, y: group5.minY + 0.01365 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.00251 * group5.width, y: group5.minY + 0.42728 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.00040 * group5.width, y: group5.minY + 0.44721 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.00021 * group5.width, y: group5.minY + 0.43321 * group5.height), controlPoint2: CGPoint(x: group5.minX + -0.00055 * group5.width, y: group5.minY + 0.44037 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.00759 * group5.width, y: group5.minY + 0.46374 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.00135 * group5.width, y: group5.minY + 0.45405 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.00394 * group5.width, y: group5.minY + 0.46000 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.11622 * group5.width, y: group5.minY + 0.57513 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.12489 * group5.width, y: group5.minY + 0.57921 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.11891 * group5.width, y: group5.minY + 0.57789 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.12192 * group5.width, y: group5.minY + 0.57921 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.13867 * group5.width, y: group5.minY + 0.56689 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.13029 * group5.width, y: group5.minY + 0.57921 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.13557 * group5.width, y: group5.minY + 0.57484 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.14607 * group5.width, y: group5.minY + 0.54784 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.19697 * group5.width, y: group5.minY + 0.65685 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.17973 * group5.width, y: group5.minY + 0.69688 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.19222 * group5.width, y: group5.minY + 0.81467 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.16334 * group5.width, y: group5.minY + 0.73493 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.16896 * group5.width, y: group5.minY + 0.78777 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.19314 * group5.width, y: group5.minY + 0.81572 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.22254 * group5.width, y: group5.minY + 0.83139 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.20188 * group5.width, y: group5.minY + 0.82583 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.21206 * group5.width, y: group5.minY + 0.83113 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.24493 * group5.width, y: group5.minY + 0.90196 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.22254 * group5.width, y: group5.minY + 0.85850 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.23033 * group5.width, y: group5.minY + 0.88527 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.27523 * group5.width, y: group5.minY + 0.91763 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.25394 * group5.width, y: group5.minY + 0.91226 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.26444 * group5.width, y: group5.minY + 0.91763 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.28478 * group5.width, y: group5.minY + 0.91623 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.27840 * group5.width, y: group5.minY + 0.91763 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.28159 * group5.width, y: group5.minY + 0.91717 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.29331 * group5.width, y: group5.minY + 0.91228 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.28773 * group5.width, y: group5.minY + 0.91536 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.29054 * group5.width, y: group5.minY + 0.91390 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.31736 * group5.width, y: group5.minY + 0.95729 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.29782 * group5.width, y: group5.minY + 0.93133 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.30616 * group5.width, y: group5.minY + 0.94750 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.34243 * group5.width, y: group5.minY + 0.96759 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.32533 * group5.width, y: group5.minY + 0.96426 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.33393 * group5.width, y: group5.minY + 0.96759 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.36561 * group5.width, y: group5.minY + 0.95879 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.35047 * group5.width, y: group5.minY + 0.96759 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.35839 * group5.width, y: group5.minY + 0.96452 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.38954 * group5.width, y: group5.minY + 0.99401 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.37081 * group5.width, y: group5.minY + 0.97453 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.37913 * group5.width, y: group5.minY + 0.98703 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.40802 * group5.width, y: group5.minY + 1.00000 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.39558 * group5.width, y: group5.minY + 0.99806 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.40184 * group5.width, y: group5.minY + 1.00000 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.44576 * group5.width, y: group5.minY + 0.96965 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.42252 * group5.width, y: group5.minY + 1.00000 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.43645 * group5.width, y: group5.minY + 0.98914 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.52473 * group5.width, y: group5.minY + 0.98926 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.54072 * group5.width, y: group5.minY + 0.99124 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.53008 * group5.width, y: group5.minY + 0.99059 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.53542 * group5.width, y: group5.minY + 0.99124 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.61348 * group5.width, y: group5.minY + 0.94240 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.56797 * group5.width, y: group5.minY + 0.99124 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.59393 * group5.width, y: group5.minY + 0.97380 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.61908 * group5.width, y: group5.minY + 0.94292 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.61535 * group5.width, y: group5.minY + 0.94269 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.61722 * group5.width, y: group5.minY + 0.94292 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.66856 * group5.width, y: group5.minY + 0.89923 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.63848 * group5.width, y: group5.minY + 0.94292 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.65728 * group5.width, y: group5.minY + 0.92734 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.67745 * group5.width, y: group5.minY + 0.85300 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.67457 * group5.width, y: group5.minY + 0.88574 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.67758 * group5.width, y: group5.minY + 0.86946 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.67817 * group5.width, y: group5.minY + 0.85307 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.67769 * group5.width, y: group5.minY + 0.85300 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.67793 * group5.width, y: group5.minY + 0.85307 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.73026 * group5.width, y: group5.minY + 0.80786 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.69851 * group5.width, y: group5.minY + 0.85307 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.71847 * group5.width, y: group5.minY + 0.83695 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.73794 * group5.width, y: group5.minY + 0.76922 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.73501 * group5.width, y: group5.minY + 0.79611 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.73746 * group5.width, y: group5.minY + 0.78284 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.74191 * group5.width, y: group5.minY + 0.76965 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.73927 * group5.width, y: group5.minY + 0.76937 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.74059 * group5.width, y: group5.minY + 0.76965 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.79003 * group5.width, y: group5.minY + 0.72751 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.76065 * group5.width, y: group5.minY + 0.76965 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.77896 * group5.width, y: group5.minY + 0.75477 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.79835 * group5.width, y: group5.minY + 0.65672 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.79857 * group5.width, y: group5.minY + 0.70650 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.80152 * group5.width, y: group5.minY + 0.68136 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.79650 * group5.width, y: group5.minY + 0.64717 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.79792 * group5.width, y: group5.minY + 0.65341 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.79713 * group5.width, y: group5.minY + 0.65035 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.85890 * group5.width, y: group5.minY + 0.55141 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.86056 * group5.width, y: group5.minY + 0.55569 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.87079 * group5.width, y: group5.minY + 0.56739 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.86288 * group5.width, y: group5.minY + 0.56165 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.86656 * group5.width, y: group5.minY + 0.56585 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.87432 * group5.width, y: group5.minY + 0.56801 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.87196 * group5.width, y: group5.minY + 0.56781 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.87314 * group5.width, y: group5.minY + 0.56801 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.88310 * group5.width, y: group5.minY + 0.56384 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.87741 * group5.width, y: group5.minY + 0.56801 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.88046 * group5.width, y: group5.minY + 0.56658 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.99250 * group5.width, y: group5.minY + 0.44999 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.99749 * group5.width, y: group5.minY + 0.41362 * group5.height), controlPoint1: CGPoint(x: group5.minX + 1.00003 * group5.width, y: group5.minY + 0.44215 * group5.height), controlPoint2: CGPoint(x: group5.minX + 1.00226 * group5.width, y: group5.minY + 0.42591 * group5.height))
        clip2Path.close()
        clip2Path.move(to: CGPoint(x: group5.minX + 0.11983 * group5.width, y: group5.minY + 0.51631 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.03872 * group5.width, y: group5.minY + 0.43315 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.17734 * group5.width, y: group5.minY + 0.07656 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.25845 * group5.width, y: group5.minY + 0.15973 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.11983 * group5.width, y: group5.minY + 0.51631 * group5.height))
        clip2Path.close()
        clip2Path.move(to: CGPoint(x: group5.minX + 0.76287 * group5.width, y: group5.minY + 0.69839 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.72899 * group5.width, y: group5.minY + 0.71093 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.75544 * group5.width, y: group5.minY + 0.71665 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.74058 * group5.width, y: group5.minY + 0.72219 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.71466 * group5.width, y: group5.minY + 0.69701 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.71465 * group5.width, y: group5.minY + 0.69699 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.70131 * group5.width, y: group5.minY + 0.68402 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.70128 * group5.width, y: group5.minY + 0.68400 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.59050 * group5.width, y: group5.minY + 0.57633 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.56818 * group5.width, y: group5.minY + 0.58544 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.58279 * group5.width, y: group5.minY + 0.56884 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.57279 * group5.width, y: group5.minY + 0.57292 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.57379 * group5.width, y: group5.minY + 0.62169 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.56357 * group5.width, y: group5.minY + 0.59796 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.56608 * group5.width, y: group5.minY + 0.61420 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.68459 * group5.width, y: group5.minY + 0.72938 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.68459 * group5.width, y: group5.minY + 0.72938 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.68580 * group5.width, y: group5.minY + 0.73055 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.69794 * group5.width, y: group5.minY + 0.74236 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.70529 * group5.width, y: group5.minY + 0.75879 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.70170 * group5.width, y: group5.minY + 0.74601 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.70431 * group5.width, y: group5.minY + 0.75185 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.70307 * group5.width, y: group5.minY + 0.77881 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.70627 * group5.width, y: group5.minY + 0.76575 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.70548 * group5.width, y: group5.minY + 0.77285 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.66433 * group5.width, y: group5.minY + 0.79453 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.69470 * group5.width, y: group5.minY + 0.79945 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.67770 * group5.width, y: group5.minY + 0.80635 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.55607 * group5.width, y: group5.minY + 0.69870 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.53399 * group5.width, y: group5.minY + 0.70926 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.54816 * group5.width, y: group5.minY + 0.69170 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.53829 * group5.width, y: group5.minY + 0.69645 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.54049 * group5.width, y: group5.minY + 0.74511 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.52969 * group5.width, y: group5.minY + 0.72207 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.53260 * group5.width, y: group5.minY + 0.73812 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.61859 * group5.width, y: group5.minY + 0.81424 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.63790 * group5.width, y: group5.minY + 0.83339 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.64476 * group5.width, y: group5.minY + 0.84941 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.64152 * group5.width, y: group5.minY + 0.83697 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.64395 * group5.width, y: group5.minY + 0.84266 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.64209 * group5.width, y: group5.minY + 0.86846 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.64556 * group5.width, y: group5.minY + 0.85617 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.64462 * group5.width, y: group5.minY + 0.86294 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.64143 * group5.width, y: group5.minY + 0.87001 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.64186 * group5.width, y: group5.minY + 0.86897 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.64164 * group5.width, y: group5.minY + 0.86948 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.60693 * group5.width, y: group5.minY + 0.88528 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.63403 * group5.width, y: group5.minY + 0.88883 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.61921 * group5.width, y: group5.minY + 0.89539 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.52311 * group5.width, y: group5.minY + 0.81616 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.50123 * group5.width, y: group5.minY + 0.82776 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.51509 * group5.width, y: group5.minY + 0.80956 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.50530 * group5.width, y: group5.minY + 0.81474 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.50837 * group5.width, y: group5.minY + 0.86329 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.49716 * group5.width, y: group5.minY + 0.84078 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.50035 * group5.width, y: group5.minY + 0.85668 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.57810 * group5.width, y: group5.minY + 0.92079 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.52965 * group5.width, y: group5.minY + 0.93701 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.56386 * group5.width, y: group5.minY + 0.93519 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.54685 * group5.width, y: group5.minY + 0.94126 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.46666 * group5.width, y: group5.minY + 0.92136 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.47113 * group5.width, y: group5.minY + 0.91095 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.46221 * group5.width, y: group5.minY + 0.80600 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.48537 * group5.width, y: group5.minY + 0.87778 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.48145 * group5.width, y: group5.minY + 0.83167 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.44182 * group5.width, y: group5.minY + 0.79035 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.45626 * group5.width, y: group5.minY + 0.79806 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.44922 * group5.width, y: group5.minY + 0.79296 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.42461 * group5.width, y: group5.minY + 0.69940 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.44763 * group5.width, y: group5.minY + 0.75794 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.44149 * group5.width, y: group5.minY + 0.72159 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.39324 * group5.width, y: group5.minY + 0.68055 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.41567 * group5.width, y: group5.minY + 0.68764 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.40458 * group5.width, y: group5.minY + 0.68123 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.39244 * group5.width, y: group5.minY + 0.65948 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.39344 * group5.width, y: group5.minY + 0.67357 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.39330 * group5.width, y: group5.minY + 0.66653 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.36945 * group5.width, y: group5.minY + 0.60441 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.38962 * group5.width, y: group5.minY + 0.63666 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.38145 * group5.width, y: group5.minY + 0.61710 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.29737 * group5.width, y: group5.minY + 0.62712 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.34573 * group5.width, y: group5.minY + 0.57933 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.31358 * group5.width, y: group5.minY + 0.58962 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.28099 * group5.width, y: group5.minY + 0.60133 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.29321 * group5.width, y: group5.minY + 0.61696 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.28776 * group5.width, y: group5.minY + 0.60812 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.21718 * group5.width, y: group5.minY + 0.61265 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.26032 * group5.width, y: group5.minY + 0.58061 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.23403 * group5.width, y: group5.minY + 0.58611 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.16463 * group5.width, y: group5.minY + 0.50011 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.26937 * group5.width, y: group5.minY + 0.23067 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.29965 * group5.width, y: group5.minY + 0.25621 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.31315 * group5.width, y: group5.minY + 0.26343 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.30388 * group5.width, y: group5.minY + 0.25977 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.30842 * group5.width, y: group5.minY + 0.26220 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.35531 * group5.width, y: group5.minY + 0.27430 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.31269 * group5.width, y: group5.minY + 0.36434 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.30389 * group5.width, y: group5.minY + 0.41795 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.30542 * group5.width, y: group5.minY + 0.37971 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.30230 * group5.width, y: group5.minY + 0.39875 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.32111 * group5.width, y: group5.minY + 0.46584 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.30548 * group5.width, y: group5.minY + 0.43715 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.31160 * group5.width, y: group5.minY + 0.45416 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.36849 * group5.width, y: group5.minY + 0.47226 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.33474 * group5.width, y: group5.minY + 0.48262 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.35335 * group5.width, y: group5.minY + 0.48511 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.48753 * group5.width, y: group5.minY + 0.37120 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.49948 * group5.width, y: group5.minY + 0.37211 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.49130 * group5.width, y: group5.minY + 0.36797 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.49589 * group5.width, y: group5.minY + 0.36834 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.75557 * group5.width, y: group5.minY + 0.64167 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.76649 * group5.width, y: group5.minY + 0.66755 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.76123 * group5.width, y: group5.minY + 0.64763 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.76511 * group5.width, y: group5.minY + 0.65682 * group5.height))
        clip2Path.addCurve(to: CGPoint(x: group5.minX + 0.76287 * group5.width, y: group5.minY + 0.69839 * group5.height), controlPoint1: CGPoint(x: group5.minX + 0.76787 * group5.width, y: group5.minY + 0.67828 * group5.height), controlPoint2: CGPoint(x: group5.minX + 0.76659 * group5.width, y: group5.minY + 0.68924 * group5.height))
        clip2Path.close()
        clip2Path.move(to: CGPoint(x: group5.minX + 0.87934 * group5.width, y: group5.minY + 0.50498 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.74072 * group5.width, y: group5.minY + 0.14837 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.82271 * group5.width, y: group5.minY + 0.06304 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.96133 * group5.width, y: group5.minY + 0.41965 * group5.height))
        clip2Path.addLine(to: CGPoint(x: group5.minX + 0.87934 * group5.width, y: group5.minY + 0.50498 * group5.height))
        clip2Path.close()
        clip2Path.addClip()
        
        //// Rectangle 2 Drawing
        let rectangle2Path = UIBezierPath(rect: CGRect(x: group5.minX + fastFloor(group5.width * -0.10800 - 0.24) + 0.74, y: group5.minY + fastFloor(group5.height * -0.27828 - 0.5) + 1, width: fastFloor(group5.width * 1.14987 - 0.24) - fastFloor(group5.width * -0.10800 - 0.24), height: fastFloor(group5.height * 1.27855 - 0.5) - fastFloor(group5.height * -0.27828 - 0.5)))
        color(for: .fill).setFill()
        rectangle2Path.fill()
    }
    
}

extension RKEventIconView {
    
    private func drawOrganizationVisitCanvas(in frame: CGRect) {
        //// Subframes
        let group3: CGRect = CGRect(x: frame.minX + fastFloor(frame.width * 0.15543 - 0.41) + 0.91, y: frame.minY + fastFloor(frame.height * 0.15885 + 0.46) + 0.04, width: fastFloor(frame.width * 0.82051 + 0.32) - fastFloor(frame.width * 0.15543 - 0.41) - 0.73, height: fastFloor(frame.height * 0.84063 - 0.44) - fastFloor(frame.height * 0.15885 + 0.46) + 0.91)
        
        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: group3.minX + 0.51063 * group3.width, y: group3.minY + 0.00000 * group3.height))
        bezier2Path.addCurve(to: CGPoint(x: group3.minX + 0.62864 * group3.width, y: group3.minY + 0.07876 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.56228 * group3.width, y: group3.minY + -0.00003 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.60885 * group3.width, y: group3.minY + 0.03106 * group3.height))
        bezier2Path.addCurve(to: CGPoint(x: group3.minX + 0.60101 * group3.width, y: group3.minY + 0.21790 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.64842 * group3.width, y: group3.minY + 0.12646 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.63752 * group3.width, y: group3.minY + 0.18138 * group3.height))
        bezier2Path.addCurve(to: CGPoint(x: group3.minX + 0.46187 * group3.width, y: group3.minY + 0.24560 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.56450 * group3.width, y: group3.minY + 0.25442 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.50958 * group3.width, y: group3.minY + 0.26536 * group3.height))
        bezier2Path.addCurve(to: CGPoint(x: group3.minX + 0.38304 * group3.width, y: group3.minY + 0.12766 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.41415 * group3.width, y: group3.minY + 0.22585 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.38304 * group3.width, y: group3.minY + 0.17930 * group3.height))
        bezier2Path.addCurve(to: CGPoint(x: group3.minX + 0.42039 * group3.width, y: group3.minY + 0.03740 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.38302 * group3.width, y: group3.minY + 0.09381 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.39646 * group3.width, y: group3.minY + 0.06134 * group3.height))
        bezier2Path.addCurve(to: CGPoint(x: group3.minX + 0.51063 * group3.width, y: group3.minY + 0.00000 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.44432 * group3.width, y: group3.minY + 0.01346 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.47678 * group3.width, y: group3.minY + 0.00001 * group3.height))
        bezier2Path.close()
        bezier2Path.move(to: CGPoint(x: group3.minX + 0.51063 * group3.width, y: group3.minY + 0.74468 * group3.height))
        bezier2Path.addCurve(to: CGPoint(x: group3.minX + 0.62864 * group3.width, y: group3.minY + 0.82344 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.56228 * group3.width, y: group3.minY + 0.74465 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.60885 * group3.width, y: group3.minY + 0.77574 * group3.height))
        bezier2Path.addCurve(to: CGPoint(x: group3.minX + 0.60101 * group3.width, y: group3.minY + 0.96258 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.64842 * group3.width, y: group3.minY + 0.87114 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.63752 * group3.width, y: group3.minY + 0.92606 * group3.height))
        bezier2Path.addCurve(to: CGPoint(x: group3.minX + 0.46187 * group3.width, y: group3.minY + 0.99029 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.56450 * group3.width, y: group3.minY + 0.99911 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.50958 * group3.width, y: group3.minY + 1.01004 * group3.height))
        bezier2Path.addCurve(to: CGPoint(x: group3.minX + 0.38304 * group3.width, y: group3.minY + 0.87234 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.41415 * group3.width, y: group3.minY + 0.97053 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.38304 * group3.width, y: group3.minY + 0.92398 * group3.height))
        bezier2Path.addCurve(to: CGPoint(x: group3.minX + 0.51063 * group3.width, y: group3.minY + 0.74473 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.38304 * group3.width, y: group3.minY + 0.80187 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.44016 * group3.width, y: group3.minY + 0.74474 * group3.height))
        bezier2Path.addLine(to: CGPoint(x: group3.minX + 0.51063 * group3.width, y: group3.minY + 0.74468 * group3.height))
        bezier2Path.close()
        bezier2Path.move(to: CGPoint(x: group3.minX + 1.00000 * group3.width, y: group3.minY + 0.51053 * group3.height))
        bezier2Path.addCurve(to: CGPoint(x: group3.minX + 0.87235 * group3.width, y: group3.minY + 0.63805 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.99996 * group3.width, y: group3.minY + 0.58099 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.94282 * group3.width, y: group3.minY + 0.63808 * group3.height))
        bezier2Path.addCurve(to: CGPoint(x: group3.minX + 0.74480 * group3.width, y: group3.minY + 0.51044 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.80189 * group3.width, y: group3.minY + 0.63802 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.74479 * group3.width, y: group3.minY + 0.58089 * group3.height))
        bezier2Path.addCurve(to: CGPoint(x: group3.minX + 0.87240 * group3.width, y: group3.minY + 0.38288 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.74482 * group3.width, y: group3.minY + 0.43998 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.80194 * group3.width, y: group3.minY + 0.38288 * group3.height))
        bezier2Path.addCurve(to: CGPoint(x: group3.minX + 0.96270 * group3.width, y: group3.minY + 0.42033 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.90628 * group3.width, y: group3.minY + 0.38288 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.93876 * group3.width, y: group3.minY + 0.39636 * group3.height))
        bezier2Path.addCurve(to: CGPoint(x: group3.minX + 1.00000 * group3.width, y: group3.minY + 0.51068 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.98663 * group3.width, y: group3.minY + 0.44430 * group3.height), controlPoint2: CGPoint(x: group3.minX + 1.00005 * group3.width, y: group3.minY + 0.47680 * group3.height))
        bezier2Path.addLine(to: CGPoint(x: group3.minX + 1.00000 * group3.width, y: group3.minY + 0.51053 * group3.height))
        bezier2Path.close()
        bezier2Path.move(to: CGPoint(x: group3.minX + 0.25544 * group3.width, y: group3.minY + 0.51053 * group3.height))
        bezier2Path.addCurve(to: CGPoint(x: group3.minX + 0.17660 * group3.width, y: group3.minY + 0.62856 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.25546 * group3.width, y: group3.minY + 0.56220 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.22434 * group3.width, y: group3.minY + 0.60879 * group3.height))
        bezier2Path.addCurve(to: CGPoint(x: group3.minX + 0.03739 * group3.width, y: group3.minY + 0.60086 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.12886 * group3.width, y: group3.minY + 0.64834 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.07391 * group3.width, y: group3.minY + 0.63740 * group3.height))
        bezier2Path.addCurve(to: CGPoint(x: group3.minX + 0.00976 * group3.width, y: group3.minY + 0.46164 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.00086 * group3.width, y: group3.minY + 0.56431 * group3.height), controlPoint2: CGPoint(x: group3.minX + -0.01005 * group3.width, y: group3.minY + 0.50936 * group3.height))
        bezier2Path.addCurve(to: CGPoint(x: group3.minX + 0.12784 * group3.width, y: group3.minY + 0.38288 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.02956 * group3.width, y: group3.minY + 0.41392 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.07617 * group3.width, y: group3.minY + 0.38283 * group3.height))
        bezier2Path.addCurve(to: CGPoint(x: group3.minX + 0.21814 * group3.width, y: group3.minY + 0.42033 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.16172 * group3.width, y: group3.minY + 0.38288 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.19420 * group3.width, y: group3.minY + 0.39636 * group3.height))
        bezier2Path.addCurve(to: CGPoint(x: group3.minX + 0.25544 * group3.width, y: group3.minY + 0.51068 * group3.height), controlPoint1: CGPoint(x: group3.minX + 0.24207 * group3.width, y: group3.minY + 0.44430 * group3.height), controlPoint2: CGPoint(x: group3.minX + 0.25549 * group3.width, y: group3.minY + 0.47680 * group3.height))
        bezier2Path.addLine(to: CGPoint(x: group3.minX + 0.25544 * group3.width, y: group3.minY + 0.51053 * group3.height))
        bezier2Path.close()
        bezier2Path.usesEvenOddFillRule = true
        color(for: .fill).setFill()
        bezier2Path.fill()
        
        //// Clip Clip
        let clipPath = UIBezierPath(ovalIn: CGRect(x: group3.minX + fastFloor(group3.width * 0.20912 + 0.21) + 0.29, y: group3.minY + fastFloor(group3.height * 0.20930 + 0.08) + 0.42, width: fastFloor(group3.width * 0.79472 + 0.41) - fastFloor(group3.width * 0.20912 + 0.21) - 0.2, height: fastFloor(group3.height * 0.79214 - 0.02) - fastFloor(group3.height * 0.20930 + 0.08) + 0.1))
        clipPath.addClip()
        
        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: CGRect(x: group3.minX + fastFloor(group3.width * 0.01128 + 0.21) + 0.29, y: group3.minY + fastFloor(group3.height * 0.01534 + 0.1) + 0.4, width: fastFloor(group3.width * 0.99256 + 0.41) - fastFloor(group3.width * 0.01128 + 0.21) - 0.2, height: fastFloor(group3.height * 0.98610 - 0.05) - fastFloor(group3.height * 0.01534 + 0.1) + 0.15))
        color(for: .fill).setFill()
        rectanglePath.fill()
        
        //// Oval 2 Drawing
        let oval2Path = UIBezierPath(ovalIn: CGRect(x: group3.minX + fastFloor(group3.width * 0.20912 + 0.21) + 0.29, y: group3.minY + fastFloor(group3.height * 0.20930 + 0.08) + 0.42, width: fastFloor(group3.width * 0.79472 + 0.41) - fastFloor(group3.width * 0.20912 + 0.21) - 0.2, height: fastFloor(group3.height * 0.79214 - 0.02) - fastFloor(group3.height * 0.20930 + 0.08) + 0.1))
        color(for: .backgroud).setStroke()
        oval2Path.lineWidth = 2
        oval2Path.stroke()
        
        //// Clip Clip 2
        let clip2Path = UIBezierPath()
        clip2Path.move(to: CGPoint(x: group3.minX + 0.52734 * group3.width, y: group3.minY + 0.47261 * group3.height))
        clip2Path.addLine(to: CGPoint(x: group3.minX + 0.63863 * group3.width, y: group3.minY + 0.47261 * group3.height))
        clip2Path.addLine(to: CGPoint(x: group3.minX + 0.63863 * group3.width, y: group3.minY + 0.51901 * group3.height))
        clip2Path.addLine(to: CGPoint(x: group3.minX + 0.52734 * group3.width, y: group3.minY + 0.51901 * group3.height))
        clip2Path.addLine(to: CGPoint(x: group3.minX + 0.52734 * group3.width, y: group3.minY + 0.64097 * group3.height))
        clip2Path.addLine(to: CGPoint(x: group3.minX + 0.47636 * group3.width, y: group3.minY + 0.64097 * group3.height))
        clip2Path.addLine(to: CGPoint(x: group3.minX + 0.47636 * group3.width, y: group3.minY + 0.51901 * group3.height))
        clip2Path.addLine(to: CGPoint(x: group3.minX + 0.36508 * group3.width, y: group3.minY + 0.51901 * group3.height))
        clip2Path.addLine(to: CGPoint(x: group3.minX + 0.36508 * group3.width, y: group3.minY + 0.47261 * group3.height))
        clip2Path.addLine(to: CGPoint(x: group3.minX + 0.47636 * group3.width, y: group3.minY + 0.47261 * group3.height))
        clip2Path.addLine(to: CGPoint(x: group3.minX + 0.47636 * group3.width, y: group3.minY + 0.35994 * group3.height))
        clip2Path.addLine(to: CGPoint(x: group3.minX + 0.52734 * group3.width, y: group3.minY + 0.35994 * group3.height))
        clip2Path.addLine(to: CGPoint(x: group3.minX + 0.52734 * group3.width, y: group3.minY + 0.47261 * group3.height))
        clip2Path.close()
        clip2Path.usesEvenOddFillRule = true
        clip2Path.addClip()
        
        //// Rectangle 2 Drawing
        let rectangle2Path = UIBezierPath(rect: CGRect(x: group3.minX + fastFloor(group3.width * 0.12801 + 0.26) + 0.24, y: group3.minY + fastFloor(group3.height * 0.12824 + 0.18) + 0.32, width: fastFloor(group3.width * 0.87583 + 0.36) - fastFloor(group3.width * 0.12801 + 0.26) - 0.1, height: fastFloor(group3.height * 0.87320 - 0.12) - fastFloor(group3.height * 0.12824 + 0.18) + 0.3))
        color(for: .backgroud).setFill()
        rectangle2Path.fill()
    }
    
}

extension RKEventIconView {
    
    private func drawPharmaMeetingCanvas(in frame: CGRect) {
        //// Subframes
        let group3: CGRect = CGRect(x: frame.minX + fastFloor(frame.width * 0.40348 - 0.43) + 0.93, y: frame.minY + fastFloor(frame.height * 0.44152 + 0.16) + 0.34, width: fastFloor(frame.width * 0.56234 - 0.31) - fastFloor(frame.width * 0.40348 - 0.43) - 0.12, height: fastFloor(frame.height * 0.60468 + 0.13) - fastFloor(frame.height * 0.44152 + 0.16) + 0.04)
        
        let context = UIGraphicsGetCurrentContext()!
        //// Group 3
        context.saveGState()
        context.beginTransparencyLayer(auxiliaryInfo: nil)
        
        //// Clip Clip
        let clipPath = UIBezierPath()
        clipPath.move(to: CGPoint(x: group3.minX + 0.64167 * group3.width, y: group3.minY + 1.00000 * group3.height))
        clipPath.addLine(to: CGPoint(x: group3.minX + 0.64167 * group3.width, y: group3.minY + 0.63750 * group3.height))
        clipPath.addLine(to: CGPoint(x: group3.minX + 1.00000 * group3.width, y: group3.minY + 0.63750 * group3.height))
        clipPath.addLine(to: CGPoint(x: group3.minX + 1.00000 * group3.width, y: group3.minY + 0.36250 * group3.height))
        clipPath.addLine(to: CGPoint(x: group3.minX + 0.64167 * group3.width, y: group3.minY + 0.36250 * group3.height))
        clipPath.addLine(to: CGPoint(x: group3.minX + 0.64167 * group3.width, y: group3.minY + 0.00000 * group3.height))
        clipPath.addLine(to: CGPoint(x: group3.minX + 0.35417 * group3.width, y: group3.minY + 0.00000 * group3.height))
        clipPath.addLine(to: CGPoint(x: group3.minX + 0.35417 * group3.width, y: group3.minY + 0.36250 * group3.height))
        clipPath.addLine(to: CGPoint(x: group3.minX + 0.00000 * group3.width, y: group3.minY + 0.36250 * group3.height))
        clipPath.addLine(to: CGPoint(x: group3.minX + 0.00000 * group3.width, y: group3.minY + 0.64583 * group3.height))
        clipPath.addLine(to: CGPoint(x: group3.minX + 0.36250 * group3.width, y: group3.minY + 0.64583 * group3.height))
        clipPath.addLine(to: CGPoint(x: group3.minX + 0.36250 * group3.width, y: group3.minY + 1.00000 * group3.height))
        clipPath.addLine(to: CGPoint(x: group3.minX + 0.64167 * group3.width, y: group3.minY + 1.00000 * group3.height))
        clipPath.close()
        clipPath.addClip()
        
        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: CGRect(x: group3.minX + fastFloor(group3.width * -0.85303 - 0.49) + 0.99, y: group3.minY + fastFloor(group3.height * -0.83232 - 0.48) + 0.98, width: fastFloor(group3.width * 1.85196 - 0.39) - fastFloor(group3.width * -0.85303 - 0.49) - 0.1, height: fastFloor(group3.height * 1.82634 + 0.47) - fastFloor(group3.height * -0.83232 - 0.48) - 0.95))
        color(for: .fill).setFill()
        rectanglePath.fill()
        
        context.endTransparencyLayer()
        context.restoreGState()
        
        //// Bezier 3 Drawing
        let bezier3Path = UIBezierPath()
        bezier3Path.move(to: CGPoint(x: frame.minX + 0.80342 * frame.width, y: frame.minY + 0.26549 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.77555 * frame.width, y: frame.minY + 0.24736 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.79506 * frame.width, y: frame.minY + 0.25786 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.78484 * frame.width, y: frame.minY + 0.25213 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.77276 * frame.width, y: frame.minY + 0.24545 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.77462 * frame.width, y: frame.minY + 0.24641 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.77369 * frame.width, y: frame.minY + 0.24641 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.75325 * frame.width, y: frame.minY + 0.23782 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.76719 * frame.width, y: frame.minY + 0.24164 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.75976 * frame.width, y: frame.minY + 0.23782 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.74396 * frame.width, y: frame.minY + 0.24068 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.74954 * frame.width, y: frame.minY + 0.23782 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.74675 * frame.width, y: frame.minY + 0.23877 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.73281 * frame.width, y: frame.minY + 0.26072 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.73653 * frame.width, y: frame.minY + 0.24641 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.73281 * frame.width, y: frame.minY + 0.25309 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.74489 * frame.width, y: frame.minY + 0.27599 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.73374 * frame.width, y: frame.minY + 0.26644 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.73746 * frame.width, y: frame.minY + 0.27217 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.75232 * frame.width, y: frame.minY + 0.27789 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.74768 * frame.width, y: frame.minY + 0.27694 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.74954 * frame.width, y: frame.minY + 0.27789 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.76254 * frame.width, y: frame.minY + 0.27503 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.75604 * frame.width, y: frame.minY + 0.27789 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.75976 * frame.width, y: frame.minY + 0.27694 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.76998 * frame.width, y: frame.minY + 0.27312 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.76533 * frame.width, y: frame.minY + 0.27408 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.76719 * frame.width, y: frame.minY + 0.27312 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.79041 * frame.width, y: frame.minY + 0.29602 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.77648 * frame.width, y: frame.minY + 0.27312 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.78391 * frame.width, y: frame.minY + 0.28171 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.78112 * frame.width, y: frame.minY + 0.36090 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.79877 * frame.width, y: frame.minY + 0.31606 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.78948 * frame.width, y: frame.minY + 0.33991 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.77555 * frame.width, y: frame.minY + 0.37521 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.77927 * frame.width, y: frame.minY + 0.36567 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.77741 * frame.width, y: frame.minY + 0.37044 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.75325 * frame.width, y: frame.minY + 0.43628 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.76812 * frame.width, y: frame.minY + 0.39525 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.76069 * frame.width, y: frame.minY + 0.41624 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.74303 * frame.width, y: frame.minY + 0.45059 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.74768 * frame.width, y: frame.minY + 0.43914 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.74396 * frame.width, y: frame.minY + 0.44391 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.70866 * frame.width, y: frame.minY + 0.49734 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.73653 * frame.width, y: frame.minY + 0.49353 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.71516 * frame.width, y: frame.minY + 0.49734 * frame.height))
        bezier3Path.addLine(to: CGPoint(x: frame.minX + 0.70773 * frame.width, y: frame.minY + 0.49734 * frame.height))
        bezier3Path.addLine(to: CGPoint(x: frame.minX + 0.70680 * frame.width, y: frame.minY + 0.49734 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.68172 * frame.width, y: frame.minY + 0.47635 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.69658 * frame.width, y: frame.minY + 0.49734 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.68822 * frame.width, y: frame.minY + 0.48971 * frame.height))
        bezier3Path.addLine(to: CGPoint(x: frame.minX + 0.67893 * frame.width, y: frame.minY + 0.47158 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.67243 * frame.width, y: frame.minY + 0.45059 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.67429 * frame.width, y: frame.minY + 0.46109 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.67243 * frame.width, y: frame.minY + 0.45154 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.66407 * frame.width, y: frame.minY + 0.43819 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.67150 * frame.width, y: frame.minY + 0.44487 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.66871 * frame.width, y: frame.minY + 0.44105 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.66221 * frame.width, y: frame.minY + 0.43437 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.66407 * frame.width, y: frame.minY + 0.43723 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.66314 * frame.width, y: frame.minY + 0.43532 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.62598 * frame.width, y: frame.minY + 0.32655 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.65199 * frame.width, y: frame.minY + 0.40479 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.63806 * frame.width, y: frame.minY + 0.36567 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.63898 * frame.width, y: frame.minY + 0.27885 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.62040 * frame.width, y: frame.minY + 0.30843 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.62505 * frame.width, y: frame.minY + 0.29221 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.65013 * frame.width, y: frame.minY + 0.27408 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.64270 * frame.width, y: frame.minY + 0.27599 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.64642 * frame.width, y: frame.minY + 0.27312 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.65478 * frame.width, y: frame.minY + 0.27599 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.65199 * frame.width, y: frame.minY + 0.27408 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.65292 * frame.width, y: frame.minY + 0.27503 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.66407 * frame.width, y: frame.minY + 0.27885 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.65756 * frame.width, y: frame.minY + 0.27694 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.66035 * frame.width, y: frame.minY + 0.27885 * frame.height))
        bezier3Path.addLine(to: CGPoint(x: frame.minX + 0.66500 * frame.width, y: frame.minY + 0.27885 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.68729 * frame.width, y: frame.minY + 0.25881 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.67614 * frame.width, y: frame.minY + 0.27885 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.68729 * frame.width, y: frame.minY + 0.27122 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.68172 * frame.width, y: frame.minY + 0.24450 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.68729 * frame.width, y: frame.minY + 0.25309 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.68544 * frame.width, y: frame.minY + 0.24832 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.66685 * frame.width, y: frame.minY + 0.23973 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.67800 * frame.width, y: frame.minY + 0.24068 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.67336 * frame.width, y: frame.minY + 0.23877 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.65199 * frame.width, y: frame.minY + 0.24355 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.66128 * frame.width, y: frame.minY + 0.23973 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.65664 * frame.width, y: frame.minY + 0.24164 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.64363 * frame.width, y: frame.minY + 0.24641 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.64920 * frame.width, y: frame.minY + 0.24450 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.64642 * frame.width, y: frame.minY + 0.24545 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.60647 * frame.width, y: frame.minY + 0.27694 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.62784 * frame.width, y: frame.minY + 0.25022 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.61483 * frame.width, y: frame.minY + 0.26167 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.60089 * frame.width, y: frame.minY + 0.33705 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.59718 * frame.width, y: frame.minY + 0.29507 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.59439 * frame.width, y: frame.minY + 0.31701 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.63620 * frame.width, y: frame.minY + 0.44773 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.61204 * frame.width, y: frame.minY + 0.37235 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.62412 * frame.width, y: frame.minY + 0.40956 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.63527 * frame.width, y: frame.minY + 0.45822 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.63527 * frame.width, y: frame.minY + 0.45059 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.63434 * frame.width, y: frame.minY + 0.45441 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.64363 * frame.width, y: frame.minY + 0.48780 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.63713 * frame.width, y: frame.minY + 0.46872 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.63991 * frame.width, y: frame.minY + 0.47826 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.67522 * frame.width, y: frame.minY + 0.52787 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.65013 * frame.width, y: frame.minY + 0.50307 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.66035 * frame.width, y: frame.minY + 0.51833 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.68636 * frame.width, y: frame.minY + 0.53360 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.67893 * frame.width, y: frame.minY + 0.52978 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.68265 * frame.width, y: frame.minY + 0.53169 * frame.height))
        bezier3Path.addLine(to: CGPoint(x: frame.minX + 0.69008 * frame.width, y: frame.minY + 0.53360 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.68822 * frame.width, y: frame.minY + 0.55364 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.69008 * frame.width, y: frame.minY + 0.54028 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.68915 * frame.width, y: frame.minY + 0.54696 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.64642 * frame.width, y: frame.minY + 0.65764 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.68544 * frame.width, y: frame.minY + 0.59085 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.66964 * frame.width, y: frame.minY + 0.62710 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.45597 * frame.width, y: frame.minY + 0.73587 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.59997 * frame.width, y: frame.minY + 0.71679 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.52843 * frame.width, y: frame.minY + 0.74637 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.39280 * frame.width, y: frame.minY + 0.71679 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.43367 * frame.width, y: frame.minY + 0.73301 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.41230 * frame.width, y: frame.minY + 0.72633 * frame.height))
        bezier3Path.addLine(to: CGPoint(x: frame.minX + 0.38351 * frame.width, y: frame.minY + 0.71202 * frame.height))
        bezier3Path.addLine(to: CGPoint(x: frame.minX + 0.37793 * frame.width, y: frame.minY + 0.71297 * frame.height))
        bezier3Path.addLine(to: CGPoint(x: frame.minX + 0.36864 * frame.width, y: frame.minY + 0.71488 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.34449 * frame.width, y: frame.minY + 0.72061 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.36028 * frame.width, y: frame.minY + 0.71775 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.35285 * frame.width, y: frame.minY + 0.71965 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.33613 * frame.width, y: frame.minY + 0.72156 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.34170 * frame.width, y: frame.minY + 0.72156 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.33891 * frame.width, y: frame.minY + 0.72156 * frame.height))
        bezier3Path.addLine(to: CGPoint(x: frame.minX + 0.33148 * frame.width, y: frame.minY + 0.72252 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.28689 * frame.width, y: frame.minY + 0.72156 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.31847 * frame.width, y: frame.minY + 0.72442 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.30361 * frame.width, y: frame.minY + 0.72442 * frame.height))
        bezier3Path.addLine(to: CGPoint(x: frame.minX + 0.28503 * frame.width, y: frame.minY + 0.72156 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.27853 * frame.width, y: frame.minY + 0.72061 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.28224 * frame.width, y: frame.minY + 0.72156 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.28038 * frame.width, y: frame.minY + 0.72061 * frame.height))
        bezier3Path.addLine(to: CGPoint(x: frame.minX + 0.30454 * frame.width, y: frame.minY + 0.69389 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.31104 * frame.width, y: frame.minY + 0.68721 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.30733 * frame.width, y: frame.minY + 0.69103 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.30918 * frame.width, y: frame.minY + 0.68912 * frame.height))
        bezier3Path.addLine(to: CGPoint(x: frame.minX + 0.32684 * frame.width, y: frame.minY + 0.66813 * frame.height))
        bezier3Path.addLine(to: CGPoint(x: frame.minX + 0.31290 * frame.width, y: frame.minY + 0.64809 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.27574 * frame.width, y: frame.minY + 0.49448 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.28224 * frame.width, y: frame.minY + 0.60325 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.26831 * frame.width, y: frame.minY + 0.54887 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.32033 * frame.width, y: frame.minY + 0.38857 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.28038 * frame.width, y: frame.minY + 0.45536 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.29618 * frame.width, y: frame.minY + 0.41910 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.46154 * frame.width, y: frame.minY + 0.30938 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.35656 * frame.width, y: frame.minY + 0.34277 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.40580 * frame.width, y: frame.minY + 0.31510 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.49777 * frame.width, y: frame.minY + 0.33323 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.46805 * frame.width, y: frame.minY + 0.32274 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.48198 * frame.width, y: frame.minY + 0.33323 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.53772 * frame.width, y: frame.minY + 0.29221 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.52007 * frame.width, y: frame.minY + 0.33323 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.53772 * frame.width, y: frame.minY + 0.31510 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.49777 * frame.width, y: frame.minY + 0.25118 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.53772 * frame.width, y: frame.minY + 0.26931 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.52007 * frame.width, y: frame.minY + 0.25118 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.46061 * frame.width, y: frame.minY + 0.27599 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.48105 * frame.width, y: frame.minY + 0.25118 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.46712 * frame.width, y: frame.minY + 0.26167 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.29339 * frame.width, y: frame.minY + 0.36854 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.39465 * frame.width, y: frame.minY + 0.28171 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.33520 * frame.width, y: frame.minY + 0.31415 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.24229 * frame.width, y: frame.minY + 0.49162 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.26552 * frame.width, y: frame.minY + 0.40384 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.24787 * frame.width, y: frame.minY + 0.44677 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.28410 * frame.width, y: frame.minY + 0.66813 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.23393 * frame.width, y: frame.minY + 0.55364 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.24880 * frame.width, y: frame.minY + 0.61661 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.28131 * frame.width, y: frame.minY + 0.67099 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.28317 * frame.width, y: frame.minY + 0.66908 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.28224 * frame.width, y: frame.minY + 0.67004 * frame.height))
        bezier3Path.addLine(to: CGPoint(x: frame.minX + 0.25158 * frame.width, y: frame.minY + 0.70057 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.24322 * frame.width, y: frame.minY + 0.73110 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.24322 * frame.width, y: frame.minY + 0.70916 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.24044 * frame.width, y: frame.minY + 0.72061 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.28131 * frame.width, y: frame.minY + 0.75591 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.24787 * frame.width, y: frame.minY + 0.74446 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.25995 * frame.width, y: frame.minY + 0.75305 * frame.height))
        bezier3Path.addLine(to: CGPoint(x: frame.minX + 0.28317 * frame.width, y: frame.minY + 0.75591 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.33613 * frame.width, y: frame.minY + 0.75686 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.30268 * frame.width, y: frame.minY + 0.75877 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.32033 * frame.width, y: frame.minY + 0.75877 * frame.height))
        bezier3Path.addLine(to: CGPoint(x: frame.minX + 0.33984 * frame.width, y: frame.minY + 0.75591 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.35006 * frame.width, y: frame.minY + 0.75496 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.34263 * frame.width, y: frame.minY + 0.75591 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.34634 * frame.width, y: frame.minY + 0.75496 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.37700 * frame.width, y: frame.minY + 0.74828 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.35935 * frame.width, y: frame.minY + 0.75305 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.36771 * frame.width, y: frame.minY + 0.75114 * frame.height))
        bezier3Path.addLine(to: CGPoint(x: frame.minX + 0.37700 * frame.width, y: frame.minY + 0.74828 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.44947 * frame.width, y: frame.minY + 0.77022 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.39930 * frame.width, y: frame.minY + 0.75973 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.42438 * frame.width, y: frame.minY + 0.76736 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.48384 * frame.width, y: frame.minY + 0.77213 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.46154 * frame.width, y: frame.minY + 0.77213 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.47269 * frame.width, y: frame.minY + 0.77213 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.67243 * frame.width, y: frame.minY + 0.67863 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.55630 * frame.width, y: frame.minY + 0.77213 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.62505 * frame.width, y: frame.minY + 0.73874 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.72352 * frame.width, y: frame.minY + 0.55554 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.70030 * frame.width, y: frame.minY + 0.64332 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.71795 * frame.width, y: frame.minY + 0.60039 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.72538 * frame.width, y: frame.minY + 0.53074 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.72445 * frame.width, y: frame.minY + 0.54696 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.72538 * frame.width, y: frame.minY + 0.53932 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.75883 * frame.width, y: frame.minY + 0.50688 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.73839 * frame.width, y: frame.minY + 0.52787 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.75140 * frame.width, y: frame.minY + 0.51738 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.77927 * frame.width, y: frame.minY + 0.45536 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.76998 * frame.width, y: frame.minY + 0.49257 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.77555 * frame.width, y: frame.minY + 0.47349 * frame.height))
        bezier3Path.addLine(to: CGPoint(x: frame.minX + 0.77927 * frame.width, y: frame.minY + 0.44773 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.78298 * frame.width, y: frame.minY + 0.43532 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.78019 * frame.width, y: frame.minY + 0.44391 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.78205 * frame.width, y: frame.minY + 0.44010 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.79785 * frame.width, y: frame.minY + 0.39143 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.78763 * frame.width, y: frame.minY + 0.42101 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.79320 * frame.width, y: frame.minY + 0.40575 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.81550 * frame.width, y: frame.minY + 0.33896 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.80342 * frame.width, y: frame.minY + 0.37426 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.80992 * frame.width, y: frame.minY + 0.35709 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.82014 * frame.width, y: frame.minY + 0.31224 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.81828 * frame.width, y: frame.minY + 0.33132 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.82014 * frame.width, y: frame.minY + 0.32178 * frame.height))
        bezier3Path.addCurve(to: CGPoint(x: frame.minX + 0.80342 * frame.width, y: frame.minY + 0.26549 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.82107 * frame.width, y: frame.minY + 0.29316 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.81457 * frame.width, y: frame.minY + 0.27599 * frame.height))
        bezier3Path.close()
        color(for: .fill).setFill()
        bezier3Path.fill()
    }
    
}
