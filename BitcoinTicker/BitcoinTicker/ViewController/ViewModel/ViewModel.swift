//
//  ViewModel.swift
//  BitcoinTicker
//
//  Created by Kishor Garkal on 10/07/21.
//

import UIKit

class ViewModel: NSObject {
    
    //MARK: - get data from APi and pass to viewcontroller
    
    func getLiveCryptoValue(success:@escaping (JSON) -> Void, failure:@escaping (String) -> Void) {
        CustomLoader.instance.showLoaderView()

        apiService.requestURL(SERVER_API, success: { jsonData in
            let currencyVal = jsonData
            CustomLoader.instance.hideLoaderView()
            success(currencyVal)


        }) { errorMsg in
            CustomLoader.instance.hideLoaderView()
            failure(errorMsg)

        }
        
    }
}
