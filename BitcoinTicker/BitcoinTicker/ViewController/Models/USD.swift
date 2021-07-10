//
//  USD.swift
//  BitcoinTicker
//
//  Created by Kishor Garkal on 10/07/21.
//

import Foundation


class USD : NSObject, NSCoding{

    var code : String!
    var symbol : String!
    var rate : String!
    var descriptionField : String!
    var rateFloat : Float!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        code = dictionary["code"] as? String
        symbol = dictionary["symbol"] as? String
        rate = dictionary["rate"] as? String
        descriptionField = dictionary["description"] as? String
        rateFloat = dictionary["rate_float"] as? Float
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if code != nil{
            dictionary["code"] = code
        }
        if symbol != nil{
            dictionary["symbol"] = symbol
        }
        if rate != nil{
            dictionary["rate"] = rate
        }
        if descriptionField != nil{
            dictionary["description"] = descriptionField
        }
        if rateFloat != nil{
            dictionary["rate_float"] = rateFloat
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        code = aDecoder.decodeObject(forKey: "code") as? String
        symbol = aDecoder.decodeObject(forKey: "symbol") as? String
        rate = aDecoder.decodeObject(forKey: "rate") as? String
        descriptionField = aDecoder.decodeObject(forKey: "description") as? String
        rateFloat = aDecoder.decodeObject(forKey: "rate_float") as? Float
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if code != nil{
            aCoder.encode(code, forKey: "code")
        }
        if symbol != nil{
            aCoder.encode(symbol, forKey: "symbol")
        }
        if rate != nil{
            aCoder.encode(rate, forKey: "rate")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if rateFloat != nil{
            aCoder.encode(rateFloat, forKey: "rate_float")
        }
    }
}
