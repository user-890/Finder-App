//
//  ProfileViewController.swift
//  Finder
//
//  Created by Tyler Holloway on 7/11/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit
import Firebase
//import FirebaseStorage
//import FirebaseDatabase

class ProfileViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var profileCoverImage: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var outlineView: UIView!
    
    //var databaseRef: DatabaseReference!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        // Establish connection to database
//        databaseRef = Database.database().reference()
//        
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
//                        DispatchQueue.main.async {
//                            self.profileImageView.image = UIImage(data: data!)
//                        }
//                        
//                    })
//                        
//                    .resume()
//                }
//                
//               self.usernameLabel.text = username
//            }) {
//                (error) in
//                print(error.localizedDescription)
//                return
//            }
        
//      }

        // Update the UI
        updateUI()
    
    }

    
    func updateUI() {
        // Maker profile picture circular
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.layer.masksToBounds = true 
        
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

