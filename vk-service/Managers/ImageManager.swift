import Foundation
import UIKit

final class ImageManager {
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        ImageRequest(url: urlString).request { data, error in
            guard let data = data as? Data,let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            completed(image)
        }
    }
}
