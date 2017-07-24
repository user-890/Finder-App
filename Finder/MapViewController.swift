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
    
    // Array of articles
    //var arr = [Recommended]()
    let manager = CLLocationManager()
    var trayOriginalCenter: CGPoint!
    
    
    
    
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
                if let place = placemark?[0] {
                    if let checker = place.subThoroughfare {
                        self.addressLabel.text = "\(place.subThoroughfare!) \n \(place.thoroughfare!) \n \(place.country!)"
                    }
                }
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
        return 20
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellTwo = tableView.dequeueReusableCell(withIdentifier: "mapFact", for: indexPath) as! MapFactTableViewCell
        
        
        cellTwo.titleLabel.text = "The air quality is: Poor"
        
        return cellTwo
        
        
    }
    
    
    @IBAction func didPanTray(_ sender: UIPanGestureRecognizer) {
        var translation = sender.translation(in: view)
        print("translation \(translation)")
        
        if sender.state == UIGestureRecognizerState.began {
            trayOriginalCenter = trayView.center
            
        } else if sender.state == UIGestureRecognizerState.changed {
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
        } else if sender.state == UIGestureRecognizerState.ended {
            let velocity = sender.velocity(in: view)

            let trayDownOffset: CGFloat = 160
            let trayUp: CGPoint = trayView.center
            let trayDown = CGPoint(x: trayView.center.x ,y: trayView.center.y + trayDownOffset)
            
            
            if velocity.y > 0 {
                UIView.animate(withDuration: 0.3, animations: { () -> Void in
                    self.trayView.center = trayDown
                })
            } else {
                UIView.animate(withDuration: 0.3, animations: { () -> Void in
                    self.trayView.center = trayUp                 
                })
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        

        
        //getApiData()
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
