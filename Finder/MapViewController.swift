//
//  MapViewController.swift
//  Finder
//
//  Created by Tyler Holloway on 7/12/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate {
    
    
    
    
    // MARK: Properties
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet var trayView: UIView!
    @IBOutlet weak var addressLabel: UILabel!
    
    var trayOriginalCenter: CGPoint!
    var startLocation: CGPoint!
    var trayAtBottom = true
    
    // Array of Facts about FB
    var facts = [String]()
    
//    let manager = CLLocationManager()
    
    
    
    // Update locationw whenever the user moves
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        mapView.setRegion(region, animated: true)
        
        
        CLGeocoder().reverseGeocodeLocation(location) { (
            placemark, error) in
            if error != nil {
                print("An error has occurred")
            } else {
                // See if there's content int he placemark variable
//                if let place = placemark?[0] {
//                    if let checker = place.subThoroughfare {
//                        self.addressLabel.text = "\(place.subThoroughfare!) \n \(place.thoroughfare!) \n \(place.country!)"
//                    }
//                }
                
                print("It worked")
            }
        }
    }
    

    
    
    // MARK: - Table view data source
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return facts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mapFact", for: indexPath) as! MapFactTableViewCell
        
        
        cell.factLabel.text = facts[indexPath.row]
        
        //cell.textLabel?.text = facts[indexPath.row]
        
        return cell
        
        
    }
    
    
    @IBAction func didPanTray(_ gestureRecognizer: UIPanGestureRecognizer) {
        var translation = gestureRecognizer.translation(in: trayView)
        //print("translation \(translation)")
        //print("contentView \(contentView.center)")
        let velocity = gestureRecognizer.velocity(in: trayView)
        if gestureRecognizer.state == UIGestureRecognizerState.began {
            trayOriginalCenter = trayView.center
            
        } else if gestureRecognizer.state == UIGestureRecognizerState.changed {
            if (trayAtBottom && velocity.y > 0) || (!trayAtBottom && velocity.y < 0){
                //do nnothing
            } else {
                trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
            }
        } else if gestureRecognizer.state == UIGestureRecognizerState.ended {
            if velocity.y < 0{ //swipe up
                UIView.animate(withDuration: 0.3, animations: {
                    self.trayView.center = self.view.center
                    self.trayAtBottom = false
                })
                
            } else { //swipe down
                UIView.animate(withDuration: 0.3, animations: {
                    self.trayView.center.y = (self.view.bounds.size.height) + 60
                    self.trayAtBottom = true
                })
            }
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        manager.delegate = self
//        manager.desiredAccuracy = kCLLocationAccuracyBest
//        manager.requestWhenInUseAuthorization()
//        manager.startUpdatingLocation()
        

        //let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPanTray(_:)))
        //self.trayView.addGestureRecognizer(gestureRecognizer)
        //trayView.center.y = (view.bounds.size.height) + 80
        
        trayView.layer.cornerRadius = 30
        trayView.layer.borderWidth = 5
        var ourGreen =  UIColor(red: 249/255, green: 208/255, blue: 16/255, alpha: 1)
        trayView.layer.borderColor = ourGreen.cgColor
        
        facts = ["Approximately 83.6 percent of these daily active users are outside the United States and Canada"," In September 2015, Facebook introduced immersive 360-degree videos to users' News Feeds.", "The company estimates that it has an average of 1.18 billion daily active users.", "There are 15,724 employees at Facebook, and it is headquartered in Menlo Park, California.", "There are about 3 billion internet users worldwide."]

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
