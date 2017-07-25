//
//  ComposeFactViewController.swift
//  Finder
//
//  Created by Tyler Holloway on 7/23/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit

class ComposeFactViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var factTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressPost(_ sender: Any) {
        
        Post.postUserImage(caption: factTextField.text) { (success: Bool, error: Error?) in
            if success {
                print("successfully posted!")
            } else if let error = error {
                print(String(describing: error.localizedDescription))
            }
        }
        self.dismiss(animated: true, completion: nil)
        
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
