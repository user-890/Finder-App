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

private var numberOfCards: Int = 3

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
    let textColor: UIColor = randomColor() //UIColor.white
    let textFont: UIFont = UIFont(name: "Helvetica Bold", size: 26)!
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
    let textSize = drawText.size(attributes: textFontAttributes)
    //let textRect = CGRect(x: inImage.size.width / 2 - textFont.width / 2, y: 0,
    //                      width: inImage.size.width / 2 + textSize.width / 2, height: inImage.size.height - textFont.height)
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

//Function to create facts
func makeFacts(){
    //hardcoded 5 facts
    let s = "https://en.wikipedia.org/wiki/Knocker-up"
    let t = "Before there were alarm clocks, there were “knockers-up”, who were hired to shoot dried peas from a blow gun at people’s windows in order to wake them up in the morning."
    let r = "history"
    Fact.postFact(source: s, related: r, withCaption: t) { (success: Bool, error: Error?) in
        if success {
            print("saved correctly")
        } else {
            print("nope")
        }
    }
}

// Fetch the data from the API
func fetch_data()
{
    let apiurl = NSURL(string: "https://newsapi.org/v1/articles?source=the-next-web&sortBy=latest&apiKey=112947519e4a41e48da28e8c35965f7b");
    let task = URLSession.shared.dataTask(with: apiurl! as URL) {
        (data,response,error) in
        if error != nil {
            print (error)
            return
        }
        do {
            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: Any]
            let d = json["articles"] as! [[String: AnyObject]]
            print(d.count)
            for items in d
            {
                let title = items["title"]!
                //let imgUrl = items["urlToImage"]! as! String
                //let imgParsedUrl = URL(string: imgUrl)!
                let dataurl = items["url"]!;
//                Fact.postFact(source: dataurl as! String, withCaption: title as! String, withCompletion: { (success: Bool, error: Error?) in
//                    if success {
//                        print("saved correctely")
//                    } else {
//                        print("nah fam")
//                    }
//                })
                //let img = self.imageParsed(imgData: imgParsedUrl);
                print(title)
                
                //let NewPost = Recommended(Title: title as! String, sendURL: dataurl as! String, PostImage: imgUrl)
                //self.arr.append(NewPost)
                
                DispatchQueue.main.async {
                    //after 
                    print("doneeeeeee")
                    //self.tableview.reloadData()
                    
                }
            }
        }
        catch let jError {
            print (jError)
        }
        //let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
        //print(str)
    }
    task.resume()
}

func getFacts() -> [PFObject] {
    var facts: [PFObject] = []
    //fetch_data()
    //makeFacts()
    KRProgressHUD.show()
    let query = PFQuery(className: "Fact")
    query.addDescendingOrder("createdAt")
    query.limit = 5
    //syncronous fetch
    
    do {
        facts = try query.findObjects()
        print("get facts succes")
    } catch {
        facts = []
        print("error")
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
    
    //Outlet
    @IBOutlet var kolodaView: KolodaView!
    
    //Variables
    var facts: [PFObject] = []
    fileprivate var dataSource: [UIImage] = []
//    fileprivate var dataSource: [UIImage] = {
//        let facs = getFacts()
//        var array: [UIImage] = []
//        print(facs.count)
//        for index in 0..<facs.count {
//            let base = UIImage(named: "Card_like")
//            let point = CGPoint(x: 10, y: 10)
//            let curFact: PFObject = facs[index]
//            let str = curFact["fact"] as? NSString
//            print("\(str) \(index)")
//            array.append(textToImage(drawText: str!, inImage: base!, atPoint: point))
//        }
//        
//        return array
//    }()
    
    func createImages(facts:[PFObject]) -> [UIImage] {
        var array: [UIImage] = []
        print(facts.count)
        for index in 0..<facts.count {
            let base = UIImage(named: "Card_like")
            let point = CGPoint(x: 10, y: 10)
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
        
        facts = getFacts()
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
        print("in")
        let newFacts = getFacts()
        //add new facts to facts
        facts.append(contentsOf: newFacts)
        print("ok")
        let images = createImages(facts: newFacts)
        print("damn bbu")
        let position = kolodaView.currentCardIndex
        print("pos")
        for image in images {
            print("each")
            dataSource.append(image)
            print("appended")
        }
        print("tssss")
        kolodaView.insertCardAtIndexRange(position..<position + images.count, animated: true)
        print("done")
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        let fact = facts[index]
        UIApplication.shared.openURL(URL(string: fact["source"] as! String)!)
    }
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        print(direction)
        print(facts.count)
        let fact: PFObject = facts[index]
        print(fact["fact"])
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


