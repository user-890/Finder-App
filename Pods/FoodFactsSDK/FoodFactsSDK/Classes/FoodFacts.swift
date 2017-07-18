//
//  FoodFacts.swift
//  Pods
//
//  Created by Mackensie Alvarez on 2/17/17.
//
//

import Foundation
import Alamofire
import SwiftyJSON

public class FoodFacts {
    
    var username: String = ""
    var password: String = ""
    var baseURL : String = "https://api.foodfacts.com/ci/api/foodfacts/"
    
    public init() {
        let userDefaults: UserDefaults = UserDefaults.standard
        
        if userDefaults.string(forKey: "FoodFactsSDK_username") == nil ||  userDefaults.string(forKey: "FoodFactsSDK_password") == nil{
            self.username = ""
            self.password = ""
        } else {
            //  print(userDefaults.string(forKey: "FoodFactsSDK_username")! + " has account")
            self.username = userDefaults.string(forKey: "FoodFactsSDK_username")!
            self.password = userDefaults.string(forKey: "FoodFactsSDK_password")!
        }
        
    }
    
    
    /**
     Configs username and password for all api calls.
     
     - parameter username: Username for API account.
     
     - parameter password: Password for API account.
     
     */
    public func configuration(username: String, password: String){
        
        self.username = username
        self.password = password
        let userDefaults: UserDefaults = UserDefaults.standard
        userDefaults.set(username, forKey: "FoodFactsSDK_username")
        userDefaults.set(password, forKey: "FoodFactsSDK_password")
        userDefaults.synchronize()
    }
    
    /**
     Food Categories List
     
     */
    public func categoryList(callback:  @escaping (FFCategoryListResponse)->()){
        
        let url = baseURL+"food_categories/format/json"
        Alamofire.request(url, method: .post, parameters: ["login": username, "password" : password]).responseJSON {response in
            if let j = response.result.value{
                //Check if vaild
                let json = JSON(j)
                
                
                
                switch (json["code"].intValue){
                case 1000:
                    let response = FFCategoryListResponse(json: json)
                    callback(response)
                    break
                case 1001:
                    print("Invalid User Name, does not exist")
                    break
                case 1002:
                    print("Invalid Credentials")
                    break
                case 1003:
                    print("Subscription is currently not active")
                    break
                case 1004:
                    print("Function not allowed through your current subscription")
                    break
                case 1005:
                    print("Exceeded the amount of API calls per day your allotted based on your subscription")
                    break
                case 1006:
                    print("Invalid Category Requested")
                    break
                case 1007:
                    print("Invalid Food Per Search Term Requested")
                    break
                case 1008:
                    print("Invalid page number for results")
                    break
                case 1009:
                    print("Invalid food product id provided")
                    break
                case 1010:
                    print("Invalid food UPC provided")
                    break
                default:
                    print("")
                }
                
                //                if json["code"].intValue == 1001 {
                //                    //Error
                //                    print(json["message"].stringValue)
                //                } else {
                //                    //Success - response
                //                    let response = FFCategoryListResponse(json: json)
                //                    callback(response)
                //                }
            }
        }
    }
    
    /**
     Food Sub Categories List
     
     - parameter category_id: The Parent category ID.
     
     */
    public func subCategoryList(category_id: Int,callback: @escaping (FFCategoryListResponse)->()){
        
        let url = baseURL+"food_sub_categories/format/json"
        Alamofire.request(url, method: .post, parameters: ["login": username, "password" : password, "category": category_id]).responseJSON {response in
            
            if let j = response.result.value{
                //Check if vaild
                let json = JSON(j)
                
                switch (json["code"].intValue){
                case 1000:
                    let response = FFCategoryListResponse(json: json)
                    callback(response)
                    break
                case 1001:
                    print("Invalid User Name, does not exist")
                    break
                case 1002:
                    print("Invalid Credentials")
                    break
                case 1003:
                    print("Subscription is currently not active")
                    break
                case 1004:
                    print("Function not allowed through your current subscription")
                    break
                case 1005:
                    print("Exceeded the amount of API calls per day your allotted based on your subscription")
                    break
                case 1006:
                    print("Invalid Category Requested")
                    break
                case 1007:
                    print("Invalid Food Per Search Term Requested")
                    break
                case 1008:
                    print("Invalid page number for results")
                    break
                case 1009:
                    print("Invalid food product id provided")
                    break
                case 1010:
                    print("Invalid food UPC provided")
                    break
                default:
                    print("")
                }
            }
        }
    }
    
