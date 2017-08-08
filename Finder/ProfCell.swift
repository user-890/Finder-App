//
//  ProfCell.swift
//  Finder
//
//  Created by Claire Chen on 7/31/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit
import Parse

class ProfCell: UITableViewCell {
    
    @IBOutlet var factLabel: UILabel!
    @IBOutlet var cellView: UIView!
    
    
    var post: PFObject! {
        didSet {
            //let obj = PFObject.getObjectWithID(post.objectId)
            factLabel.text = post["fact"] as? String ?? ""
            //factLabel.text = post["fact"] as! String
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.layer.cornerRadius = 20
        cellView.layer.borderWidth = 2
        cellView.layer.borderColor = UIColor.black.cgColor
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
