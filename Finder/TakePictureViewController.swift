//
//  TakePictureViewController.swift
//  Finder
//
//  Created by Tyler Holloway on 7/21/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit
import VisualRecognitionV3
import AlamofireImage

class TakePictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties
    @IBOutlet weak var myImageView: UIImageView!
    
    
    let picker = UIImagePickerController()
    let apiKey = "700430452c908377738869e1218f70b469753899"
    let version = "2017-7-20"
    
   
    
    
    func noCamera(){
        let alertVC = UIAlertController(
            title: "No Camera",
            message: "Sorry, this device has no camera",
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.default,
            handler: nil)
        alertVC.addAction(okAction)
        present(
            alertVC,
            animated: true,
            completion: nil)
    }
    
    @IBAction func shootPhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let vc = UIImagePickerController()
            vc.delegate = self
            vc.allowsEditing = false
            vc.sourceType = UIImagePickerControllerSourceType.camera
            print("Camera is available 📸")
            self.present(vc, animated: true, completion: nil)
        } else {
            print("Camera 🚫 available so we will use photo library instead")
            noCamera()
        }
    }
    
    @IBAction func photoFromLibrary(_ sender: UIBarButtonItem) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = false
        vc.sourceType = .photoLibrary
        self.present(vc, animated: true, completion: nil)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
 
        
    }
    
    // MARK: - Delegates
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            myImageView.image = image

            let visualRecognition = VisualRecognition(apiKey: apiKey, version: version)
            
            // Get the URL of the image that was picked
            let imageData = UIImageJPEGRepresentation(image, 0.01)
            
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            
            let fileURL = documentsURL.appendingPathComponent("tempImage.jpg")
            
            try? imageData?.write(to: fileURL, options: [])
            
            visualRecognition.classify(imageFile: fileURL) { (classifiedImages) in
                
                if let classifiedImage = classifiedImages.images.first {
                    print(classifiedImage.classifiers)
                    
                    if let classification = classifiedImage.classifiers.first?.classes.first?.classification {
                        DispatchQueue.main.async {
                            self.navigationItem.title = classification

                        }
                    }
                    
                    
                }else{
                    DispatchQueue.main.async {
                        self.navigationItem.title = "Could not be determined"

                    }
                }

            }
            
            dismiss(animated: true, completion: nil)
            
        }

        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
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
