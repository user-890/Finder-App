//
//  TimelineViewController.swift
//  Finder
//
//  Created by Tyler Holloway on 7/11/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
  

    override func viewDidLoad() {
        super.viewDidLoad()
        // Change navigation bar title color
        
        //set up delegates
        tableView.dataSource = self
        tableView.delegate = self
        
        updateUI()
    }
    
    // Push keyboard down when background is pressed
    
    
    
    func updateUI() {
        // Change font of navigation bar title
        UINavigationBar.appearance().titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AndaleMono", size: 50)!]
        
        // Chaage the color of the nav bar title 
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    var randomNum = Int ( arc4random_uniform(10) )
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % randomNum == 0 {
            
            let cellTwo = tableView.dequeueReusableCell(withIdentifier: "recommendedTableViewCell", for: indexPath) as! RecommendedTableViewCell
            
            return cellTwo
            
        }
        else {
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "postTableViewCell", for: indexPath) as! PostTableViewCell
            
            // Make profile image circular
            cell.profileImageView?.layer.cornerRadius = (cell.profileImageView?.frame.size.width)! / 2
            cell.profileImageView?.layer.masksToBounds = true
            
            // Make view outline black
            cell.postDetailView.layer.borderWidth = 0.50
            return cell

            }
            
        }
    

    
    
    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        if indexPath.row == 0 {
//            let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "postTableViewCell")
//            //cell.profileImageView?.layer.cornerRadius = (cell.profileImageView?.frame.size.width)! / 2
//            //cell.profileImageView?.layer.masksToBounds = true
//            return cell
//        }
//        else {
//            let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "recommendedTableViewCell")
//            //set the data here
//            return cell
//        }
//    }
//    
    
    




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
