//
//  RecommendedTableViewCell.swift
//  Finder
//
//  Created by Tyler Holloway on 7/11/17.
//  Copyright © 2017 Finder. All rights reserved.
//


import UIKit
import SDWebImage

class RecommendedTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sourceLink: UIButton!
    @IBOutlet weak var trayView: UIView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var timeStamp: UILabel!
    
    var trayOriginalCenter: CGPoint!
    var startLocation: CGPoint!
    var trayAtBottom = true
    
    
    var recommend : Recommended! {
        
        
        didSet{
            self.updateUI()
            
            
        }
    }
    
    private func updateUI() {
        
        
        
        //Gradient for the bottom of the cell
        
        //        let mask = CAGradientLayer()
        //        mask.startPoint = CGPoint(x: 1.0, y: 0.0)
        //        mask.endPoint = CGPoint(x:1.0, y:1.0)
        //        let whiteColor = UIColor.white
        //        mask.colors = [whiteColor.withAlphaComponent(0.0).cgColor,whiteColor.withAlphaComponent(1.0),whiteColor.withAlphaComponent(1.0).cgColor]
        //        mask.locations = [NSNumber(value: 0.0),NSNumber(value: 0.05),NSNumber(value: 1.0)]
        //        mask.frame = gradientView.bounds
        //        gradientView.layer.mask = mask
        //
        //
        
        
        
        
        let imgurl = URL(string: recommend.PostImage)
        self.backgroundImageView.sd_setImage(with: imgurl)
        self.titleLabel.text = recommend.Title
        self.descLabel.text = recommend.desc
        //self.timeStamp = recommend.ti
        
        //let sourcingLink = URL(string: recommend.sendURL)
        sourceLink.setTitle(recommend.sendURL, for: .normal)
        
        
    }
    
    
    
    @IBAction func pressLInk(_ sender: Any) {
        
        if let url = URL(string: recommend.sendURL) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        
    }
    
    func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        var translation = gestureRecognizer.translation(in: trayView)
        //print("translation \(translation)")
        //print("contentView \(contentView.center)")
        let velocity = gestureRecognizer.velocity(in: trayView)
        if gestureRecognizer.state == UIGestureRecognizerState.began {
            trayOriginalCenter = trayView.center
            
        } else if gestureRecognizer.state == UIGestureRecognizerState.changed {
            if (trayAtBottom && velocity.y > 0) || (!trayAtBottom && velocity.y < 0){
                //do nnothing
            } else {
                trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
            }
        } else if gestureRecognizer.state == UIGestureRecognizerState.ended {
            if velocity.y < 0{ //swipe up
                UIView.animate(withDuration: 0.3, animations: {
                    self.trayView.center = self.contentView.center
                    self.trayAtBottom = false
                })
                
            } else { //swipe down
                UIView.animate(withDuration: 0.3, animations: {
                    self.trayView.center.y = (self.contentView.bounds.size.height) + 80
                    self.trayAtBottom = true
                })
            }
            
        }
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        self.trayView.addGestureRecognizer(gestureRecognizer)
        trayView.center.y = (contentView.bounds.size.height) + 80
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
