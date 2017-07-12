//
//  LoginViewController.swift
//  Finder
//
//  Created by Tyler Holloway on 7/11/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit
//import TextFieldEffects

class LoginViewController: UIViewController, UITextFieldDelegate {


    // MARK: Properties
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: UIFont(name: "AndaleMono", size: 34)!]

        // Do any additional setup after loading the view.
    }
    
    // Update the UI
    func updateUI () {

    }
    
    // Push keyboard down when background is pressed
    @IBAction func didPressBackground(_ sender: Any) {
        print("PUSH KEYBOARD DOWN")
        view.endEditing(true)
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
