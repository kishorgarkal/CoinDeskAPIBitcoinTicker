//
//  CurrencyClass.swift
//  BitcoinTicker
//
//  Created by Kishor Garkal on 10/07/21.
//

import Foundation


class CurrencyClass : NSObject, NSCoding{

    var time : Time!
    var disclaimer : String!
    var chartName : String!
    var bpi : Bpi!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        disclaimer = dictionary["disclaimer"] as? String
        chartName = dictionary["chartName"] as? String
        if let timeData = dictionary["time"] as? [String:Any]{
            time = Time(fromDictionary: timeData)
        }
        if let bpiData = dictionary["bpi"] as? [String:Any]{
            bpi = Bpi(fromDictionary: bpiData)
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if disclaimer != nil{
            dictionary["disclaimer"] = disclaimer
        }
        if chartName != nil{
            dictionary["chartName"] = chartName
        }
        if time != nil{
            dictionary["time"] = time.toDictionary()
        }
        if bpi != nil{
            dictionary["bpi"] = bpi.toDictionary()
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        time = aDecoder.decodeObject(forKey: "time") as? Time
        disclaimer = aDecoder.decodeObject(forKey: "disclaimer") as? String
        chartName = aDecoder.decodeObject(forKey: "chartName") as? String
        bpi = aDecoder.decodeObject(forKey: "bpi") as? Bpi
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if time != nil{
            aCoder.encode(time, forKey: "time")
        }
        if disclaimer != nil{
            aCoder.encode(disclaimer, forKey: "disclaimer")
        }
        if chartName != nil{
            aCoder.encode(chartName, forKey: "chartName")
        }
        if bpi != nil{
            aCoder.encode(bpi, forKey: "bpi")
        }
    }
}
