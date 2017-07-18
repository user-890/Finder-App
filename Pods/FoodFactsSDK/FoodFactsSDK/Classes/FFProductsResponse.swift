//
//  FFProductsResponse.swift
//  Pods
//
//  Created by Mackensie Alvarez on 2/17/17.
//
//

import Foundation

import SwiftyJSON

public class FFProductsResponse {
    
    /// The Status of the api call.
    public  var code: Int
    /// Your user ID.
    public var userId: String
    /// How many API Calls you have left.
    public var apiRemaining: Int
    /// Product Results
    public var results : FFProductsResults
    
    init(json: JSON) {
        self.code = json["code"].intValue
        self.userId = json["userId"].stringValue
        self.apiRemaining = json["apiRemaining"].intValue
        self.results = FFProductsResults(json: json["results"])
    }
    
}
