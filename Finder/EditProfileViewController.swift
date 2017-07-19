//
//  EditProfileViewController.swift
//  Finder
//
//  Created by Tyler Holloway on 7/14/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage
import SDWebImage


class EditProfileViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var profileImageView: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var displayNameTextField: UITextField!
    @IBOutlet weak var bioTextField: UITextField!
    @IBOutlet weak var usernameLabel: UILabel!
    
    var databaseRef: DatabaseReference!
    var storageRef: StorageReference!
    
    

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        databaseRef = Database.database().reference()
        storageRef = Storage.storage().reference()
        
        
        
        databaseRef = Database.database().reference().child("Users")
        
        // Update usernameLabel
//        updateProfile()
        
    }
        
//     func updateProfile(){
//        let user: ourUser
//        
//            //generating a new key inside artists node
//            //and also getting the generated key
//            let key = databaseRef.childByAutoId().key
//            
//            //creating artist with the given values
//            
//        
//        
//            //adding the artist inside the generated unique key
//            databaseRef.child(key).setValue(user)
//        
//            usernameLabel.text = user.getUserName()
//            //displaying message
//            print("User was successfully added")
//        }
//        
//        
//    
//    
//    // Click on 'save profile' button
//    @IBAction func pressOnSaveProfile(_ sender: Any) {
//        
//        updateProfile()
//       
//    }

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





//        if let userID = Auth.auth().currentUser?.uid {
//            databaseRef.child("profile").child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
//                let dictionary = snapshot.value as? NSDictionary
//
//                let username = dictionary?["username"] as? String
//                if let profileImageURL = dictionary?["photo"] as? String {
//                    let url = URL(string: profileImageURL)
//
//                    // Grab the image
//                    URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
//                        if error != nil {
//                            print(error!)
//                            return
//                        }
//
////                        DispatchQueue.main.async {
////                            self.profileImageView.image = UIImage(data: data!)
////                        }
////
//                    })
//
//                        .resume()
//                }
//
//                self.usernameLabel.text = username
//            }) {
//                (error) in
//                print(error.localizedDescription)
//                return
//            }
//
//        }
//
//
//        loadProfileData()
//    }
//
//    func loadProfileData(){
//
//        //if the user is logged in get the profile data
//
//        if let userID = Auth.auth().currentUser?.uid{
//            databaseRef.child("profile").child(userID).observe(.value, with: { (snapshot) in
//
//                //create a dictionary of users profile data
//                let values = snapshot.value as? NSDictionary
//
//                //if there is a url image stored in photo
//                if let profileImageURL = values?["photo"] as? String{
//                    //using sd_setImage load photo
//                    //self.profileImageView.sd_setImage(with: URL(string: profileImageURL))
//                }
//
//
//                self.usernameTextField.text = values?["username"] as? String
//
//
//                self.displayNameTextField.text = values?["display"] as? String
//
//
//                self.bioTextField.text = values?["bio"] as? String
//            })
//
//        }
//    }


