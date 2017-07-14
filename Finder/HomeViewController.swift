//
//  HomeViewController.swift
//  Finder
//
//  Created by Claire Chen on 7/13/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit
import Koloda

private var numberOfCards: Int = 3

func textToImage(drawText: NSString, inImage: UIImage, atPoint:CGPoint) -> UIImage{
    
    // Setup the font specific variables
    let textColor: UIColor = UIColor.white
    let textFont: UIFont = UIFont(name: "Helvetica Bold", size: 17)!
    
    //Setup the image context using the passed image.
    UIGraphicsBeginImageContext(inImage.size)
    
    //Setups up the font attributes that will be later used to dictate how the text should be drawn
    let textFontAttributes = [
        NSFontAttributeName: textFont,
        NSForegroundColorAttributeName: textColor,
        ]
    
    //Put the image into a rectangle as large as the original image.
    inImage.draw(in: CGRect(x: 0, y: 0, width: inImage.size.width, height: inImage.size.height))
    
    // Creating a point within the space that is as bit as the image.
    let rect: CGRect = CGRect(x: atPoint.x, y: atPoint.y, width: inImage.size.width, height: inImage.size.height)
    
    //Now Draw the text into an image.
    drawText.draw(in: rect, withAttributes: textFontAttributes)
    
    // Create a new image out of the images we have created
    let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    
    // End the context now that we have the image we need
    UIGraphicsEndImageContext()
    
    //And pass it back up to the caller.
    return newImage
}

class HomeViewController: UIViewController {
    
    @IBOutlet var kolodaView: KolodaView!
    
    fileprivate var dataSource: [UIImage] = {
        var array: [UIImage] = []
        for index in 0..<numberOfCards {
            let base = UIImage(named: "Card_like")
            let point = CGPoint(x: 10, y: 10)
            let str = "So many things to say!!!! \(index)" as NSString
            array.append(textToImage(drawText: str, inImage: base!, atPoint: point))
            //array.append(UIImage(named: "Card_like_\(index + 1)")!)
            
        }
        
        return array
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kolodaView.dataSource = self
        kolodaView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    // MARK: IBActions
    
//    @IBAction func leftButtonTapped() {
//        kolodaView?.swipe(.left)
//    }
//    
//    @IBAction func rightButtonTapped() {
//        kolodaView?.swipe(.right)
//    }
//    
//    @IBAction func undoButtonTapped() {
//        kolodaView?.revertAction()
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

// MARK: KolodaViewDelegate

extension HomeViewController: KolodaViewDelegate {
    
//    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
//        let position = kolodaView.currentCardIndex
//        for i in 1...3 {
//            dataSource.append(UIImage(named: "Card_like_\(i)")!)
//        }
//        kolodaView.insertCardAtIndexRange(position..<position + 3, animated: true)
//    }
    
//    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
//        UIApplication.shared.openURL(URL(string: "https://yalantis.com/")!)
//    }
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        print(direction)
    }
}

// MARK: KolodaViewDataSource

extension HomeViewController: KolodaViewDataSource {
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return dataSource.count
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .default
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        return UIImageView(image: dataSource[Int(index)])
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return Bundle.main.loadNibNamed("OverlayView", owner: self, options: nil)?[0] as? OverlayView
    }
}


