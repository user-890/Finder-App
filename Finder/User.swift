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



class User {
    
    var id: String?
    var name: String?
    var genre: String?
    
    init(id: String?, name: String?, genre: String?){
        self.id = id
        self.name = name
        self.genre = genre
    }
}