    /**
     Products By Category List
     
     - parameter category_id: The Parent category ID.
     - parameter subcategory_id: The  Sub category ID.
     - parameter per_page: How many products per page
     - parameter page: Which page would you like to start
     - parameter sort_by: Sort method
     
     */
    public func productsByCategory(category_id: Int, subcategory_id: Int, per_page: Int, page: Int, sort_by: String, callback: @escaping (FFProductsResponse)->()){
        
        let url = baseURL+"food_products_per_category/format/json"
        Alamofire.request(url, method: .post, parameters: ["login": username, "password" : password, "category": category_id, "sub_category": subcategory_id, "per_page": per_page, "page" : page, "sort_by" : sort_by]).responseJSON {response in
            
            if let j = response.result.value{
                //Check if vaild
                let json = JSON(j)
                
                switch (json["code"].intValue){
                case 1000:
                    let response = FFProductsResponse(json: json)
                    callback(response)
                    break
                case 1001:
                    print("Invalid User Name, does not exist")
                    break
                case 1002:
                    print("Invalid Credentials")
                    break
                case 1003:
                    print("Subscription is currently not active")
                    break
                case 1004:
                    print("Function not allowed through your current subscription")
                    break
                case 1005:
                    print("Exceeded the amount of API calls per day your allotted based on your subscription")
                    break
                case 1006:
                    print("Invalid Category Requested")
                    break
                case 1007:
                    print("Invalid Food Per Search Term Requested")
                    break
                case 1008:
                    print("Invalid page number for results")
                    break
                case 1009:
                    print("Invalid food product id provided")
                    break
                case 1010:
                    print("Invalid food UPC provided")
                    break
                default:
                    print("")
                }
            }
        }
    }
    
    /**
     Products By Search Term
     
     - parameter category_id: The Parent category ID.
     - parameter subcategory_id: The  Sub category ID.
     - parameter per_page: How many products per page
     - parameter page: Which page would you like to start
     - parameter sort_by: Sort method
     
     */
    public func productsBySearchTerm(search_term: String, per_page: Int, page: Int, sort_by: String, callback: @escaping  (FFProductsResponse)->()){
        
        let url = baseURL+"food_products_per_search_term/format/json"
        Alamofire.request(url, method: .post, parameters: ["login": username, "password" : password, "search_term": search_term, "per_page": per_page, "page" : page, "sort_by" : sort_by]).responseJSON {response in
            
            if let j = response.result.value{
                //Check if vaild
                let json = JSON(j)
                
                
                switch (json["code"].intValue){
                case 1000:
                    let response = FFProductsResponse(json: json)
                    callback(response)
                    break
                case 1001:
                    print("Invalid User Name, does not exist")
                    break
                case 1002:
                    print("Invalid Credentials")
                    break
                case 1003:
                    print("Subscription is currently not active")
                    break
                case 1004:
                    print("Function not allowed through your current subscription")
                    break
                case 1005:
                    print("Exceeded the amount of API calls per day your allotted based on your subscription")
                    break
                case 1006:
                    print("Invalid Category Requested")
                    break
                case 1007:
                    print("Invalid Food Per Search Term Requested")
                    break
                case 1008:
                    print("Invalid page number for results")
                    break
                case 1009:
                    print("Invalid food product id provided")
                    break
                case 1010:
                    print("Invalid food UPC provided")
                    break
                default:
                    print("")
                }
            }
        }
    }
    
    /**
     Products Details
     
     - parameter product_id: The Product ID
     
     */
    public func productInformationByID(product_id: String, callback: @escaping (FFProductResponse)->()){
        
        let url = baseURL+"food_product_detail_information/format/json"
        Alamofire.request(url, method: .post, parameters: ["login": username, "password" : password,  "product_id" : product_id]).responseJSON {response in
            if let j = response.result.value{
                //Check if vaild
                let json = JSON(j)
                
                
                switch (json["code"].intValue){
                case 1000:
                    let response = FFProductResponse(json: json)
                    callback(response)
                    break
                case 1001:
                    print("Invalid User Name, does not exist")
                    break
                case 1002:
                    print("Invalid Credentials")
                    break
                case 1003:
                    print("Subscription is currently not active")
                    break
                case 1004:
                    print("Function not allowed through your current subscription")
                    break
                case 1005:
                    print("Exceeded the amount of API calls per day your allotted based on your subscription")
                    break
                case 1006:
                    print("Invalid Category Requested")
                    break
                case 1007:
                    print("Invalid Food Per Search Term Requested")
                    break
                case 1008:
                    print("Invalid page number for results")
                    break
                case 1009:
                    print("Invalid food product id provided")
                    break
                case 1010:
                    print("Invalid food UPC provided")
                    break
                default:
                    print("")
                }
            }
        }
    }
    
    /**
     Products Details For UPC
     
     - parameter upc: The Product UPC Code
     
     */
    public func productInformationByUPC(upc: String, callback: @escaping (FFProductResponse)->()){
        
        let url = baseURL+"food_find_product_by_upc/format/json"
        Alamofire.request(url, method: .post, parameters: ["login": username, "password" : password,  "upc" : upc]).responseJSON {response in
            if let j = response.result.value{
                //Check if vaild
                let json = JSON(j)
                
                
                
                
                switch (json["code"].intValue){
                case 1000:
                    let response = FFProductResponse(json: json)
                    callback(response)
                    break
                case 1001:
                    print("Invalid User Name, does not exist")
                    break
                case 1002:
                    print("Invalid Credentials")
                    break
                case 1003:
                    print("Subscription is currently not active")
                    break
                case 1004:
                    print("Function not allowed through your current subscription")
                    break
                case 1005:
                    print("Exceeded the amount of API calls per day your allotted based on your subscription")
                    break
                case 1006:
                    print("Invalid Category Requested")
                    break
                case 1007:
                    print("Invalid Food Per Search Term Requested")
                    break
                case 1008:
                    print("Invalid page number for results")
                    break
                case 1009:
                    print("Invalid food product id provided")
                    break
                case 1010:
                    print("Invalid food UPC provided")
                    break
                default:
                    print("")
                }
                
            }
        }
    }
    
}
