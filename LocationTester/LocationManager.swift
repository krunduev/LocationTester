//
//  LocationManager.swift
//  LocationTester
//
//  Created by Kostyantyn Runduyev on 6/8/17.
//  Copyright © 2017 CuriousIT. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager : NSObject {
 
    static let sharedInstance = LocationManager()

    var locationManager = CLLocationManager()
    
    var userLocation : CLLocation?

    private override init() {
        super.init()
    }
    
    func startMonitoring() {
        
        locationManager.delegate = self
        
        locationManager.requestAlwaysAuthorization()
        
        if #available(iOS 9.0, *) {
            locationManager.allowsBackgroundLocationUpdates = true
        } else {
            // Fallback on earlier versions
        }
        
        // Новое
        locationManager.pausesLocationUpdatesAutomatically = false
        
        locationManager.startMonitoringSignificantLocationChanges()
        
        // Новое
        locationManager.startMonitoringVisits()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest

//        locationManager.distanceFilter = 10

        locationManager.startUpdatingLocation()

    }
    
    func stopMonitoring() {
        
    }
    


}

extension LocationManager : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations[0])
        
        userLocation = locations[0]
    }
    
}
