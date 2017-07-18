//
//  FFProductsDetailResponse.swift
//  Pods
//
//  Created by Mackensie Alvarez on 2/18/17.
//
//

import Foundation
import SwiftyJSON

public class FFProductResponse{
    
    /// The Status of the api call.
    public  var code: Int
    /// Your user ID.
    public var userId: String
    /// How many API Calls you have left.
    public var apiRemaining: Int
    /// Returns Product Results
    public var results : FFProductResults
    
    init(json: JSON) {
        self.code = json["code"].intValue
        self.userId = json["userId"].stringValue
        self.apiRemaining = json["apiRemaining"].intValue
        self.results = FFProductResults(json: json["results"])
    }

    
    
}
