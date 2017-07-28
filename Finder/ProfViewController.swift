//
//  ProfViewController.swift
//  Finder
//
//  Created by Claire Chen on 7/28/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit
import Parse

class ProfViewController: UIViewController {
    
    //Variables
    var user: PFUser?
    
    //Outlets
    @IBOutlet var userLabel: UILabel!
    @IBOutlet var segControl: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    
    
    @IBAction func onDone(_ sender: Any) {
        self.dismiss(animated: true) { 
            //eyyy close
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userLabel.text = user?.username
        //what shows up
        if (user != PFUser.current()) {
            segControl.isHidden = true
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
