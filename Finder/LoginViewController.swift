//
//  LoginViewController.swift
//  Finder
//
//  Created by Tyler Holloway on 7/11/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit
import Parse
//import Firebase
//import FirebaseAuth


class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    // MARK: Properties
    @IBOutlet weak var signInSelector: UISegmentedControl!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    
    var isSignIn: Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Loads FB login button
        //makeFacebookLoginButton()
        
        
    }
    
    /**********************************FACEBOOK LOGIN/REGISTER*******************************************/

    
//    
//    // Generate Facebook login button
//    func makeFacebookLoginButton() {
//        
//        // Get Facebook login button
//        let loginButton = FBSDKLoginButton()
//        view.addSubview(loginButton)
//        // Eventuall change with constraints
//        loginButton.frame = CGRect(x: 16, y: 450, width: view.frame.width - 32, height: 50)
//        
//        loginButton.delegate = self
//    }
//    
//    // Logout with Facebook
//    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
//        print("Did logout of Facebook")
//    }
//    
//    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
//        if error != nil {
//            print(error)
//            return
//        }
//        
//        print("Successfully logged in with Facebook")
//        
//    }
    
    
    /**********************************FACEBOOK LOGIN/REGISTER ENDS*******************************************/
    
    
    
    /**********************************PARSE LOGIN/REGISTER*******************************************/
    
//    // Registers the user
//    @IBAction func registerUser(_ sender: Any) {
//        //Initialize a user object
//        let newUser = PFUser()
//        
//        // set user properties
//        newUser.username = usernameTextField.text
//        newUser.password = passwordTextField.text
//        
//        // Call sign up function on the object
//        newUser.signUpInBackground { (success: Bool, error: Error?) in
//            if success {
//                print("Yay, registered new user!")
//                self.performSegue(withIdentifier: "loginSegue", sender: nil)
//            } else {
//                print(error?.localizedDescription)
//            }
//        }
//    }
//    
//    // Logins in user
//    @IBAction func loginUser(_ sender: Any) {
//        
//        PFUser.logInWithUsername(inBackground: usernameTextField.text!, password: passwordTextField.text!) { (user: PFUser?, error: Error?) in
//            if user != nil {
//                print("You're logged in!")
//                self.performSegue(withIdentifier: "loginSegue", sender: nil)
//            }
//        }
//    }
    
    
    /**********************************REGULAR LOGIN/REGISTER ENDS*******************************************/
    
    // Push keyboard down when background is pressed
    @IBAction func didPressBackground(_ sender: Any) {
        print("PUSH KEYBOARD DOWN")
        view.endEditing(true)
    }

    // Keep track of whether the user is signing in or registering
    @IBAction func signInSelectorChanged(_ sender: UISegmentedControl) {
        
        // Flip the boolean
        isSignIn = !isSignIn
        
        //Check the boolean and set the buttons and labels
        if isSignIn {
            signInLabel.text = "Sign In"
            signInButton.setTitle("Sign In", for: .normal)
        } else {
            signInLabel.text = "Register"
            signInButton.setTitle("Register", for: .normal)
        }
        
    }
    
    
//    @IBAction func signInButtonTapped(_ sender: Any) {
//        //TODO: Do some form validation on the email and password
//        
////        if emailTextField.text == "" {
////            let alertController = UIAlertController(title: "Error", message: "Please enter email and password", preferredStyle: .alert)
////            
////            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
////            alertController.addAction(defaultAction)
////            
////            present(alertController, animated: true, completion: nil)
////        } else {
////            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
////                
////                
////                if error == nil {
////                    print("You have successfully signed up")
////                    // Goes to main home screen
////                    
////                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "tabBarController")
////                }
////        }
//
//        if let email = emailTextField.text, let pass = passwordTextField.text {
//            
//            // Check if it's sign in or register
//            if isSignIn {
//                // Sign in user with Firebase
//                Auth.auth().signIn(withEmail: email, password: pass, completion: { (user, error) in
//                    
//                    //Check that user isn't nil
//                    if let u = user {
//                        // User is found, go to home screen
//                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "tabBarController")
//                        self.present(vc!, animated: true, completion: nil)
//                    } else {
//                        // Error: check error and show message 
//                        
//                    }
//                    
//                })
//            } else {
//                // Register the user with Firebase
//                Auth.auth().createUser(withEmail: email, password: pass, completion: { (user, error) in
//                    
//                    // Check that user isn't nil
//                    if let u = user {
//                        // User is found, go to home screen
//                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "tabBarController")
//                        self.present(vc!, animated: true, completion: nil)
//                    } else {
//                        // Error: check error and show message
//                    }
//                    
//                })
//            }
//            
//        }
//        
//        
//    }
    
    //@TODO
    @IBAction func pressOnSignUpButton(_ sender: Any) {
        if !isSignIn {
            /* FIREBASE SIGN IN CODE
            if self.emailTextField.text == "" || self.passwordTextField.text == "" {
                
                //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
                
                let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
 
            
            
            } else {
                
                Auth.auth().signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (user, error) in
                    
                    if error == nil {
                        
                        //Print into the console if successfully logged in
                        print("You have successfully logged in")
                        
                        //Go to the HomeViewController if the login is sucessful
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                        self.present(vc!, animated: true, completion: nil)
                        
                    } else {
                        
                        //Tells the user that there is an error and then gets firebase to tell them the error
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            }
        */
            //PARSE SIGN UP
            let newUser = PFUser()
            newUser.username = usernameTextField.text
            newUser.password = passwordTextField.text
            newUser.signUpInBackground(block: { (success: Bool, error: Error?) in
                if success {
                    //set default fields for PFUser
                    let icon = Fact.getPFFileFromImage(image: (UIImage(named: "Potrait1")))
                    let bookmarks:[Fact] = []
                    let follow:[PFUser] = []
                    newUser.setObject(newUser.username, forKey: "display_name")
                    newUser.setObject(icon, forKey: "profile_picture")
                    newUser.setObject(bookmarks, forKey: "bookmarks")
                    newUser.setObject(follow, forKey: "following")
                    newUser.setObject(follow, forKey: "followers")
                    newUser.saveInBackground(block: { (bool: Bool, error: Error?) in
                        if (bool != nil) {
                            //saved sucessfully
                            print("saved successfully!")
                        } else {
                            print("failed miserably")
                        }
                    })
                    print("signed up successfully")
                    self.usernameTextField.text = ""
                    self.passwordTextField.text = ""
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                } else {
                    //show alert
                    self.showAlert()
                    self.usernameTextField.text = ""
                    self.passwordTextField.text = ""
                    print("something went wrong with SignUpInBackground")
                }
            })
            
        
        } else {
            
            /* FIREBASE LOGIN CODE 
            if emailTextField.text == "" {
                let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                present(alertController, animated: true, completion: nil)
                
            } else {
                Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                    
                    if error == nil {
                        print("You have successfully signed up")
                        //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                        
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                        self.present(vc!, animated: true, completion: nil)
                        
                    } else {
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
                */
            //PARSE LOGIN
            PFUser.logInWithUsername(inBackground: usernameTextField.text!, password: passwordTextField.text!) { (user: PFUser?, error: Error?) in
                if (user != nil) {
                    //there exists such an user
                    self.usernameTextField.text = ""
                    self.passwordTextField.text = ""
                    print("Successfully logged in")
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                } else {
                    self.showAlert()
                    self.usernameTextField.text = ""
                    self.passwordTextField.text = ""
                    //show alert something is wrong
                }
                
            }
            
             }
        }
    
    func showAlert(){
        let alertController = UIAlertController(title: "Error", message: "Username or password incorrect", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
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
