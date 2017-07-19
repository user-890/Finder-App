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
    

    var arr = [Recommended]()

  


    override func viewDidLoad() {
        super.viewDidLoad()
        // Change navigation bar title color
        
        //set up delegates
        tableView.dataSource = self
        tableView.delegate = self
        
        get_data()
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
        return arr.count - 1
    }
    
    var randomNum = Int ( arc4random_uniform(10) )
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            
            let cellTwo = tableView.dequeueReusableCell(withIdentifier: "recommendedTableViewCell", for: indexPath) as! RecommendedTableViewCell
            
            cellTwo.recommend = arr[indexPath.row]

            
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
    
    
    // Fetch the data from the API
    func get_data ()
    {
        let apiurl = NSURL(string: "https://newsapi.org/v1/articles?source=the-next-web&sortBy=latest&apiKey=112947519e4a41e48da28e8c35965f7b");
        let task = URLSession.shared.dataTask(with: apiurl! as URL) {
            
            
            (data,response,error) in
            
            if error != nil {
                print (error)
                return
                
            }
            
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: Any]
                let d = json["articles"] as! [[String: AnyObject]]
                print(d)
                for items in d
                {
                    let title = items["title"]!
                    let imgUrl = items["urlToImage"]! as! String
                    //let imgParsedUrl = URL(string: imgUrl)!
                    let dataurl = items["url"]!;
                    //let img = self.imageParsed(imgData: imgParsedUrl);
                    
                    
                    let NewPost = Recommended(Title: title as! String, sendURL: dataurl as! String, PostImage: imgUrl)
                    self.arr.append(NewPost)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        
                    }
                }
                
            }
            catch let jError {
                
                print (jError)
                
            }
            
            
            
            //let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            //print(str)
            
            
            
            
            
            
        }
        
        task.resume()
        
        
        
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
