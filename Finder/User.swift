//
//  Post.swift
//  Finder
//
//  Created by Tyler Holloway on 7/15/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseStorage



class User: NSObject {
    var name: String?
    var email: String?
    init(dictionary: [String: Any]) {
        self.name = dictionary["name"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
    }
}
