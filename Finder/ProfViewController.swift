//
//  ProfViewController.swift
//  Finder
//
//  Created by Claire Chen on 7/28/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit
import Parse

class ProfViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Variables
    var user: PFUser?
    var timelinePosts: [PFObject]?
    
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
        
        //tableView
        tableView.delegate = self
        tableView.dataSource = self
        refresh()
        
        userLabel.text = user?.username
        //what shows up
        if (user != PFUser.current()) {
            segControl.isHidden = true
        }
        // Do any additional setup after loading the view.
    }
    
    func refresh(){
        let timeline: [PFObject] = user?.object(forKey: "timeline") as! [PFObject]
        timelinePosts = timeline
        //same for bookmarks
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timelinePosts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profCell", for: indexPath) as! ProfCell
        let timelinePost = timelinePosts![indexPath.row]
        cell.post = timelinePost as PFObject
        //do samething for bookmark
        return cell
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
