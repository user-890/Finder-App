//
//  FullArticleViewController.swift
//  practiceLogin
//
//  Created by Tyler Holloway on 7/20/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit

class FullArticleViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var webView: UIWebView!
    
    var dest_url: String!

    override func viewDidLoad() {
        super.viewDidLoad()

    print("-------------------------------------------------------",dest_url)
        let articleurl = URL(string: dest_url)
        let article_request = URLRequest(url: articleurl!)
        webView.loadRequest(article_request)
     
        
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
