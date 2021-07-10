//
//  apiService.swift
//  BitcoinTicker
//
//  Created by Kishor Garkal on 10/07/21.
//

import UIKit

class apiService: NSObject {
    static var shareInstance = apiService()
    
    //MARK: -  URL Requests
    class func requestURL(_ strURL: String, success:@escaping (JSON) -> Void, failure:@escaping (String) -> Void) {
        let url =  strURL
      
        if #available(iOS 13.0, *) {
            CustomLoader.instance.showLoaderView()
        } else {
            // Fallback on earlier versions
        }
       
        if Connectivity.isConnectedToInternet(){
            Alamofire.request(url,encoding: URLEncoding.default).responseJSON { (responseObject) -> Void in
                switch responseObject.result {
                case let .success(value):
                    if  var returnData = String(data: responseObject.data!, encoding: .utf8) {
                        returnData = returnData.removingPercentEncoding!
                      //  returnData = try!  returnData.aesDecrypt()
                        let json = JSON(parseJSON: returnData)
                        print(json)
                        success(json)
                    }
                    
                    
                case  .failure(_):
                    failure("responseData.error.debugDescription")
                    break
                }
        }
    }
    }
    class Connectivity {
        class func isConnectedToInternet() -> Bool {
            return NetworkReachabilityManager()?.isReachable ?? false
        }
    }


}
