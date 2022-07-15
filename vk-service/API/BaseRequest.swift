import Foundation
import Alamofire
import SwiftyJSON
import UIKit

class BaseRequest {
    
    let host = "https://publicstorage.hb.bizmrg.com/sirius/"
    var path = ""
    func request(_ callback: @escaping (Any?, Error?) -> Void) {
        
        AF.request(host + path, method: .get, encoding: URLEncoding.default)
            .response { response in
                switch response.result {
                case .success:
                    if let data = response.data {
                        callback(data, nil)
                    } else {
                        callback(nil, nil)
                    }
                case .failure(let error):
                    if case AFError.responseSerializationFailed(reason: .inputDataNilOrZeroLength) = error {
                        callback(nil, nil)
                        return
                    }
                    callback(nil, error)
                }
            }
    }
}



