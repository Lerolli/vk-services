import Foundation

final class ImageRequest: BaseRequest {
    init(url: String = "") {
        super.init()
        path = url.replacingOccurrences(of: "https://publicstorage.hb.bizmrg.com/sirius/", with: "")
    }
}
