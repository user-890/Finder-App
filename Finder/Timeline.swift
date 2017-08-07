//
//  Timeline.swift
//  Finder
//
//  Created by Claire Chen on 8/3/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import Foundation

//
//  Fact.swift
//  Finder
//
//  Created by Claire Chen on 7/18/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import Parse

class Timeline: NSObject{
    
    class func postTimeline(owner: String, fact: String, link: String, withCompletion completion: PFBooleanResultBlock?) {
        
        let tl = PFObject (className: "Timeline")
        
        // Add relevant fields to the objecy
        tl["author"] = PFUser.current()?.username//author //of post
        tl["fact"] = fact
        tl["url"] = link
        tl["owner"] = owner//of the timeline -- wherekey search
        
        // Save object (following function will save the object in Parse asynchronously)
        tl.saveInBackground(block: completion)
        
    }
    
}
