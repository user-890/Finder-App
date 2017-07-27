//
//  MenuViewController.swift
//  Finder
//
//  Created by Tyler Holloway on 7/26/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    // MARK: Properties
    @IBOutlet weak var tableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageRecognition") as! ImageRecognitionTableViewCell

            return cell
            
            
        } else {
            
            
            
            let cellTwo = tableView.dequeueReusableCell(withIdentifier: "textRecognition", for: indexPath) as! TextRecognitionTableViewCell
            
            
            return cellTwo
            
            
            
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
