//
//  Request.swift
//  Finder
//
//  Created by Claire Chen on 8/4/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import Foundation
import Parse

class Request: NSObject{
    class func postRequest(reciever: PFUser, withCompletion completion: PFBooleanResultBlock?) {
        
        let req = PFObject (className: "Request")
        
        // Add relevant fields to the objecy
        req["requestor"] = PFUser.current()//author //of post
        req["isAccepted"] = false
        req["reciever_id"] = reciever.objectId
        
        // Save object (following function will save the object in Parse asynchronously)
        req.saveInBackground(block: completion)
        
    }
    
}
