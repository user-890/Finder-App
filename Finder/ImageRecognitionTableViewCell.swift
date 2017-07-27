//
//  ImageRecognitionTableViewCell.swift
//  Finder
//
//  Created by Tyler Holloway on 7/26/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit

class ImageRecognitionTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var imageRecogButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func pressImageRecogButton(_ sender: Any) {
        // Perform Segue
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
