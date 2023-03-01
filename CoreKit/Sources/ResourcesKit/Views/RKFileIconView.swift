/**
 
 Иконки файлов
 
 */

import UIKit

public enum RKFileIconStyle: String {
    case text
    case pdf
    case ppt
    case doc
    case folder
    case xls
    case emptiness
}

public class RKFileIconView: UIView {
    
    public var style: RKFileIconStyle = .emptiness {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clear
    }
    
    public init(style: RKFileIconStyle) {
        self.style = style
        super.init(frame: .zero)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func draw(_ rect: CGRect) {
        switch style {
        case .text: drawTextCanvas(in: rect)
        case .pdf: drawPdfCanvas(in: rect)
        case .ppt: drawPptCanvas(in: rect)
        case .doc: drawDocCanvas(in: rect)
        case .folder: drawFolderCanvas(in: rect)
        case .xls: drawXlsCanvas(in: rect)
        case .emptiness: break
        }
    }
    
    func fastFloor(_ x: CGFloat) -> CGFloat {
        return floor(x)
    }
    
}

extension RKFileIconView {
    
    private func drawTextCanvas(in frame: CGRect) {
        //// Color Declarations
        let fillColor2 = UIColor(red: 0.129, green: 0.145, blue: 0.184, alpha: 1.000)
        let fillColor3 = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
        //// Subframes
        let text: CGRect = CGRect(x: frame.minX + fastFloor(frame.width * 0.00000 + 0.5), y: frame.minY + fastFloor(frame.height * 0.00000 + 0.5), width: fastFloor(frame.width * 1.00000 + 0.5) - fastFloor(frame.width * 0.00000 + 0.5), height: fastFloor(frame.height * 1.00000 + 0.5) - fastFloor(frame.height * 0.00000 + 0.5))
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: text.minX + 0.50000 * text.width, y: text.minY + 1.00000 * text.height))
        bezierPath.addCurve(to: CGPoint(x: text.minX + 1.00000 * text.width, y: text.minY + 0.50000 * text.height), controlPoint1: CGPoint(x: text.minX + 0.77614 * text.width, y: text.minY + 1.00000 * text.height), controlPoint2: CGPoint(x: text.minX + 1.00000 * text.width, y: text.minY + 0.77614 * text.height))
        bezierPath.addCurve(to: CGPoint(x: text.minX + 0.50000 * text.width, y: text.minY + 0.00000 * text.height), controlPoint1: CGPoint(x: text.minX + 1.00000 * text.width, y: text.minY + 0.22386 * text.height), controlPoint2: CGPoint(x: text.minX + 0.77614 * text.width, y: text.minY + 0.00000 * text.height))
        bezierPath.addCurve(to: CGPoint(x: text.minX + 0.00000 * text.width, y: text.minY + 0.50000 * text.height), controlPoint1: CGPoint(x: text.minX + 0.22386 * text.width, y: text.minY + 0.00000 * text.height), controlPoint2: CGPoint(x: text.minX + 0.00000 * text.width, y: text.minY + 0.22386 * text.height))
        bezierPath.addCurve(to: CGPoint(x: text.minX + 0.50000 * text.width, y: text.minY + 1.00000 * text.height), controlPoint1: CGPoint(x: text.minX + 0.00000 * text.width, y: text.minY + 0.77614 * text.height), controlPoint2: CGPoint(x: text.minX + 0.22386 * text.width, y: text.minY + 1.00000 * text.height))
        bezierPath.close()
        bezierPath.usesEvenOddFillRule = true
        fillColor2.setFill()
        bezierPath.fill()
        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: text.minX + 0.67500 * text.width, y: text.minY + 0.27500 * text.height))
        bezier2Path.addLine(to: CGPoint(x: text.minX + 0.32500 * text.width, y: text.minY + 0.27500 * text.height))
        bezier2Path.addCurve(to: CGPoint(x: text.minX + 0.27500 * text.width, y: text.minY + 0.32500 * text.height), controlPoint1: CGPoint(x: text.minX + 0.29740 * text.width, y: text.minY + 0.27500 * text.height), controlPoint2: CGPoint(x: text.minX + 0.27500 * text.width, y: text.minY + 0.29738 * text.height))
        bezier2Path.addLine(to: CGPoint(x: text.minX + 0.27500 * text.width, y: text.minY + 0.67500 * text.height))
        bezier2Path.addCurve(to: CGPoint(x: text.minX + 0.32500 * text.width, y: text.minY + 0.72500 * text.height), controlPoint1: CGPoint(x: text.minX + 0.27500 * text.width, y: text.minY + 0.70260 * text.height), controlPoint2: CGPoint(x: text.minX + 0.29740 * text.width, y: text.minY + 0.72500 * text.height))
        bezier2Path.addLine(to: CGPoint(x: text.minX + 0.67500 * text.width, y: text.minY + 0.72500 * text.height))
        bezier2Path.addCurve(to: CGPoint(x: text.minX + 0.72500 * text.width, y: text.minY + 0.67500 * text.height), controlPoint1: CGPoint(x: text.minX + 0.70260 * text.width, y: text.minY + 0.72500 * text.height), controlPoint2: CGPoint(x: text.minX + 0.72500 * text.width, y: text.minY + 0.70260 * text.height))
        bezier2Path.addLine(to: CGPoint(x: text.minX + 0.72500 * text.width, y: text.minY + 0.32500 * text.height))
        bezier2Path.addCurve(to: CGPoint(x: text.minX + 0.67500 * text.width, y: text.minY + 0.27500 * text.height), controlPoint1: CGPoint(x: text.minX + 0.72500 * text.width, y: text.minY + 0.29738 * text.height), controlPoint2: CGPoint(x: text.minX + 0.70260 * text.width, y: text.minY + 0.27500 * text.height))
        bezier2Path.addLine(to: CGPoint(x: text.minX + 0.67500 * text.width, y: text.minY + 0.27500 * text.height))
        bezier2Path.close()
        bezier2Path.move(to: CGPoint(x: text.minX + 0.37500 * text.width, y: text.minY + 0.37500 * text.height))
        bezier2Path.addLine(to: CGPoint(x: text.minX + 0.62525 * text.width, y: text.minY + 0.37500 * text.height))
        bezier2Path.addLine(to: CGPoint(x: text.minX + 0.62525 * text.width, y: text.minY + 0.42500 * text.height))
        bezier2Path.addLine(to: CGPoint(x: text.minX + 0.37500 * text.width, y: text.minY + 0.42500 * text.height))
        bezier2Path.addLine(to: CGPoint(x: text.minX + 0.37500 * text.width, y: text.minY + 0.37500 * text.height))
        bezier2Path.close()
        bezier2Path.move(to: CGPoint(x: text.minX + 0.37500 * text.width, y: text.minY + 0.47500 * text.height))
        bezier2Path.addLine(to: CGPoint(x: text.minX + 0.62525 * text.width, y: text.minY + 0.47500 * text.height))
        bezier2Path.addLine(to: CGPoint(x: text.minX + 0.62525 * text.width, y: text.minY + 0.52500 * text.height))
        bezier2Path.addLine(to: CGPoint(x: text.minX + 0.37500 * text.width, y: text.minY + 0.52500 * text.height))
        bezier2Path.addLine(to: CGPoint(x: text.minX + 0.37500 * text.width, y: text.minY + 0.47500 * text.height))
        bezier2Path.close()
        bezier2Path.move(to: CGPoint(x: text.minX + 0.37500 * text.width, y: text.minY + 0.57500 * text.height))
        bezier2Path.addLine(to: CGPoint(x: text.minX + 0.55025 * text.width, y: text.minY + 0.57500 * text.height))
        bezier2Path.addLine(to: CGPoint(x: text.minX + 0.55025 * text.width, y: text.minY + 0.62500 * text.height))
        bezier2Path.addLine(to: CGPoint(x: text.minX + 0.37500 * text.width, y: text.minY + 0.62500 * text.height))
        bezier2Path.addLine(to: CGPoint(x: text.minX + 0.37500 * text.width, y: text.minY + 0.57500 * text.height))
        bezier2Path.close()
        bezier2Path.usesEvenOddFillRule = true
        fillColor3.setFill()
        bezier2Path.fill()
    }
    
}

