//
//  RequestViewController.swift
//  Finder
//
//  Created by Claire Chen on 8/4/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit
import Parse

class RequestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var requests = [PFObject]()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadRequests()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onDone(_ sender: Any) {
        self.dismiss(animated: true) {
            //done
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\(requests.count)")
        return requests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let requestCell = tableView.dequeueReusableCell(withIdentifier: "requestCell", for: indexPath) as! RequestCell
        requestCell.request = requests[indexPath.row]
        //requestCell.request = requests[indexPath.row]
        //userCell.textLabel!.text = userObject.object(forKey: "username") as? String
        
        return requestCell
    }
    
    func loadRequests() {
        let query = PFQuery(className: "Request")
        query.whereKey("reciever_id", equalTo: PFUser.current()?.objectId)
        query.includeKey("requestor")
        query.findObjectsInBackground { (result: [PFObject]?, error) in
            
            if let foundRequests = result as? [PFObject] {
                for found in foundRequests {
                    let verdict: Bool =  found["isAccepted"] as! Bool
                    if verdict == false {
                        self.requests.append(found)
                        print("yep")
                    }
                }
                self.tableView.reloadData()
            }
        }
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
