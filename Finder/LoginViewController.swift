//
//  LoginViewController.swift
//  Finder
//
//  Created by Tyler Holloway on 7/11/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit
import Parse



class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    // MARK: Properties
    @IBOutlet weak var gifView: UIImageView!
    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var ForgotPasswordButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        loadGif()
        updateUI()
    }
    
    func loadGif() {
        gifView.loadGif(name: "login")
    }
    
    func updateUI() {
        // Make placeholder text white
        usernameLabel.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("Username", comment: "This is the username"), attributes: [NSForegroundColorAttributeName: UIColor.white])
        
        passwordLabel.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("Password", comment: "This is the password"), attributes: [NSForegroundColorAttributeName: UIColor.white])
        
        loginButton.setTitle(NSLocalizedString("Login", comment: "Login button"), for: .normal)
        
        createAccountButton.setTitle(NSLocalizedString("CreateAccount", comment: "Create account button title"), for: .normal)
        
        ForgotPasswordButton.setTitle(NSLocalizedString("ForgotPassword", comment: "Forgot password button title"), for: .normal)
        
        
        // make corners round
        usernameLabel.layer.cornerRadius = 10
        usernameLabel.layer.masksToBounds = true
        usernameLabel.layer.borderWidth = 1
        usernameLabel.layer.borderColor = UIColor.white.cgColor
        
        passwordLabel.layer.cornerRadius = 10
        passwordLabel.layer.masksToBounds = true
        passwordLabel.layer.borderWidth = 1
        passwordLabel.layer.borderColor = UIColor.white.cgColor
        
        loginButton.layer.cornerRadius = 10
        loginButton.layer.masksToBounds = true
        
    }
    
    // Login User with Parse Authentication
    @IBAction func pressLogin(_ sender: Any) {
        
        PFUser.logInWithUsername(inBackground: usernameLabel.text!, password: passwordLabel.text!) { (user: PFUser?, error: Error?) in
            if user != nil {
                print("You're logged in!")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
        
    }
    
    @IBAction func pushKeyboardDown(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
