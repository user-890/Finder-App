//
//  TimelineViewController.swift
//  Finder
//
//  Created by Tyler Holloway on 7/11/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit


class TimelineViewController: UITableViewController {
    
    // MARK: Properties
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var mapButton: UIBarButtonItem!
    
    
    // Array of articles
    var arr = [Recommended]()
    // Destination to full article
    var dest_url : String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up delegates
        //self.tableview.delegate = self
        self.tableview.dataSource = self
        
        get_data()
        sideMenus()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr.count - 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recommended", for: indexPath) as! RecommendedTableViewCell
        
        
        cell.recommend = arr[indexPath.row]
        
        return cell
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
                        self.tableview.reloadData()
                        
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
    
    
//    // Segue to full article
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        if (segue.identifier == "webSeg") {
//            
//            
//            let viewController = segue.destination as! FullArticleViewController
//            viewController.dest_url = dest_url
//        }
//    }
    
    // Implement side menu
    func sideMenus() {
        
        if revealViewController() != nil {
            
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 300
            
            
            mapButton.target = revealViewController()
            mapButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
    }
    
    
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
