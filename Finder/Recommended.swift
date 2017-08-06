//
//  Recommended.swift
//  Finder
//
//  Created by Tyler Holloway on 7/19/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import Foundation

class Recommended {
    
    var Title: String;
    var sendURL: String;
    var PostImage: String;
    var desc: String;
    var publishedAt: String;
    
    init(Title: String, sendURL: String, PostImage: String, Desc: String, publishedAt: String)
    {
        
        self.Title = Title;
        self.sendURL = sendURL;
        self.PostImage = PostImage;
        self.desc = Desc
        self.publishedAt = publishedAt
        
        
    }
    
    
    class func get_data () -> [Recommended]
    {
        var posts = [Recommended]()
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
                    let imgParsedUrl = URL(string: imgUrl)!
                    let dataurl = items["url"]!;
                    let desc = items["description"]!;
                    //var img = UIImage()
                    let publishedAt = items["publishedAt"]

                    
                    let task2 = URLSession.shared.dataTask(with: imgParsedUrl as! URL) {(data,response,error) in
                        
                        if error != nil {
                            
                            print(error)
                            return
                        }
                        print(imgParsedUrl)
                        //img = UIImage(data: data!)!
                        //print(img)
                        
                        
                        
                    }
                    
                    task2.resume()
                    
                    
                    let NewPost = Recommended(Title: title as! String, sendURL: dataurl as! String, PostImage: imgUrl, Desc: desc as! String, publishedAt: publishedAt as! String)
                    posts.append(NewPost)
                }
                
            }
            catch let jError {
                
                print (jError)
                
            }
            
            
            
            
            
        }
        
        task.resume()
        
        
        return posts
    }
}

