import Foundation
import SwiftUI
import SwiftyJSON

final class ServicesManager {
    
    func getData(completion: @escaping ([ServiceCellModel]?) -> Void) {
        ServiceRequest().request { (data, error) in
            guard let data = data as? Data else {
                completion(nil)
                return
            }
            
            let json = JSON(data)["body"]
            let servicesJSON = json["services"]
            
            var services: [ServiceCellModel] = []
            
            for service in servicesJSON.array ?? [] {
                let model = ServiceCellModel(json: service)
                services.append(model)
            }
            completion(services)
        }
    }
}
