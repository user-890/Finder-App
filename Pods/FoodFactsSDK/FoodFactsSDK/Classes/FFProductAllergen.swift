//
//  FFProductAllergens.swift
//  Pods
//
//  Created by Mackensie Alvarez on 2/18/17.
//
//

import Foundation
import SwiftyJSON

public class FFProductAllergen{
    
    /// This is the Allergen ID
    public var allergen_id: Int
    /// The Allergen name
    public var name: String
   
    
    init(json: JSON) {
        
        self.name = json["name"].stringValue
        self.allergen_id = json["allergen_id"].intValue
        
    }
    
}
