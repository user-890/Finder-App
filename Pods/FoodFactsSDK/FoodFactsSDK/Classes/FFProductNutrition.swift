//
//  FFProductNutrition.swift
//  Pods
//
//  Created by Mackensie Alvarez on 2/18/17.
//
//

import Foundation
import SwiftyJSON

public class FFProductNutrition{
    
    /// Unit Abbreviation for the Product Nutrition
    public var unit_abbreviation: String
    /// Name of the Nutrition
    public var name: String
    /// The amount of the Nutrition
    public var amount: String
    
    init(json: JSON) {
    
        self.unit_abbreviation = json["unit_abbreviation"].stringValue
        self.name = json["name"].stringValue
        self.amount = json["amount"].stringValue
        
    }
    
}
