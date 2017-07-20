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
    @IBOutlet weak var authorButton: UIButton!
    
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
