
import UIKit

public extension UIImage {
    
    convenience init?(systemName: String, orientation: UIImage.Orientation) {
        guard let uiImage = UIImage(systemName: systemName), let cgImage = uiImage.cgImage else {
            self.init(systemName: systemName)
            return
        }
        
        self.init(cgImage: cgImage, scale: uiImage.scale, orientation: orientation)
    }
    
}