extension RKFileIconView {
    
    private func drawFolderCanvas(in frame: CGRect) {
        //// Color Declarations
        let fillColor2 = UIColor(red: 0.129, green: 0.145, blue: 0.184, alpha: 1.000)
        let fillColor3 = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
        //// Subframes
        let folder: CGRect = CGRect(x: frame.minX + fastFloor(frame.width * 0.00000 + 0.5), y: frame.minY + fastFloor(frame.height * 0.00000 + 0.5), width: fastFloor(frame.width * 1.00000 + 0.5) - fastFloor(frame.width * 0.00000 + 0.5), height: fastFloor(frame.height * 1.00000 + 0.5) - fastFloor(frame.height * 0.00000 + 0.5))
        //// Bezier 3 Drawing
        let bezier3Path = UIBezierPath()
        bezier3Path.move(to: CGPoint(x: folder.minX + 0.50000 * folder.width, y: folder.minY + 1.00000 * folder.height))
        bezier3Path.addCurve(to: CGPoint(x: folder.minX + 1.00000 * folder.width, y: folder.minY + 0.50000 * folder.height), controlPoint1: CGPoint(x: folder.minX + 0.77614 * folder.width, y: folder.minY + 1.00000 * folder.height), controlPoint2: CGPoint(x: folder.minX + 1.00000 * folder.width, y: folder.minY + 0.77614 * folder.height))
        bezier3Path.addCurve(to: CGPoint(x: folder.minX + 0.99068 * folder.width, y: folder.minY + 0.40343 * folder.height), controlPoint1: CGPoint(x: folder.minX + 1.00000 * folder.width, y: folder.minY + 0.46696 * folder.height), controlPoint2: CGPoint(x: folder.minX + 0.99680 * folder.width, y: folder.minY + 0.43468 * folder.height))
        bezier3Path.addCurve(to: CGPoint(x: folder.minX + 0.50000 * folder.width, y: folder.minY + 0.00000 * folder.height), controlPoint1: CGPoint(x: folder.minX + 0.94569 * folder.width, y: folder.minY + 0.17350 * folder.height), controlPoint2: CGPoint(x: folder.minX + 0.74311 * folder.width, y: folder.minY + 0.00000 * folder.height))
        bezier3Path.addCurve(to: CGPoint(x: folder.minX + 0.00000 * folder.width, y: folder.minY + 0.50000 * folder.height), controlPoint1: CGPoint(x: folder.minX + 0.22386 * folder.width, y: folder.minY + 0.00000 * folder.height), controlPoint2: CGPoint(x: folder.minX + 0.00000 * folder.width, y: folder.minY + 0.22386 * folder.height))
        bezier3Path.addCurve(to: CGPoint(x: folder.minX + 0.50000 * folder.width, y: folder.minY + 1.00000 * folder.height), controlPoint1: CGPoint(x: folder.minX + 0.00000 * folder.width, y: folder.minY + 0.77614 * folder.height), controlPoint2: CGPoint(x: folder.minX + 0.22386 * folder.width, y: folder.minY + 1.00000 * folder.height))
        bezier3Path.close()
        bezier3Path.usesEvenOddFillRule = true
        fillColor2.setFill()
        bezier3Path.fill()
        //// Bezier 4 Drawing
        let bezier4Path = UIBezierPath()
        bezier4Path.move(to: CGPoint(x: folder.minX + 0.30000 * folder.width, y: folder.minY + 0.32500 * folder.height))
        bezier4Path.addCurve(to: CGPoint(x: folder.minX + 0.25025 * folder.width, y: folder.minY + 0.37500 * folder.height), controlPoint1: CGPoint(x: folder.minX + 0.27237 * folder.width, y: folder.minY + 0.32500 * folder.height), controlPoint2: CGPoint(x: folder.minX + 0.25025 * folder.width, y: folder.minY + 0.34740 * folder.height))
        bezier4Path.addLine(to: CGPoint(x: folder.minX + 0.25000 * folder.width, y: folder.minY + 0.67500 * folder.height))
        bezier4Path.addCurve(to: CGPoint(x: folder.minX + 0.30000 * folder.width, y: folder.minY + 0.72500 * folder.height), controlPoint1: CGPoint(x: folder.minX + 0.25000 * folder.width, y: folder.minY + 0.70263 * folder.height), controlPoint2: CGPoint(x: folder.minX + 0.27237 * folder.width, y: folder.minY + 0.72500 * folder.height))
        bezier4Path.addLine(to: CGPoint(x: folder.minX + 0.70000 * folder.width, y: folder.minY + 0.72500 * folder.height))
        bezier4Path.addCurve(to: CGPoint(x: folder.minX + 0.75000 * folder.width, y: folder.minY + 0.67500 * folder.height), controlPoint1: CGPoint(x: folder.minX + 0.72760 * folder.width, y: folder.minY + 0.72500 * folder.height), controlPoint2: CGPoint(x: folder.minX + 0.75000 * folder.width, y: folder.minY + 0.70263 * folder.height))
        bezier4Path.addLine(to: CGPoint(x: folder.minX + 0.75000 * folder.width, y: folder.minY + 0.42500 * folder.height))
        bezier4Path.addCurve(to: CGPoint(x: folder.minX + 0.70000 * folder.width, y: folder.minY + 0.37500 * folder.height), controlPoint1: CGPoint(x: folder.minX + 0.75000 * folder.width, y: folder.minY + 0.39737 * folder.height), controlPoint2: CGPoint(x: folder.minX + 0.72760 * folder.width, y: folder.minY + 0.37500 * folder.height))
        bezier4Path.addLine(to: CGPoint(x: folder.minX + 0.50000 * folder.width, y: folder.minY + 0.37500 * folder.height))
        bezier4Path.addLine(to: CGPoint(x: folder.minX + 0.45000 * folder.width, y: folder.minY + 0.32500 * folder.height))
        bezier4Path.addLine(to: CGPoint(x: folder.minX + 0.30000 * folder.width, y: folder.minY + 0.32500 * folder.height))
        bezier4Path.close()
        bezier4Path.usesEvenOddFillRule = true
        fillColor3.setFill()
        bezier4Path.fill()
    }
    
}

