//
//  TimelineViewController.swift
//  Finder
//
//  Created by Tyler Holloway on 7/11/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit
import Firebase

class TimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    
//    // Array for articles
//    final let urlString = "https://newsapi.org/v1/articles?source=buzzfeed&sortBy=top&apiKey=dac06852b2574464ad33ca8902bcb418"
//
//    var author = [String]()
//    var title = [String]()
//    var desc = [String]()
//    var url = [String]()
//    var urlToImage = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Change navigation bar title color
        
        //set up delegates
        tableView.dataSource = self
        tableView.delegate = self
        
        
        updateUI()
    }
    
    
    
    func fetchArticles() {
        let urlRequest = URLRequest(url: URL(string: "https://newsapi.org/v1/articles?source=buzzfeed&sortBy=top&apiKey=dac06852b2574464ad33ca8902bcb418")!)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            self.articles = [Article]()
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                if let articlesFromJson = json["articles"] as? [[String: AnyObject]] {
                    for articleFromJson in articlesFromJson
                }
            }
            
        }
    }
    
    
    
    
//    
//    
//    func downloadJsonWithURL() {
//        let url = NSURL(string: urlString)
//        URLSession.shared.dataTask(with: (url as? URL)!, completionHandler: {(data, response, error) -> Void in
//            
//            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
//                print(jsonObj!.value(forKey: "actors"))
//                
//                if let articleArray = jsonObj!.value(forKey: "actors") as? NSArray {
//                    for article in articleArray{
//                        if let articleDict = article as? NSDictionary {
//                            if let name = articleDict.value(forKey: "title") {
//                                self.title.append(name as! String)
//                            }
//                            if let name = articleDict.value(forKey: "description") {
//                                self.desc.append(name as! String)
//                            }
//                            if let name = articleDict.value(forKey: "author") {
//                                self.author.append(name as! String)
//                            }
//                            if let name = articleDict.value(forKey: "url") {
//                                self.url.append(name as! String)
//                            }
//                            if let name = articleDict.value(forKey: "urlToImage") {
//                                self.urlToImage.append(name as! String)
//                            }
//                            
//                        }
//                    }
//                }
//                
//                OperationQueue.main.addOperation({
//                    self.tableView.reloadData()
//                })
//            }
//        }).resume()
//    }
//    
//    func downloadJsonWithTask() {
//        
//        let url = NSURL(string: urlString)
//        
//        var downloadTask = URLRequest(url: (url as? URL)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 20)
//        
//        downloadTask.httpMethod = "GET"
//        
//        URLSession.shared.dataTask(with: downloadTask, completionHandler: {(data, response, error) -> Void in
//            
//            let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
//            
//            print(jsonData)
//            
//        }).resume()
//    }
//
//    
    


//    func fetchArticles(){
//        let urlRequest = URLRequest(url: URL(string: "https://newsapi.org/v1/articles?source=techcrunch&sortBy=top&apiKey=64872d87c2ca48f08e3d576a77a3f252")!)
//        
//        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
//            
//            if error != nil {
//                print(error)
//                return
//            }
//            
//            self.articles = [Article]()
//            do {
//                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
//                
//                if let articlesFromJson = json["articles"] as? [[String : AnyObject]] {
//                    for articleFromJson in articlesFromJson {
//                        let article = Article()
//                        if let title = articleFromJson["title"] as? String, let author = articleFromJson["author"] as? String, let desc = articleFromJson["description"] as? String, let url = articleFromJson["url"] as? String, let urlToImage = articleFromJson["urlToImage"] as? String {
//                            
//                            article.author = author
//                            article.desc = desc
//                            article.headline = title
//                            article.url = url
//                            article.imageUrl = urlToImage
//                        }
//                        self.articles?.append(article)
//                    }
//                }
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//                
//            } catch let error {
//                print(error)
//            }
//            
//            
//        }
//        
//        task.resume()
//        
//    }
//    
    
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
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        if indexPath.row % 2 == 0 {
        //
        //            let cellTwo = tableView.dequeueReusableCell(withIdentifier: "recommendedTableViewCell", for: indexPath) as! RecommendedTableViewCell
        //
        //            return cellTwo
        //
        //        }
        //        else {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "postTableViewCell", for: indexPath) as! PostTableViewCell
        cell.newsLabel.text = self.articles?[indexPath.item].headline
        cell.descriptionLabel.text = self.articles?[indexPath.item].desc
        cell.articleAuthor.text = self.articles?[indexPath.item].author
        cell.imageView?.downloadImage(from: (self.articles?[indexPath.item].imageUrl!)!)
        
        
        
        // Make profile image circular
        cell.profileImageView?.layer.cornerRadius = (cell.profileImageView?.frame.size.width)! / 2
        cell.profileImageView?.layer.masksToBounds = true
        //            cell.profileImageView?.layer.borderWidth = 1
        
        return cell
        
        //}
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.articles?.count)!
    }
    
    var randomNum = Int ( arc4random_uniform(10) )
    
    

}


extension UIImageView {
    
    func downloadImage(from url: String){
        
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            
            if error != nil {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
}









