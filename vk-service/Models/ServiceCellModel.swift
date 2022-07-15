import Foundation
import UIKit
import SwiftyJSON

final class ServiceCellModel: ObservableObject {
    var iconUrl = ""
    var name = ""
    var description = ""
    var link = ""
    
    init(json: JSON = JSON()) {
        iconUrl = json["icon_url"].stringValue
        description = json["description"].stringValue
        name = json["name"].stringValue
        link = json["link"].stringValue
    }
}

extension ServiceCellModel: Identifiable {}
