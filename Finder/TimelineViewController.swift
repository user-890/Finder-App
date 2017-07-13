//
//  TimelineViewController.swift
//  Finder
//
//  Created by Tyler Holloway on 7/11/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit
import Parse

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
        // Add two labels to navigation bar 
        if let navigationBar = self.navigationController?.navigationBar {
            // Center label
            let firstFrame = CGRect(x: 145, y: 0, width: navigationBar.frame.width/2, height: navigationBar.frame.height)
            
            let firstLabel = UILabel(frame: firstFrame)
            firstLabel.text = "FINDER"
            // Make label text white
            firstLabel.textColor = UIColor.white
            firstLabel.font = UIFont(name: "AndaleMono", size: 20)
            
            navigationBar.addSubview(firstLabel)
        }
    }
    

    override func viewWillAppear(_ animated: Bool) {
        // Change the color of the tab bar
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.tintColor = UIColor.white
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
//            cell.profileImageView?.layer.borderWidth = 1
            
            // Make view outline black
            cell.postDetailView.layer.borderWidth = 0.50
            return cell
            
            }
            
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
