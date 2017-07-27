//
//  TextRecognitionTableViewCell.swift
//  Finder
//
//  Created by Tyler Holloway on 7/26/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit

class TextRecognitionTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var textRecogButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func pressTextRecogButton(_ sender: Any) {
        // TODO: Perform Segue
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
