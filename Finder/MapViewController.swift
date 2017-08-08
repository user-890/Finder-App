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
    
    
    func didPanTray(_ gestureRecognizer: UIPanGestureRecognizer) {
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
                    self.trayView.center.y = (self.view.bounds.size.height) + 80
                    self.trayAtBottom = true
                })
            }
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPanTray(_:)))
        self.trayView.addGestureRecognizer(gestureRecognizer)
        trayView.center.y = (view.bounds.size.height) + 80
        
        trayView.layer.cornerRadius = 30
        trayView.layer.borderWidth = 5
        var ourGreen =  UIColor(red: 88/255, green: 115/255, blue: 60/255, alpha: 1)
        trayView.layer.borderColor = ourGreen.cgColor

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
