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
    
    var post: PFObject! {
        didSet {
            let query = PFQuery(className: "Fact")
            query.whereKey("objectId", equalTo: post.objectId)
            query.limit = 1
            do {
                let postObjL = try query.findObjects()
                let postObj = postObjL[0]
                factLabel.text = postObj["fact"] as? String ?? ""
            } catch {
              print("error")
            }
            //let obj = PFObject.getObjectWithID(post.objectId)
            
            //factLabel.text = post["fact"] as! String
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