extension RKFileIconView {
    
    private func drawPdfCanvas(in frame: CGRect) {
        //// Color Declarations
        let fillColor = UIColor(red: 1.000, green: 0.757, blue: 0.027, alpha: 1.000)
        
        
        //// Subframes
        let group2: CGRect = CGRect(x: frame.minX + fastFloor(frame.width * 0.00000 + 0.5), y: frame.minY + fastFloor(frame.height * 0.00000 + 0.5), width: fastFloor(frame.width * 1.00000 + 0.5) - fastFloor(frame.width * 0.00000 + 0.5), height: fastFloor(frame.height * 1.00000 - 0.5) - fastFloor(frame.height * 0.00000 + 0.5) + 1)
        
        
        //// Group 2
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: group2.minX + 0.48206 * group2.width, y: group2.minY + 0.29333 * group2.height))
        bezierPath.addLine(to: CGPoint(x: group2.minX + 0.48081 * group2.width, y: group2.minY + 0.29333 * group2.height))
        bezierPath.addCurve(to: CGPoint(x: group2.minX + 0.47581 * group2.width, y: group2.minY + 0.29778 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.47831 * group2.width, y: group2.minY + 0.29333 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.47706 * group2.width, y: group2.minY + 0.29444 * group2.height))
        bezierPath.addCurve(to: CGPoint(x: group2.minX + 0.48206 * group2.width, y: group2.minY + 0.34889 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.47081 * group2.width, y: group2.minY + 0.30778 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.47456 * group2.width, y: group2.minY + 0.32778 * group2.height))
        bezierPath.addCurve(to: CGPoint(x: group2.minX + 0.48206 * group2.width, y: group2.minY + 0.29333 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.48831 * group2.width, y: group2.minY + 0.31222 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.48456 * group2.width, y: group2.minY + 0.29667 * group2.height))
        bezierPath.close()
        fillColor.setFill()
        bezierPath.fill()
        
        
        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: group2.minX + 0.33111 * group2.width, y: group2.minY + 0.67556 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.33889 * group2.width, y: group2.minY + 0.68778 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.33111 * group2.width, y: group2.minY + 0.67667 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.33000 * group2.width, y: group2.minY + 0.68111 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.38444 * group2.width, y: group2.minY + 0.62889 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.34111 * group2.width, y: group2.minY + 0.68667 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.35667 * group2.width, y: group2.minY + 0.68000 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.33111 * group2.width, y: group2.minY + 0.67556 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.34667 * group2.width, y: group2.minY + 0.64889 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.33222 * group2.width, y: group2.minY + 0.66556 * group2.height))
        bezier2Path.close()
        fillColor.setFill()
        bezier2Path.fill()
        
        
        //// Bezier 3 Drawing
        let bezier3Path = UIBezierPath()
        bezier3Path.move(to: CGPoint(x: group2.minX + 0.44333 * group2.width, y: group2.minY + 0.56889 * group2.height))
        bezier3Path.addCurve(to: CGPoint(x: group2.minX + 0.55444 * group2.width, y: group2.minY + 0.53444 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.47889 * group2.width, y: group2.minY + 0.55444 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.51889 * group2.width, y: group2.minY + 0.54333 * group2.height))
        bezier3Path.addCurve(to: CGPoint(x: group2.minX + 0.48889 * group2.width, y: group2.minY + 0.43889 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.53111 * group2.width, y: group2.minY + 0.50778 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.50778 * group2.width, y: group2.minY + 0.47333 * group2.height))
        bezier3Path.addCurve(to: CGPoint(x: group2.minX + 0.44333 * group2.width, y: group2.minY + 0.56889 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.47667 * group2.width, y: group2.minY + 0.48111 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.46111 * group2.width, y: group2.minY + 0.52778 * group2.height))
        bezier3Path.close()
        fillColor.setFill()
        bezier3Path.fill()
        
        
        //// Bezier 4 Drawing
        let bezier4Path = UIBezierPath()
        bezier4Path.move(to: CGPoint(x: group2.minX + 0.50000 * group2.width, y: group2.minY + 0.00000 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.00000 * group2.width, y: group2.minY + 0.50000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.22444 * group2.width, y: group2.minY + 0.00000 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.00000 * group2.width, y: group2.minY + 0.22444 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.50000 * group2.width, y: group2.minY + 1.00000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.00000 * group2.width, y: group2.minY + 0.77556 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.22333 * group2.width, y: group2.minY + 1.00000 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 1.00000 * group2.width, y: group2.minY + 0.50000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.77667 * group2.width, y: group2.minY + 1.00000 * group2.height), controlPoint2: CGPoint(x: group2.minX + 1.00000 * group2.width, y: group2.minY + 0.77667 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.50000 * group2.width, y: group2.minY + 0.00000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 1.00000 * group2.width, y: group2.minY + 0.22333 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.77556 * group2.width, y: group2.minY + 0.00000 * group2.height))
        bezier4Path.close()
        bezier4Path.move(to: CGPoint(x: group2.minX + 0.68889 * group2.width, y: group2.minY + 0.57778 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.65111 * group2.width, y: group2.minY + 0.59778 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.67889 * group2.width, y: group2.minY + 0.59111 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.66667 * group2.width, y: group2.minY + 0.59778 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.57889 * group2.width, y: group2.minY + 0.55889 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.63000 * group2.width, y: group2.minY + 0.59778 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.60556 * group2.width, y: group2.minY + 0.58444 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.42667 * group2.width, y: group2.minY + 0.60778 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.53000 * group2.width, y: group2.minY + 0.56889 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.47333 * group2.width, y: group2.minY + 0.58778 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.38556 * group2.width, y: group2.minY + 0.68111 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.41222 * group2.width, y: group2.minY + 0.63778 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.39889 * group2.width, y: group2.minY + 0.66333 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.33778 * group2.width, y: group2.minY + 0.71778 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.36778 * group2.width, y: group2.minY + 0.70556 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.35222 * group2.width, y: group2.minY + 0.71778 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.32111 * group2.width, y: group2.minY + 0.71222 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.33222 * group2.width, y: group2.minY + 0.71778 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.32556 * group2.width, y: group2.minY + 0.71556 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.30222 * group2.width, y: group2.minY + 0.67333 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.30333 * group2.width, y: group2.minY + 0.69889 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.30111 * group2.width, y: group2.minY + 0.68333 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.40556 * group2.width, y: group2.minY + 0.58667 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.30556 * group2.width, y: group2.minY + 0.64556 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.34000 * group2.width, y: group2.minY + 0.61556 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.47111 * group2.width, y: group2.minY + 0.40222 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.43111 * group2.width, y: group2.minY + 0.53000 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.45556 * group2.width, y: group2.minY + 0.46000 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.45000 * group2.width, y: group2.minY + 0.28778 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.45444 * group2.width, y: group2.minY + 0.36444 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.43778 * group2.width, y: group2.minY + 0.31667 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.47111 * group2.width, y: group2.minY + 0.26778 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.45444 * group2.width, y: group2.minY + 0.27778 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.46222 * group2.width, y: group2.minY + 0.27111 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.48222 * group2.width, y: group2.minY + 0.26556 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.47556 * group2.width, y: group2.minY + 0.26667 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.47889 * group2.width, y: group2.minY + 0.26556 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.50444 * group2.width, y: group2.minY + 0.27667 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.49111 * group2.width, y: group2.minY + 0.26556 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.49889 * group2.width, y: group2.minY + 0.26889 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.50222 * group2.width, y: group2.minY + 0.39889 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.51000 * group2.width, y: group2.minY + 0.28333 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.52444 * group2.width, y: group2.minY + 0.30222 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.59000 * group2.width, y: group2.minY + 0.52889 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.52556 * group2.width, y: group2.minY + 0.44667 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.55778 * group2.width, y: group2.minY + 0.49556 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.64778 * group2.width, y: group2.minY + 0.52222 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.61222 * group2.width, y: group2.minY + 0.52444 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.63222 * group2.width, y: group2.minY + 0.52222 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.69778 * group2.width, y: group2.minY + 0.54111 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.67444 * group2.width, y: group2.minY + 0.52222 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.69111 * group2.width, y: group2.minY + 0.52889 * group2.height))
        bezier4Path.addCurve(to: CGPoint(x: group2.minX + 0.68889 * group2.width, y: group2.minY + 0.57778 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.70111 * group2.width, y: group2.minY + 0.55111 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.69889 * group2.width, y: group2.minY + 0.56333 * group2.height))
        bezier4Path.close()
        fillColor.setFill()
        bezier4Path.fill()
        
        
        //// Bezier 5 Drawing
        let bezier5Path = UIBezierPath()
        bezier5Path.move(to: CGPoint(x: group2.minX + 0.61556 * group2.width, y: group2.minY + 0.55222 * group2.height))
        bezier5Path.addCurve(to: CGPoint(x: group2.minX + 0.65111 * group2.width, y: group2.minY + 0.56889 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.63000 * group2.width, y: group2.minY + 0.56333 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.64222 * group2.width, y: group2.minY + 0.56889 * group2.height))
        bezier5Path.addCurve(to: CGPoint(x: group2.minX + 0.66556 * group2.width, y: group2.minY + 0.56000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.65556 * group2.width, y: group2.minY + 0.56889 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.66000 * group2.width, y: group2.minY + 0.56778 * group2.height))
        bezier5Path.addCurve(to: CGPoint(x: group2.minX + 0.67000 * group2.width, y: group2.minY + 0.55333 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.66778 * group2.width, y: group2.minY + 0.55667 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.66889 * group2.width, y: group2.minY + 0.55444 * group2.height))
        bezier5Path.addCurve(to: CGPoint(x: group2.minX + 0.64667 * group2.width, y: group2.minY + 0.55000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.66778 * group2.width, y: group2.minY + 0.55222 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.66222 * group2.width, y: group2.minY + 0.55000 * group2.height))
        bezier5Path.addCurve(to: CGPoint(x: group2.minX + 0.61556 * group2.width, y: group2.minY + 0.55222 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.63667 * group2.width, y: group2.minY + 0.55000 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.62667 * group2.width, y: group2.minY + 0.55111 * group2.height))
        bezier5Path.close()
        fillColor.setFill()
        bezier5Path.fill()
    }
    
}

