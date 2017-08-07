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
import AVFoundation


class TakePictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet var popUpView: UIView!
    @IBOutlet weak var ourWebView: UIWebView!

    
    var effect: UIVisualEffect!
    
    var classifiedImagesArray: [String] = []
    
    let picker = UIImagePickerController()
    let apiKey = "700430452c908377738869e1218f70b469753899"
    let version = "2017-7-20"
    

    
    func noCamera(){
        let alertVC = UIAlertController(
            title: NSLocalizedString("NoCameraAlert", comment: "No camera available alert"),
            message: NSLocalizedString("CameraAlertMessage", comment: "Message on camera availability"),
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
        
        // Deactivate effect until tapped on
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        
        // Make corners of pop up round
        popUpView.layer.cornerRadius = 5
        
        //loadWebView()
        
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
 
                            //AVSpeechSynthesizer implementation
                            let className = self.navigationItem.title
                            
                            self.classifiedImagesArray.append(className!)
                            print(self.classifiedImagesArray[0])
                            
                            let utterance = AVSpeechUtterance(string: className!)
    
                            let speechLang = Bundle.main.preferredLocalizations.first! //get current language locale
                            
                            utterance.voice = AVSpeechSynthesisVoice(language: speechLang)
                            
                            let synthesizer = AVSpeechSynthesizer()
                            synthesizer.speak(utterance)
                            
                            
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
    
    // Get popUp View on the same view controller
    func animataeIn() {
        
        //let ourWebView = UIWebView()
        //self.view.addSubview(ourWebView)
        
        // Load the URL request
        
        
        var firstClassifiedImage = classifiedImagesArray[0]
        print(firstClassifiedImage)
        print(classifiedImagesArray.count)
        
//        var finalUrl: String = "https://en.wikipedia.org/wiki/\(firstClassifiedImage)"
//        print(finalUrl)
        
        
        var webUrl = URL(string: "https://\(Bundle.main.preferredLocalizations.first!).wikipedia.org/wiki/\(firstClassifiedImage)")!
        print(webUrl)
        
        
        if webUrl != nil && firstClassifiedImage != nil{
            print(webUrl)
            var webUrlRequest = URLRequest(url: webUrl)
            print(webUrlRequest)
            ourWebView.loadRequest(webUrlRequest)
            
        } else {
            
            
            print("Something's not right!")
        }
        
        
        
        
        
        //ourWebView.loadRequest(webUrlRequest)
        
        
        self.view.addSubview(popUpView)
        popUpView.center = self.view.center
        
        popUpView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        // Originally make the popView invisible
        popUpView.alpha = 0
        
        UIView.animate(withDuration: 0.4) { 
            self.visualEffectView.effect = self.effect
            self.popUpView.alpha = 1
            self.popUpView.transform = CGAffineTransform.identity
        }
    }
    
    
    
    func animateOut() {
        UIView.animate(withDuration: 0.3, animations: { 
            self.popUpView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.popUpView.alpha = 0
            
            self.visualEffectView.effect = nil
        }) { (success: Bool) in
            self.popUpView.removeFromSuperview()
        }
    }
   
    // Show PopUPViewController
    @IBAction func showPopUp(_ sender: Any) {
        
        animataeIn()
        
    }
    
    @IBAction func dismissPopUp(_ sender: Any) {
        
        animateOut()
        
    }
    
    
    
    
    
//    @IBAction func showPopUp(_ sender: Any) {
//        
//        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUp") as! PopUpViewController
//        // Adds the view controller of the popOverVC to our current view controller
//        self.addChildViewController(popOverVC)
//        popOverVC.view.frame = self.view.frame
//        self.view.addSubview(popOverVC.view)
//        popOverVC.didMove(toParentViewController: self)
//    }
//    
    
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
