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
    @IBOutlet weak var trayView: UIView!
    
    
    var trayOriginalCenter: CGPoint!
    
    
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
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        self.trayView.addGestureRecognizer(gestureRecognizer)
    }
    
    
    func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        var translation = gestureRecognizer.translation(in: contentView)
        print("translation \(translation)")
        
        if gestureRecognizer.state == UIGestureRecognizerState.began {
            trayOriginalCenter = trayView.center
            
        } else if gestureRecognizer.state == UIGestureRecognizerState.changed {
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
        } else if gestureRecognizer.state == UIGestureRecognizerState.ended {
            let velocity = gestureRecognizer.velocity(in: contentView)
            
            let trayDownOffset: CGFloat = 160
            let trayUp: CGPoint = trayView.center
            let trayDown = CGPoint(x: trayView.center.x ,y: trayView.center.y /*+ trayDownOffset*/)
            
            
            if velocity.y > 0 {
                UIView.animate(withDuration: 0.3, animations: { () -> Void in
                    self.trayView.center = trayDown
                })
            } else {
                UIView.animate(withDuration: 0.3, animations: { () -> Void in
                    self.trayView.center = trayUp
                })
            }
        }

    }
    
    
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