extension RKFileIconView {
    
    private func drawPptCanvas(in frame: CGRect) {
        //// Color Declarations
        let fillColor2 = UIColor(red: 0.957, green: 0.263, blue: 0.212, alpha: 1.000)
        let fillColor3 = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
        //// Subframes
        let group2: CGRect = CGRect(x: frame.minX + fastFloor(frame.width * 0.00000 + 0.5), y: frame.minY + fastFloor(frame.height * 0.00000 + 0.5), width: fastFloor(frame.width * 1.00000 + 0.5) - fastFloor(frame.width * 0.00000 + 0.5), height: fastFloor(frame.height * 1.00000 + 0.5) - fastFloor(frame.height * 0.00000 + 0.5))
        //// Group 2
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: group2.minX + 0.50000 * group2.width, y: group2.minY + 1.00000 * group2.height))
        bezierPath.addCurve(to: CGPoint(x: group2.minX + 1.00000 * group2.width, y: group2.minY + 0.50000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.77614 * group2.width, y: group2.minY + 1.00000 * group2.height), controlPoint2: CGPoint(x: group2.minX + 1.00000 * group2.width, y: group2.minY + 0.77614 * group2.height))
        bezierPath.addCurve(to: CGPoint(x: group2.minX + 0.50000 * group2.width, y: group2.minY + 0.00000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 1.00000 * group2.width, y: group2.minY + 0.22386 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.77614 * group2.width, y: group2.minY + 0.00000 * group2.height))
        bezierPath.addCurve(to: CGPoint(x: group2.minX + 0.00000 * group2.width, y: group2.minY + 0.50000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.22386 * group2.width, y: group2.minY + 0.00000 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.00000 * group2.width, y: group2.minY + 0.22386 * group2.height))
        bezierPath.addCurve(to: CGPoint(x: group2.minX + 0.50000 * group2.width, y: group2.minY + 1.00000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.00000 * group2.width, y: group2.minY + 0.77614 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.22386 * group2.width, y: group2.minY + 1.00000 * group2.height))
        bezierPath.close()
        bezierPath.usesEvenOddFillRule = true
        fillColor2.setFill()
        bezierPath.fill()
        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: group2.minX + 0.67475 * group2.width, y: group2.minY + 0.27500 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.32475 * group2.width, y: group2.minY + 0.27500 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.27500 * group2.width, y: group2.minY + 0.32500 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.29715 * group2.width, y: group2.minY + 0.27500 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.27500 * group2.width, y: group2.minY + 0.29740 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.27500 * group2.width, y: group2.minY + 0.67500 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.32475 * group2.width, y: group2.minY + 0.72500 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.27500 * group2.width, y: group2.minY + 0.70260 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.29715 * group2.width, y: group2.minY + 0.72500 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.67475 * group2.width, y: group2.minY + 0.72500 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.72475 * group2.width, y: group2.minY + 0.67500 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.70235 * group2.width, y: group2.minY + 0.72500 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.72475 * group2.width, y: group2.minY + 0.70260 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.72475 * group2.width, y: group2.minY + 0.32500 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.67475 * group2.width, y: group2.minY + 0.27500 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.72475 * group2.width, y: group2.minY + 0.29740 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.70235 * group2.width, y: group2.minY + 0.27500 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.67475 * group2.width, y: group2.minY + 0.27500 * group2.height))
        bezier2Path.close()
        bezier2Path.move(to: CGPoint(x: group2.minX + 0.67475 * group2.width, y: group2.minY + 0.58750 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.66225 * group2.width, y: group2.minY + 0.60000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.67475 * group2.width, y: group2.minY + 0.59440 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.66915 * group2.width, y: group2.minY + 0.60000 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.33725 * group2.width, y: group2.minY + 0.60000 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.32475 * group2.width, y: group2.minY + 0.58750 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.33035 * group2.width, y: group2.minY + 0.60000 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.32475 * group2.width, y: group2.minY + 0.59440 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.32475 * group2.width, y: group2.minY + 0.41250 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.33725 * group2.width, y: group2.minY + 0.40000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.32475 * group2.width, y: group2.minY + 0.40560 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.33035 * group2.width, y: group2.minY + 0.40000 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.66225 * group2.width, y: group2.minY + 0.40000 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.67475 * group2.width, y: group2.minY + 0.41250 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.66915 * group2.width, y: group2.minY + 0.40000 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.67475 * group2.width, y: group2.minY + 0.40560 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.67475 * group2.width, y: group2.minY + 0.58750 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.67475 * group2.width, y: group2.minY + 0.58750 * group2.height))
        bezier2Path.close()
        bezier2Path.usesEvenOddFillRule = true
        fillColor3.setFill()
        bezier2Path.fill()
    }
    
}

