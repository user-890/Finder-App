//
//  TimelineViewController.swift
//  Finder
//
//  Created by Tyler Holloway on 7/11/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Change navigation bar title color
        
        updateUI()
    }
    
    func updateUI() {
        // Change font of navigation bar title
        //UINavigationBar.appearance().titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AndaleMono", size: 50)!]
        
        // Chaage the color of the nav bar title 
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
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
