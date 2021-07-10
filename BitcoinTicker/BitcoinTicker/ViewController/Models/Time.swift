//
//  Time.swift
//  BitcoinTicker
//
//  Created by Kishor Garkal on 10/07/21.
//

import Foundation


class Time : NSObject, NSCoding{

    var updated : String!
    var updatedISO : String!
    var updateduk : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        updated = dictionary["updated"] as? String
        updatedISO = dictionary["updatedISO"] as? String
        updateduk = dictionary["updateduk"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if updated != nil{
            dictionary["updated"] = updated
        }
        if updatedISO != nil{
            dictionary["updatedISO"] = updatedISO
        }
        if updateduk != nil{
            dictionary["updateduk"] = updateduk
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        updated = aDecoder.decodeObject(forKey: "updated") as? String
        updatedISO = aDecoder.decodeObject(forKey: "updatedISO") as? String
        updateduk = aDecoder.decodeObject(forKey: "updateduk") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if updated != nil{
            aCoder.encode(updated, forKey: "updated")
        }
        if updatedISO != nil{
            aCoder.encode(updatedISO, forKey: "updatedISO")
        }
        if updateduk != nil{
            aCoder.encode(updateduk, forKey: "updateduk")
        }
    }
}
