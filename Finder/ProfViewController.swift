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
    var bookmarkPosts: [PFObject]?
    
    //Outlets
    @IBOutlet var userLabel: UILabel!
    @IBOutlet var segControl: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var followingLabel: UILabel!
    @IBOutlet var followersLabel: UILabel!
    @IBOutlet var followButton: UIButton!
    
    
    @IBAction func onFollow(_ sender: Any) {
        //backend
        let curUser = PFUser.current()
        var curFollowing: [PFUser] = curUser?.object(forKey: "following") as! [PFUser]
        if !followButton.isSelected {
            //follow user
            //add user to curUser's following
            curFollowing.append(user!)
            curUser?.setObject(curFollowing, forKey: "following")
            //save
            //Create Request
            Request.postRequest(reciever: user!, withCompletion: { (success: Bool, error: Error?) in
                if success{
                    print("requested")
                }
            })
            curUser?.saveInBackground(block: { (success: Bool, error: Error?) in
                //added to followers
                if success {
                    print ("added followers")
                } else {
                    print("errorororororro")
                }
            })
            followButton.isSelected = true
        }
    }
    
    @IBAction func onDone(_ sender: Any) {
        self.dismiss(animated: true) {
            //eyyy close
        }
    }
    
    @IBAction func onSwitch(_ sender: Any) {
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView
        tableView.delegate = self
        tableView.dataSource = self
        refresh()
        
        userLabel.text = user?.username
        let followers: [PFObject] = user?.object(forKey: "followers") as! [PFObject]
        followersLabel.text = "\(followers.count)"
        let following: [PFObject] = user?.object(forKey: "following") as! [PFObject]
        followingLabel.text = "\(following.count)"
        
        //what shows up
        if (user?.objectId == PFUser.current()?.objectId){
            followButton.isHidden = true
        } else {
            segControl.isHidden = true
            //set initial state of follow button
            let curUser = PFUser.current()
            let following: [PFObject] =  curUser?.object(forKey: "following") as! [PFObject]
            var isFollowing = false
            for f in following {
                print(f)
                if f.objectId == user?.objectId {
                    isFollowing = true
                    followButton.isSelected = true
                    print("is following")
                }
            }
            if !isFollowing{
                print("not following")
                followButton.isSelected = false
            }
        }
        // Do any additional setup after loading the view.
    }
    
    func refresh(){
        let timeline: [PFObject] = user?.object(forKey: "timeline") as! [PFObject]
        var temp: [PFObject] = []
        for t in timeline {
            let query = PFQuery(className: "Fact")
            query.whereKey("objectId", equalTo: t.objectId)
            query.limit = 1
            query.findObjectsInBackground(block: { (timelines: [PFObject]?, error: Error?) in
                if let timelines = timelines {
                    temp.append(timelines[0])
                    self.tableView.reloadData()
                    self.timelinePosts = temp
                }
            })
        }
        //same for bookmarks
        let bookmark: [PFObject] = user?.object(forKey: "bookmarks") as! [PFObject]
        var temporary: [PFObject] = []
        for b in bookmark {
            let query = PFQuery(className: "Fact")
            query.whereKey("objectId", equalTo: b.objectId)
            query.limit = 1
            query.findObjectsInBackground(block: { (bookmarks: [PFObject]?, error: Error?) in
                if let bookmarks = bookmarks {
                    temporary.append(bookmarks[0])
                    self.tableView.reloadData()
                    self.bookmarkPosts = temporary
                }
            })
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segControl.selectedSegmentIndex == 0 {
            return timelinePosts?.count ?? 0
        } else {
            return bookmarkPosts?.count ?? 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profCell", for: indexPath) as! ProfCell
        if segControl.selectedSegmentIndex == 0 {
            let timelinePost = timelinePosts![indexPath.row]
            cell.post = timelinePost as PFObject
        } else if segControl.selectedSegmentIndex == 1 {
            //bookmarks
            let bookmarkPost = bookmarkPosts![indexPath.row]
            cell.post = bookmarkPost as PFObject
        }
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
