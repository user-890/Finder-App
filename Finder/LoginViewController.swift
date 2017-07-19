//
//  LoginViewController.swift
//  Finder
//
//  Created by Tyler Holloway on 7/11/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase




class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    // MARK: Properties
    @IBOutlet weak var signInSelector: UISegmentedControl!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    
    var isSignIn: Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        
        
    }
    
    /**********************************FACEBOOK LOGIN/REGISTER*******************************************/

    
    
    
    
    // Generate Facebook login button
//    func makeFacebookLoginButton() {
//        
//        // Get Facebook login button
//        let loginButton = FBSDKLoginButton()
//        view.addSubview(loginButton)
//        
//        // EventuallY change with constraints
//        loginButton.frame = CGRect(x: 16, y: 450, width: view.frame.width - 32, height: 50)
//        
//        loginButton.delegate = self
//    }
    
    // Fetch user credentials
//    func facebookLogin() {
//        if let accessToken = FBSDKAccessToken.current {
//            let params = ["fields":"name,email"]
//            let graphRequest = graphRequest(graphPath: "me", parameters: params)
//            graphRequest.start { (urlResponse, requestResult) in
//                switch requestResult {
//                case .failed(let error):
//                    print(error)
//                case .success(let graphResponse):
//                    if let responseDictionary = graphResponse.dictionaryValue {
//                        UserDefaults.standard.set(responseDictionary, forKey: "userInfo")
//                    }
//                }
//            }
//        } else {
//        }
//    }
    
    
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
//    
    
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
    
    
    @IBAction func pressOnSignUpButton(_ sender: Any) {
        
        if isSignIn {
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
        } else {
            
            guard let email = emailTextField.text, let password = passwordTextField.text, let name = usernameTextField.text else {
                print("Form is not valid")
                return
            }
            
            if emailTextField.text == "" {
                let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                present(alertController, animated: true, completion: nil)
                
            } else {
                Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                    
                    
                    if error != nil {
                        
                        
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion: nil)
                        
                        
                        return
                    }
                    
                    
                    guard let uid = user?.uid else {
                        return
                    }
                    
                    
                    // Succesfull authenticated the user
                    let ref = Database.database().reference(fromURL: "https://finder-e44b3.firebaseio.com/")
                    let userReference = ref.child("Users").child((user?.uid)!)
                    let values = ["name": name, "email": email, "password": password]
                    userReference.updateChildValues(values, withCompletionBlock: { (error, ref) in
                    
                        if let error = error {
                            print(error)
                            return
                        }
                        
                        print("Saved user successfully into Firebase db")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                        self.present(vc!, animated: true, completion: nil)
    
                    })
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
