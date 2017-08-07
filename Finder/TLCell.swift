//
//  TLCell.swift
//  Finder
//
//  Created by Claire Chen on 8/7/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit
import Parse

class TLCell: UITableViewCell {
    
    
    @IBOutlet var factLabel: UILabel!
    @IBOutlet var usernameLabel: UILabel!
    
    var card: PFObject! {
        didSet {
            factLabel.text = card["fact"] as! String
            usernameLabel.text = card["author"] as! String
            print(card["author"])
            
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
