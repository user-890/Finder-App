//
//  FFCategoryResponse.swift
//  Pods
//
//  Created by Mackensie Alvarez on 2/17/17.
//
//

import Foundation
import SwiftyJSON

public class FFCategoryListResponse {
    
   /// The Status of the api call.
   public  var code: Int
   /// Your user ID.
   public var userId: String
   /// How many API Calls you have left.
   public var apiRemaining: Int
   /// List of categoies.
   public var categoies : [FFCategory]
    
    
    init(json: JSON) {
        self.code = json["code"].intValue
        self.userId = json["userId"].stringValue
        self.apiRemaining = json["apiRemaining"].intValue
        self.categoies = json["results"].arrayValue.map({ j in return FFCategory(json: j) })
        


    }
    
}
