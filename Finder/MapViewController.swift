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

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    // MARK: Properties
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    let manager = CLLocationManager()
    
    
    
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        //getApiData()
    }
    
    
    /*
    func getApiData() {
        let url = URL(string: "https://api.openaq.org/v1/countries")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("Error")
            } else {
                if let content = data {
                    do {
                        // Convert JSon into an array that we can work with
                        let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! AnyObject
                        let d = json["results"] as! NSDictionary
                        print(d)
                        
                        if let count = d["United States"] {
                            print(count)
                        }
          
                    } catch {
                        
                    }
                }
            }
        }
        
        task.resume()
    }
    
   */
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
