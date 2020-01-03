//
//  ViewController.swift
//  CoreLocation_MyTry
//
//  Created by Sai Venkata Pranay Boggarapu on 1/2/20.
//  Copyright © 2020 Sai Venkata Pranay Boggarapu. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,  CLLocationManagerDelegate {

    var locationManager = CLLocationManager()
    
    var location: CLLocation = CLLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
    }
    
    @IBAction func showMyLocation(_ sender: Any) {
        print("Fetch latest location called")
        
        let status = CLLocationManager.authorizationStatus()
        
        if status == .denied || status == .restricted {
            let alert = UIAlertController(title: "Denied", message: "Location Services restricted", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                self.dismiss(animated: true, completion: nil)
            }))
            show(alert, sender: self)
            return
        } else if !CLLocationManager.locationServicesEnabled() {
            let alert = UIAlertController(title: "Error", message: "Location Services not enabled", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                self.dismiss(animated: true, completion: nil)
            }))
            show(alert, sender: self)
            return
        } else if status == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
            return
        }
        
        locationManager.requestLocation()
        
//        locationManager.requestAlwaysAuthorization()
        //        //or use requestWhenInUseAuthorization()
        ////        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        ////        locationManager.startUpdatingLocation()
        ////        locationManager.allowsBackgroundLocationUpdates = true
        ////        locationManager.pausesLocationUpdatesAutomatically = false
    }
}

extension ViewController {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("Location Manager did change authorization status changed")
       let alert = UIAlertController(title: "Authorization Alert", message: "Authorization status changed", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        }))
        show(alert, sender: self)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Location Manager did UPdate function called")
        let alert = UIAlertController(title: "Location Update Alert", message: "Location updated \(String(describing: locations.last))", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        }))
        show(alert, sender: self)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location Manager did fail with error")
        let alert = UIAlertController(title: "Location Update Alert", message: "Location update failed \(error))", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        }))
        show(alert, sender: self)
        
        
    }
}

