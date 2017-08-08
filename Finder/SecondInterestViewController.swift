//
//  SecondInterestViewController.swift
//  Finder
//
//  Created by Tyler Holloway on 8/7/17.
//  Copyright © 2017 Finder. All rights reserved.
//

//
//  InterestViewController.swift
//  Finder
//
//  Created by Tyler Holloway on 8/1/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit
import Parse

class SecondInterestViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var historyButton: UIButton!
    @IBOutlet weak var sportsButton: UIButton!
    @IBOutlet weak var entertainmentButton: UIButton!
    @IBOutlet weak var techButton: UIButton!
    @IBOutlet weak var politicsButton: UIButton!
    @IBOutlet weak var fashionButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var arrayWithoutData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        historyButton.layer.borderWidth = 2
        historyButton.layer.borderColor = UIColor.black.cgColor
        
        entertainmentButton.layer.borderWidth = 2
        entertainmentButton.layer.borderColor = UIColor.black.cgColor
        
        sportsButton.layer.borderWidth = 2
        sportsButton.layer.borderColor = UIColor.black.cgColor
        
        politicsButton.layer.borderWidth = 2
        politicsButton.layer.borderColor = UIColor.black.cgColor
        
        techButton.layer.borderWidth = 2
        techButton.layer.borderColor = UIColor.black.cgColor
        
    }
    
    
    @IBAction func pressHistory(_ sender: Any) {
        if historyButton.backgroundColor == UIColor.clear {
            historyButton.backgroundColor = UIColor.yellow
            
            // Change the text color:
            
            // Append the user's name to an inrerest array
            let otherVC = RegisterViewController()
            arrayWithoutData = otherVC.interest
            
            arrayWithoutData.append("history")
            let firstElement = arrayWithoutData.first
            print(firstElement)
            
            
        }
        else if historyButton.backgroundColor == UIColor.yellow{
            historyButton.backgroundColor = UIColor.clear
        }
    }
    
    
    @IBAction func pressSports(_ sender: Any) {
        if sportsButton.backgroundColor == UIColor.clear {
            sportsButton.backgroundColor = UIColor.yellow
            
            // Append the user's name to an inrerest array
            let otherVC = RegisterViewController()
            arrayWithoutData = otherVC.interest
            
            arrayWithoutData.append("sports")
            let firstElement = arrayWithoutData.first
            print(firstElement)
            
        }
        else if sportsButton.backgroundColor == UIColor.yellow {
            sportsButton.backgroundColor = UIColor.clear
        }
        
    }
    
    
    @IBAction func pressEntertainment(_ sender: Any) {
        if entertainmentButton.backgroundColor == UIColor.clear {
            entertainmentButton.backgroundColor = UIColor.yellow
            
            // Append the user's name to an inrerest array
            let otherVC = RegisterViewController()
            arrayWithoutData = otherVC.interest
            
            arrayWithoutData.append("entertainment")
            let firstElement = arrayWithoutData.first
            print(firstElement)
        }
        else if entertainmentButton.backgroundColor == UIColor.yellow {
            entertainmentButton.backgroundColor = UIColor.clear
        }
    }
    
    
    
    @IBAction func pressTechnology(_ sender: Any) {
        if techButton.backgroundColor == UIColor.clear {
            techButton.backgroundColor = UIColor.yellow
            
            // Append the user's name to an inrerest array
            let otherVC = RegisterViewController()
            arrayWithoutData = otherVC.interest
            
            arrayWithoutData.append("technology")
            let firstElement = arrayWithoutData.first
            print(firstElement)
        }
        else if techButton.backgroundColor == UIColor.yellow {
            techButton.backgroundColor = UIColor.clear
        }
    }
    
    
    @IBAction func pressPolitics(_ sender: Any) {
        if politicsButton.backgroundColor == UIColor.clear {
            politicsButton.backgroundColor = UIColor.yellow
            
            // Append the user's name to an inrerest array
            let otherVC = RegisterViewController()
            arrayWithoutData = otherVC.interest
            
            arrayWithoutData.append("politics")
            let firstElement = arrayWithoutData.first
            print(firstElement)
        }
        else if politicsButton.backgroundColor == UIColor.yellow {
            politicsButton.backgroundColor = UIColor.clear
        }
    }
    
    
    @IBAction func pressFashion(_ sender: Any) {
        if fashionButton.backgroundColor == UIColor.clear {
            fashionButton.backgroundColor = UIColor.yellow
            
            // Append the user's name to an inrerest array
            let otherVC = RegisterViewController()
            arrayWithoutData = otherVC.interest
            
            arrayWithoutData.append("fashion")
            let firstElement = arrayWithoutData.first
            print(firstElement)
        }
        else if fashionButton.backgroundColor == UIColor.yellow {
            fashionButton.backgroundColor = UIColor.clear
        }
        
    }
    
    
    
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "tomainScreen" {
            if let dest = segue.destination as? RegisterViewController {
                dest.interest = self.arrayWithoutData
            }
        }
    }
    
    
    @IBAction func pressContinue(_ sender: Any) {
        
        let user = PFUser.current()
        user?.setObject(arrayWithoutData, forKey: "interests")
        user?.saveInBackground(block: { (success: Bool, error: Error?) in
            print("success")
            self.performSegue(withIdentifier: "tomainScreen", sender: nil)
        })
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
