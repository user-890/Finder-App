//
//  ImageRecognitionViewController.swift
//  Finder
//
//  Created by Tyler Holloway on 7/20/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit
import VisualRecognitionV3
import AlamofireImage

class ImageRecognitionViewController: UIViewController {
    
    // MARK: Properties
    let apiKey = ""
    let version = "2017-7-20"
    
    @IBOutlet weak var imageView: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func getImage(_ sender: Any) {
        
        let randomNumber = Int(arc4random_uniform(1000))
        let url = URL(string: "https://unsplash.it/400/700?image=\(randomNumber)")!
        
        imageView.af_setImage(withURL: url)
        
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
