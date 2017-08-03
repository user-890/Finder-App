//
//  Vote.swift
//  Finder
//
//  Created by Tyler Holloway on 8/3/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import Foundation
import Parse

class Vote {
    var trueCount: Int!
    var falseCount: Int!
    
    init(trueCount: Int, falseCount: Int) {
        self.trueCount = trueCount
        self.falseCount = falseCount
    }
    
    


    class func voteOnFact(trueCount: Int, withCompletion completion: PFBooleanResultBlock?) {
        //        // DON'T UNDERSTAND
        //
        //        let post = PFObject(className: "Post")
        //
        //        post["creationTime"] = Date.timeIntervalSinceReferenceDate
        //        post["media"] = getPFFileFromImage(image)
        //        post["authorId"] = PFUser.current()?.objectId
        //        post["caption"] = caption
        //        post["likeCount"] = 0
        //        post["commentCount"] = 0
        
        // Create Parse object PFObject
        let post = PFObject (className: "Vote")
        
        // Add relevant fields to the object
        post["creationTime"] = Date.timeIntervalSinceReferenceDate
        //        post["media"] = getPFFileFromImage(image: image)
        post["authorId"] = PFUser.current()
        post["falseCount"] = 0
        post["commentsCount"] = 0
        post["liked"] = false
        
        // Save object (following function will save the object in Parse asynchronously)
        post.saveInBackground(block: completion)
        
    }
}
