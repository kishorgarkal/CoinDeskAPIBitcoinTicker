//
//  Bpi.swift
//  BitcoinTicker
//
//  Created by Kishor Garkal on 10/07/21.
//

import Foundation


class Bpi : NSObject, NSCoding{

    var uSD : USD!
    var gBP : GBP!
    var eUR : EUR!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        if let uSDData = dictionary["USD"] as? [String:Any]{
            uSD = USD(fromDictionary: uSDData)
        }
        if let gBPData = dictionary["GBP"] as? [String:Any]{
            gBP = GBP(fromDictionary: gBPData)
        }
        if let eURData = dictionary["EUR"] as? [String:Any]{
            eUR = EUR(fromDictionary: eURData)
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if uSD != nil{
            dictionary["uSD"] = uSD.toDictionary()
        }
        if gBP != nil{
            dictionary["gBP"] = gBP.toDictionary()
        }
        if eUR != nil{
            dictionary["eUR"] = eUR.toDictionary()
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        uSD = aDecoder.decodeObject(forKey: "USD") as? USD
        gBP = aDecoder.decodeObject(forKey: "GBP") as? GBP
        eUR = aDecoder.decodeObject(forKey: "EUR") as? EUR
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if uSD != nil{
            aCoder.encode(uSD, forKey: "USD")
        }
        if gBP != nil{
            aCoder.encode(gBP, forKey: "GBP")
        }
        if eUR != nil{
            aCoder.encode(eUR, forKey: "EUR")
        }
    }
}
