//
//  ("ViewController.swift
//  Finder
//
//  Created by Claire Chen on 7/13/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit
import Koloda
import Parse
import KRProgressHUD

func randomColor() -> UIColor {
    let randomRed:CGFloat = CGFloat(arc4random_uniform(256))
    let randomGreen:CGFloat = CGFloat(arc4random_uniform(256))
    let randomBlue:CGFloat = CGFloat(arc4random_uniform(256))
    return UIColor(red:   randomRed/255,
                   green: randomGreen/255,
                   blue:  randomBlue/255,
                   alpha: 1.0)
}



func textToImage(drawText: NSString, inImage: UIImage, atPoint:CGPoint) -> UIImage{
    
    // Setup the font specific variables
    let textColor: UIColor = UIColor(red: 220/255, green: 255/255, blue: 253/255, alpha: 1)
    let textFont: UIFont = UIFont(name: "Helvetica Bold", size: 25)!
    let paraStyle = NSMutableParagraphStyle()
    
    //Setup the image context using the passed image.
    UIGraphicsBeginImageContext(inImage.size)
    
    //alignment
    paraStyle.alignment = .center
    
    //Setups up the font attributes that will be later used to dictate how the text should be drawn
    let textFontAttributes = [
        NSFontAttributeName: textFont,
        NSForegroundColorAttributeName: textColor,
        NSParagraphStyleAttributeName: paraStyle
    ]
    
    //Put the image into a rectangle as large as the original image.
    inImage.draw(in: CGRect(x: 0, y: 0, width: inImage.size.width, height: inImage.size.height))
    
    // Creating a point within the space that is as bit as the image.
    _ = drawText.size(attributes: textFontAttributes)
    //let textRect = CGRect(x: inImage.size.width / 2 - textFont.width / 2, y: 0,
    //                      width: inImage.size.width / 2 + textSize.width / 2, height: inImage.size.height - textFont.height)
    let rect: CGRect = CGRect(x: atPoint.x, y: atPoint.y, width: inImage.size.width-10, height: inImage.size.height)
    
    
    //Now Draw the text into an image.
    drawText.draw(in: rect, withAttributes: textFontAttributes)
    
    // Create a new image out of the images we have created
    let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    
    // End the context now that we have the image we need
    UIGraphicsEndImageContext()
    
    //And pass it back up to the caller.
    return newImage
}

//Function to create facts
func makeFacts(){
    let s = "http://naruhodo.jp.net/why-all-cellphones-camera-in-japan-shipped-with-shutter-sound/"
    let t = "Phones sold in Japan permanently have the shutter sound turned on so as to deter up-skirt photogtaphy."
    let r = "tech"
    let n = 14
    Fact.postFact(source: s, related: r, num: n, withCaption: t) { (success: Bool, error: Error?) in
        if success {
            print("saved correctly")
        } else {
            print("nope")
        }
    }
}

func getFacts(seenFacts: inout [Int]) -> [PFObject] {
    let lim = 15 //how many facts
    var facts: [PFObject] = []
    var cur: [Int] = []
    //makeFacts()
    for index in 1...5{
        var n = Int(arc4random_uniform(UInt32(lim))) //0-14 inclusive
        if seenFacts.count + cur.count != 15 {
            while seenFacts.contains(n) {
                n += 1
                if n == (lim - 1){
                    n = 0
                }
            }
            while cur.contains(n) {
                n += 1
                if n == (lim - 1){
                    n == 0
                }
            }
            cur.append(n)
            seenFacts.append(n)
        }
    }
    KRProgressHUD.show()
    for i in cur {
        let query = PFQuery(className: "Fact")
        print(i)
        query.whereKey("fact_id", equalTo: i)
        //query.addDescendingOrder("createdAt")
        //query.limit = 5
        //syncronous fetch
        do {
            let res = try query.findObjects()
            facts.append(contentsOf: res)
            print("get facts succes")
        } catch {
            print("error")
        }
    }
    //    query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
    //        if error == nil {
    //            facts = posts!
    //            print("all is well")
    //        } else {
    //            print(error ?? "ERROR")
    //        }
    //
    //    }
    KRProgressHUD.dismiss()
    return facts
    
}

class HomeViewController: UIViewController {
    
    //Helpers
    var seen: [Int] = []
    
    //Outlet
    @IBOutlet var kolodaView: KolodaView!
    
    //Variables
    var facts: [PFObject] = []
    fileprivate var dataSource: [UIImage] = []
    
    func createImages(facts:[PFObject]) -> [UIImage] {
        var array: [UIImage] = []
        print(facts.count)
        for index in 0..<facts.count {
            let base = UIImage(named: "mockcard")
            let point = CGPoint(x: 0, y: 0)
            let curFact: PFObject = facts[index]
            let str = curFact["fact"] as? NSString
            print("\(str) \(index)")
            array.append(textToImage(drawText: str!, inImage: base!, atPoint: point))
        }
        return array
    }
    
    //OnTap
    @IBAction func onReadMore(_ sender: Any) {
        self.performSegue(withIdentifier: "readMoreSegue", sender: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        facts = getFacts(seenFacts: &seen)
        dataSource = createImages(facts: facts)
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
    
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        print(seen)
        let newFacts = getFacts(seenFacts: &seen)
        //add new facts to facts
        facts.append(contentsOf: newFacts)
        let images = createImages(facts: newFacts)
        let position = kolodaView.currentCardIndex
        for image in images {
            dataSource.append(image)
        }
        kolodaView.insertCardAtIndexRange(position..<position + images.count, animated: true)
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        let fact = facts[index]
        UIApplication.shared.openURL(URL(string: fact["source"] as! String)!)
    }
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        let fact: PFObject = facts[index]
        if direction == .right {
            print("works")
            let curUser = PFUser.current()
            var curTimeline: [PFObject] = curUser?.object(forKey: "timeline") as! [PFObject]
            curTimeline.append(fact)
            curUser?.setObject(curTimeline, forKey: "timeline")
            curUser?.saveInBackground(block: { (success: Bool, error: Error?) in
                print("success")
                //chill
            })
            //insert post to array
            
        }
        //print(facts.count)
        //print(fact["fact"])
        //print(facts[index]["fact"])
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


