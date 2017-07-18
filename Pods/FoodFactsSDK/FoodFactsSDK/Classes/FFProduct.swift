//
//  FFProduct.swift
//  Pods
//
//  Created by Mackensie Alvarez on 2/17/17.
//
//

import Foundation
import SwiftyJSON

public class FFProduct {
    /// List of Allergens
    public var allergen_list: String
    /// Brand for the product
    public var brand: String
    /// Main Category name for the product
    public var main_category_name: String
    /// Product ID
    public var product_id: String
    /// Image for the product
    public var product_image: String
    /// Product UPC CODE
    public var product_upc: String
    public var sef_url: String
    /// Serving size for the product
    public var serving_size: String
    /// Sub category name
    public var sub_category_name: String
    /// The title/name of the product
    public var title: String
    /// Total weight for the product
    public var total_weight: String
    /// Our Score for the product
    public var food_facts_score: Int
    /// Main category ID
    public var main_category_id: Int
    /// Sub Category ID
    public var sub_category_id: Int
    /// List of ingredients for this product
     public var ingredients: [FFProductIngredient]
    
    init(json : JSON) {
        
        self.allergen_list = json["allergen_list"].stringValue
        self.brand = json["brand"].stringValue
        self.main_category_name = json["main_category_name"].stringValue
        self.product_id = json["product_id"].stringValue
        self.product_image = json["product_image"].stringValue
        self.product_upc = json["product_upc"].stringValue
        self.sef_url = json["sef_url"].stringValue
        self.serving_size = json["serving_size"].stringValue
        self.sub_category_name = json["sub_category_name"].stringValue
        self.title = json["title"].stringValue
        self.total_weight = json["total_weight"].stringValue
        self.food_facts_score = json["food_facts_score"].intValue
        self.main_category_id = json["main_category_id"].intValue
        self.sub_category_id = json["sub_category_id"].intValue
        self.ingredients = json["ingredients"].arrayValue.map({ j in return FFProductIngredient(json: j) })
        
        
        
    }
}
