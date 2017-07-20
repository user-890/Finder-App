//
//  Fact.swift
//  Finder
//
//  Created by Claire Chen on 7/18/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import Foundation
import Parse

class Fact: NSObject{
    //method to add a post to parse
    class func postFact(source: String, withCaption fact: String, withCompletion completion: PFBooleanResultBlock?) {
        // Create Parse object PFObject
        let post = PFObject(className: "Fact")
        
        // Add relevant fields to the object
        post["fact"] = fact
        post["source"] = source
        
        // Save object (following function will save the object in Parse asynchronously)
        post.saveInBackground(block: completion)
    }
    
    //method to convert ui image to pffile
    class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        // check if image is not nil
        if let image = image {
            // get image data and check if that is not nil
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }
    }