extension RKFileIconView {
    
    private func drawDocCanvas(in frame: CGRect) {
        let fillColor3 = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
        let fillColor = UIColor(red: 0.347, green: 0.500, blue: 0.884, alpha: 1.000)
        
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: frame.minX + 0.50000 * frame.width, y: frame.minY + 1.00000 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 1.00000 * frame.width, y: frame.minY + 0.50000 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.77614 * frame.width, y: frame.minY + 1.00000 * frame.height), controlPoint2: CGPoint(x: frame.minX + 1.00000 * frame.width, y: frame.minY + 0.77614 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.50000 * frame.width, y: frame.minY + 0.00000 * frame.height), controlPoint1: CGPoint(x: frame.minX + 1.00000 * frame.width, y: frame.minY + 0.22386 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.77614 * frame.width, y: frame.minY + 0.00000 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.00000 * frame.width, y: frame.minY + 0.50000 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.22386 * frame.width, y: frame.minY + 0.00000 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.00000 * frame.width, y: frame.minY + 0.22386 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.50000 * frame.width, y: frame.minY + 1.00000 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.00000 * frame.width, y: frame.minY + 0.77614 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.22386 * frame.width, y: frame.minY + 1.00000 * frame.height))
        bezierPath.close()
        bezierPath.usesEvenOddFillRule = true
        fillColor.setFill()
        bezierPath.fill()
        
        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: frame.minX + 0.67500 * frame.width, y: frame.minY + 0.27500 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.32500 * frame.width, y: frame.minY + 0.27500 * frame.height))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 0.27500 * frame.width, y: frame.minY + 0.32500 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.29740 * frame.width, y: frame.minY + 0.27500 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.27500 * frame.width, y: frame.minY + 0.29738 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.27500 * frame.width, y: frame.minY + 0.67500 * frame.height))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 0.32500 * frame.width, y: frame.minY + 0.72500 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.27500 * frame.width, y: frame.minY + 0.70260 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.29740 * frame.width, y: frame.minY + 0.72500 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.67500 * frame.width, y: frame.minY + 0.72500 * frame.height))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 0.72500 * frame.width, y: frame.minY + 0.67500 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.70260 * frame.width, y: frame.minY + 0.72500 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.72500 * frame.width, y: frame.minY + 0.70260 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.72500 * frame.width, y: frame.minY + 0.32500 * frame.height))
        bezier2Path.addCurve(to: CGPoint(x: frame.minX + 0.67500 * frame.width, y: frame.minY + 0.27500 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.72500 * frame.width, y: frame.minY + 0.29738 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.70260 * frame.width, y: frame.minY + 0.27500 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.67500 * frame.width, y: frame.minY + 0.27500 * frame.height))
        bezier2Path.close()
        bezier2Path.move(to: CGPoint(x: frame.minX + 0.37500 * frame.width, y: frame.minY + 0.37500 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.62500 * frame.width, y: frame.minY + 0.37500 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.62500 * frame.width, y: frame.minY + 0.42500 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.37500 * frame.width, y: frame.minY + 0.42500 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.37500 * frame.width, y: frame.minY + 0.37500 * frame.height))
        bezier2Path.close()
        bezier2Path.move(to: CGPoint(x: frame.minX + 0.37500 * frame.width, y: frame.minY + 0.47500 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.62500 * frame.width, y: frame.minY + 0.47500 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.62500 * frame.width, y: frame.minY + 0.52500 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.37500 * frame.width, y: frame.minY + 0.52500 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.37500 * frame.width, y: frame.minY + 0.47500 * frame.height))
        bezier2Path.close()
        bezier2Path.move(to: CGPoint(x: frame.minX + 0.37500 * frame.width, y: frame.minY + 0.57500 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.55000 * frame.width, y: frame.minY + 0.57500 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.55000 * frame.width, y: frame.minY + 0.62500 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.37500 * frame.width, y: frame.minY + 0.62500 * frame.height))
        bezier2Path.addLine(to: CGPoint(x: frame.minX + 0.37500 * frame.width, y: frame.minY + 0.57500 * frame.height))
        bezier2Path.close()
        bezier2Path.usesEvenOddFillRule = true
        fillColor3.setFill()
        bezier2Path.fill()
    }
    
}

