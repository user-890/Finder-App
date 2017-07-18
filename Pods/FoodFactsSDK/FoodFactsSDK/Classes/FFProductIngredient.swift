//
//  FFProductIngredient.swift
//  Pods
//
//  Created by Mackensie Alvarez on 2/17/17.
//
//

import Foundation
import SwiftyJSON

public class FFProductIngredient {
    
    /// Allergens for this ingredient
    public var allergens: String
    /// Ingredient ID
    public var ingredient_id: Int
    /// Ingredient name
    public var name: String
    /// Order of all ingredient
    public var order: Int
    
    init(json : JSON) {
        self.allergens = json["allergens"].stringValue
        self.ingredient_id = json["ingredient_id"].intValue
        self.name = json["name"].stringValue
        self.order = json["order"].intValue
    }
    
}
