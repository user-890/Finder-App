//
//  FFProductResults.swift
//  Pods
//
//  Created by Mackensie Alvarez on 2/18/17.
//
//

import Foundation
import SwiftyJSON
public class FFProductResults{
    
    
    /// This returns the Product Details
    public var productDetail: FFProductDetail
    /// This returns the Product Nutrition
    public var productNutrition: [FFProductNutrition]
    /// This returns Product Vitamin
    public var productVitamins: [FFProductVitamin]
    /// This returns Product Ingredients
    public var productIngredients: [FFProductIngredient]
    /// This returns Product Allergens
    public var productAllergens: [FFProductAllergen]
    /// This returns Product Report card
    public var productReportCard: [FFProductReportCard]
    
    init(json : JSON) {
 
        self.productDetail =  FFProductDetail(json: json["product_detail"])
        
        self.productNutrition =  json["product_nutrition"].arrayValue.map({ j in return FFProductNutrition(json: j) })
        self.productVitamins =  json["product_vitamins"].arrayValue.map({ j in return FFProductVitamin(json: j) })
        self.productIngredients =  json["product_ingredients"].arrayValue.map({ j in return FFProductIngredient(json: j) })
        self.productAllergens =  json["product_allergens"].arrayValue.map({ j in return FFProductAllergen(json: j) })
        
        self.productReportCard =  json["report_card"].arrayValue.map({ j in return FFProductReportCard(json: j) })
        
        
    }

}
