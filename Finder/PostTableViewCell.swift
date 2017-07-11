//
//  PostTableViewCell.swift
//  Finder
//
//  Created by Tyler Holloway on 7/11/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postDetailView: UIView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Change the color of the 'postDetailView' to black
        postDetailView.layer.borderColor = UIColor.white as! CGColor
        postDetailView.layer.borderWidth = 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
