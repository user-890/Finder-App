//
//  SideMenuViewController.swift
//  Finder
//
//  Created by Claire Chen on 7/28/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit
import Parse

class SideMenuViewController: UIViewController {
    
    //Outlets
    @IBOutlet var userLabel: UILabel!
    @IBOutlet var profileButtonView: UIView!
    
    
    //Action
    @IBAction func onProfile(_ sender: Any) {
        performSegue(withIdentifier: "profileSegue", sender: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let curUser = PFUser.current()
        userLabel.text = curUser?.username as! String
        profileButtonView.layer.cornerRadius = 5
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profileSegue" {
            let vc = segue.destination as! ProfViewController
            vc.user = PFUser.current()
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
