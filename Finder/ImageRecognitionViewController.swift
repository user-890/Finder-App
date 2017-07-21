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
    let apiKey = "700430452c908377738869e1218f70b469753899"
    let version = "2017-7-20"
    
    @IBOutlet weak var imageView: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func getImage(_ sender: Any) {
        
        // Disable user from pressing on button while the image is loading
        let button = sender as! UIBarButtonItem
        button.isEnabled = false
        
        let randomNumber = Int(arc4random_uniform(1000))
        let url = URL(string: "https://unsplash.it/400/700?image=\(randomNumber)")!
        
        imageView.af_setImage(withURL: url)
        
        let visualRecognition = VisualRecognition(apiKey: apiKey, version: version)
        
        let failure = {(error: Error) in
            
            DispatchQueue.main.async {
                self.navigationItem.title = "Image could not be processed"
                button.isEnabled = true
            }
            
            print(error)
            
        }
        
        let recogURL = URL(string: "https://unsplash.it/50/100?image=\(randomNumber)")!
        
        visualRecognition.classify(image: recogURL.absoluteString, failure: failure) { classifiedImages in
            
            if let classifiedImage = classifiedImages.images.first {
                print(classifiedImage.classifiers)
                
                if let classification = classifiedImage.classifiers.first?.classes.first?.classification {
                    DispatchQueue.main.async {
                        self.navigationItem.title = classification
                        button.isEnabled = true
                    }
                }
                
                
            }else{
                DispatchQueue.main.async {
                    self.navigationItem.title = "Could not be determined"
                    button.isEnabled = true
                }
            }
        }
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
