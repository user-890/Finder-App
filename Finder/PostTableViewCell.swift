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
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleAuthor: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var newsLabel: UILabel!
    @IBOutlet weak var postDetailView: UIView!

    
    
    @IBAction func pressOnBookmark(_ sender: Any) {
        if bookmarkButton.isSelected{
            bookmarkButton.isSelected = false
        } else {
            bookmarkButton.isSelected = true
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
