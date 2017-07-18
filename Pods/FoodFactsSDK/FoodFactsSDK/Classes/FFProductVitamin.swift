//
//  FFProductVitamins.swift
//  Pods
//
//  Created by Mackensie Alvarez on 2/18/17.
//
//

import Foundation
import SwiftyJSON

public class FFProductVitamin{
    
    /// This is the amount for the Vitamin
    public var amount: Int
    /// This is the name of the Vitamin
    public var name: String
    /// This is the percentage for the Vitamin
    public var percent: Int
    
    init(json: JSON) {
        
        self.amount = json["amount"].intValue
        self.name = json["name"].stringValue
        self.percent = json["percent"].intValue
        
    }
}
