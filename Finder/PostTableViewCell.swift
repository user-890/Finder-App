//
//  PostTableViewCell.swift
//  Finder
//
//  Created by Tyler Holloway on 7/11/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostTableViewCell: UITableViewCell {
    
    // MARK: Properties


    @IBOutlet weak var factText: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var sourceURL: UILabel!

    
    var post: PFObject! {
        didSet {
            let author = post["authorId"] as? PFUser
            
            
            //
            //            if didLikePost == "true" {
            //                likeButton.isSelected = true
            //            } else {
            //                likeButton.isSelected = false
            //            }
            
            
            
            if let creationTime = post["creationTime"] {
                let postDateFormatter: DateFormatter = {
                    let f = DateFormatter()
                    f.dateFormat = "MMM d, yyyy"
                    return f
                }()
                self.timeStamp.text = postDateFormatter.string(from: Date(timeIntervalSinceReferenceDate: creationTime as! TimeInterval))
                
            }
            
            if let user = post["authorId"] as? PFUser {
                self.usernameLabel.text = user.username
            } else {
                self.usernameLabel.text = " "
            }
            self.factText.text = post["caption"] as? String
        }
        
        
        
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2;
        self.profileImageView.clipsToBounds = true

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
