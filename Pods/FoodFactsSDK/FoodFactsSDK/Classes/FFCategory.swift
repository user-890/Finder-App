//
//  FFCategory.swift
//  Pods
//
//  Created by Mackensie Alvarez on 2/17/17.
//
//

import Foundation
import SwiftyJSON

public class FFCategory {
    /// This is Category ID
    public var category_id: Int
    /// This is the name of the Category
    public var name: String
    /// This is Category ID
    public var parent_category_id: Int
    /// List of Sub Categories
    public var subCategories: [FFSubCategory]
    
    
    /// Takes the JSON and assigns all values.
    init(json : JSON) {
        self.category_id = json["category_id"].intValue
        self.name = json["name"].stringValue
        self.parent_category_id = json["parent_category_id"].intValue

        if json["subCategories"].exists(){
            self.subCategories = json["subCategories"].arrayValue.map({ j in return FFSubCategory(json: j) })

        }else {
             self.subCategories = json["sub_categories"].arrayValue.map({ j in return FFSubCategory(json: j) })
        }
       
    }
    
    
}
