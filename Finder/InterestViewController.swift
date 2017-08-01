//
//  InterestViewController.swift
//  Finder
//
//  Created by Tyler Holloway on 8/1/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit
import Parse

class InterestViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var historyButton: RoundButton!
    @IBOutlet weak var sportsButton: RoundButton!
    @IBOutlet weak var entertainmentButton: RoundButton!
    @IBOutlet weak var techButton: RoundButton!
    @IBOutlet weak var politicsButton: RoundButton!
    
    var arrayWithoutData = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
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
        }
        else if sportsButton.backgroundColor == UIColor.yellow {
            sportsButton.backgroundColor = UIColor.clear
        }
        
    }
    
    
    @IBAction func pressEntertainment(_ sender: Any) {
        if entertainmentButton.backgroundColor == UIColor.clear {
            entertainmentButton.backgroundColor = UIColor.yellow
        }
        else if entertainmentButton.backgroundColor == UIColor.yellow {
            entertainmentButton.backgroundColor = UIColor.clear
        }
    }
    
    
    
    @IBAction func pressTechnology(_ sender: Any) {
        if techButton.backgroundColor == UIColor.clear {
            techButton.backgroundColor = UIColor.yellow
        }
        else if techButton.backgroundColor == UIColor.yellow {
            techButton.backgroundColor = UIColor.clear
        }
    }
    
    
    @IBAction func pressPolitics(_ sender: Any) {
        if politicsButton.backgroundColor == UIColor.clear {
            politicsButton.backgroundColor = UIColor.yellow
        }
        else if politicsButton.backgroundColor == UIColor.yellow {
            politicsButton.backgroundColor = UIColor.clear
        }
    }
    
    
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "mainScreen" {
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
            self.performSegue(withIdentifier: "mainScreen", sender: nil)
        })

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

        


















