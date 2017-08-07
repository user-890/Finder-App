//
//  RequestCell.swift
//  Finder
//
//  Created by Claire Chen on 8/4/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit
import Parse

class RequestCell: UITableViewCell {
    
    
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var followButton: UIButton!
    
    var requestor: PFUser? = nil
    var request: PFObject! {
        didSet {
            if let user = request["requestor"] as? PFUser {
                requestor = user
                usernameLabel.text = user.username
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //        let requestor: PFUser = request!.object(forKey: "requestor") as! PFUser
        //        print(requestor)
        //        let query = PFUser.query()
        //        query?.limit = 1
        //        query?.whereKey("_id",  equalTo: requestor.objectId)
        //        query?.findObjectsInBackground(block: { (reqs: [PFObject]?, error: Error?) in
        //            if error == nil {
        //                print(reqs)
        //                let req:PFObject = reqs![0]
        //                self.usernameLabel.text = req.object(forKey: "username") as! String
        //            }
        //        })
        
    }
    
    @IBAction func onFollow(_ sender: Any) {
        followButton.isHidden = true
        let curUser = PFUser.current()
        var followers: [PFUser] = curUser?.object(forKey: "followers") as! [PFUser]
        followers.append(requestor!)
        curUser?.setObject(followers, forKey: "followers")
        curUser?.saveInBackground(block: { (success: Bool, error: Error?) in
            //added to followers
            if success {
                self.request["isAccepted"] = true
                self.request.saveInBackground(block: { (success: Bool, error: Error?) in
                    print("update request")
                })
                print ("added followers")
            } else {
                print("errorororororro")
            }
        })
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
