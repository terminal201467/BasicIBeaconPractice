//
//  IBeaconManager.swift
//  BasicIBeaconPractice
//
//  Created by 辴 穆 on 2022/5/25.
//

import Foundation
import CoreBluetooth
import CoreLocation

class IBeaconManager:NSObject{
    
    //MARK: -Properties
    
    let locationManager = CLLocationManager()
    
    let region = CLBeaconRegion(uuid: UUID(uuidString: "")!, identifier: "")
    
    //MARK: -Intialization
    override init() {
        super.init()
        
        
    }
    
    //MARK: -Methods
    func setLocation(){
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
    }
}

extension IBeaconManager:CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFail:\(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        print("monitoringDidFailFor:\(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        guard region is CLBeaconRegion else { return }
        guard CLLocationManager.isRangingAvailable() else { return }
        manager.startRangingBeacons(satisfying: <#T##CLBeaconIdentityConstraint#>)
    }
    
}