extension RKFileIconView {
    
    private func drawXlsCanvas(in frame: CGRect) {
        let fillColor3 = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
        let fillColor2 = UIColor(red: 0.639, green: 0.796, blue: 0.459, alpha: 1.000)
        //// Subframes
        let group2: CGRect = CGRect(x: frame.minX + fastFloor(frame.width * 0.00000 + 0.5), y: frame.minY + fastFloor(frame.height * 0.00000 + 0.5), width: fastFloor(frame.width * 1.00000 + 0.5) - fastFloor(frame.width * 0.00000 + 0.5), height: fastFloor(frame.height * 1.00000 + 0.5) - fastFloor(frame.height * 0.00000 + 0.5))
        //// Group 2
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: group2.minX + 0.50000 * group2.width, y: group2.minY + 1.00000 * group2.height))
        bezierPath.addCurve(to: CGPoint(x: group2.minX + 1.00000 * group2.width, y: group2.minY + 0.50000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.77614 * group2.width, y: group2.minY + 1.00000 * group2.height), controlPoint2: CGPoint(x: group2.minX + 1.00000 * group2.width, y: group2.minY + 0.77614 * group2.height))
        bezierPath.addCurve(to: CGPoint(x: group2.minX + 0.50000 * group2.width, y: group2.minY + 0.00000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 1.00000 * group2.width, y: group2.minY + 0.22386 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.77614 * group2.width, y: group2.minY + 0.00000 * group2.height))
        bezierPath.addCurve(to: CGPoint(x: group2.minX + 0.00000 * group2.width, y: group2.minY + 0.50000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.22386 * group2.width, y: group2.minY + 0.00000 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.00000 * group2.width, y: group2.minY + 0.22386 * group2.height))
        bezierPath.addCurve(to: CGPoint(x: group2.minX + 0.50000 * group2.width, y: group2.minY + 1.00000 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.00000 * group2.width, y: group2.minY + 0.77614 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.22386 * group2.width, y: group2.minY + 1.00000 * group2.height))
        bezierPath.close()
        bezierPath.usesEvenOddFillRule = true
        fillColor2.setFill()
        bezierPath.fill()
        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: group2.minX + 0.67500 * group2.width, y: group2.minY + 0.27500 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.32500 * group2.width, y: group2.minY + 0.27500 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.27525 * group2.width, y: group2.minY + 0.32500 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.29740 * group2.width, y: group2.minY + 0.27500 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.27525 * group2.width, y: group2.minY + 0.29738 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.27505 * group2.width, y: group2.minY + 0.40000 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.27500 * group2.width, y: group2.minY + 0.40000 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.27500 * group2.width, y: group2.minY + 0.67500 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.32500 * group2.width, y: group2.minY + 0.72500 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.27500 * group2.width, y: group2.minY + 0.70260 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.29740 * group2.width, y: group2.minY + 0.72500 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.67500 * group2.width, y: group2.minY + 0.72500 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.72500 * group2.width, y: group2.minY + 0.67500 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.70260 * group2.width, y: group2.minY + 0.72500 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.72500 * group2.width, y: group2.minY + 0.70260 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.72500 * group2.width, y: group2.minY + 0.32500 * group2.height))
        bezier2Path.addCurve(to: CGPoint(x: group2.minX + 0.67500 * group2.width, y: group2.minY + 0.27500 * group2.height), controlPoint1: CGPoint(x: group2.minX + 0.72500 * group2.width, y: group2.minY + 0.29738 * group2.height), controlPoint2: CGPoint(x: group2.minX + 0.70260 * group2.width, y: group2.minY + 0.27500 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.67500 * group2.width, y: group2.minY + 0.27500 * group2.height))
        bezier2Path.close()
        bezier2Path.move(to: CGPoint(x: group2.minX + 0.67500 * group2.width, y: group2.minY + 0.47500 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.47500 * group2.width, y: group2.minY + 0.47500 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.47500 * group2.width, y: group2.minY + 0.67500 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.42500 * group2.width, y: group2.minY + 0.67500 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.42500 * group2.width, y: group2.minY + 0.47500 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.32500 * group2.width, y: group2.minY + 0.47500 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.32500 * group2.width, y: group2.minY + 0.42500 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.42500 * group2.width, y: group2.minY + 0.42500 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.42500 * group2.width, y: group2.minY + 0.32500 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.47500 * group2.width, y: group2.minY + 0.32500 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.47500 * group2.width, y: group2.minY + 0.42500 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.67500 * group2.width, y: group2.minY + 0.42500 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.67500 * group2.width, y: group2.minY + 0.47500 * group2.height))
        bezier2Path.addLine(to: CGPoint(x: group2.minX + 0.67500 * group2.width, y: group2.minY + 0.47500 * group2.height))
        bezier2Path.close()
        bezier2Path.usesEvenOddFillRule = true
        fillColor3.setFill()
        bezier2Path.fill()
    }
    
}
