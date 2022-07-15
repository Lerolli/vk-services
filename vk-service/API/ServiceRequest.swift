import Foundation

final class ServiceRequest: BaseRequest {
    override init() {
        super.init()
        path = "result.json"
    }
}
