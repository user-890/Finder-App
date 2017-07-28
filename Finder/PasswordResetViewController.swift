//
//  PasswordResetViewController.swift
//  Finder
//
//  Created by Tyler Holloway on 7/26/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit
import Parse

class PasswordResetViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var emailAddressTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        
        let emailAddress = emailAddressTextField.text
        
        if (emailAddress?.isEmpty)! {
            // Display warning message
            let userMessage: String = NSLocalizedString("userMessage", comment: "This is a message") //"Please type in your email address"
            return
        } else {
            resetPassword(email: emailAddress!)
        }
        
        
        
    }
    
    func resetPassword(email : String){
        
        // convert the email string to lower case
        let emailAddress = emailAddressTextField.text
        
        
        PFUser.requestPasswordResetForEmail(inBackground: emailAddress!) { (success, error) -> Void in
            if (error == nil) {
                let success = UIAlertController(title: "Success", message: NSLocalizedString("SuccessMessage", comment: "Message when password reset successful"), preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
                success.addAction(okButton)
                self.present(success, animated: false, completion: nil)
                
                
                
            }else {
                let alert = UIAlertController(title: "Alert", message: NSLocalizedString("AlertMessage", comment: "Alert user on fail"), preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true) {
            // Goes back to login?
        }
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
