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
    @IBOutlet var trayView: UIView!
    @IBOutlet weak var cardView: UIView!
    
    var card: PFObject! {
        didSet {
            factLabel.text = card["fact"] as? String
            //usernameLabel.text = card["author"] as! String
            print(card["author"])
            
            }
        }
        
        

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        trayView.layer.cornerRadius = 30
        trayView.layer.borderWidth = 5
        //var ourYellow = UIColor(red: 249/255, green: 208/255, blue: 16/255, alpha: 1)
        //var ourGreen =  UIColor(red: 88/255, green: 115/255, blue: 60/255, alpha: 1)var ourYellow = UIColor(red: 249/255, green: 208/255, blue: 16/255, alpha: 1)
        trayView.layer.borderColor = UIColor.white.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
