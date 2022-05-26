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
    
    //the app monitored region
    let region = CLBeaconRegion(uuid: <#T##UUID#>, major: CLBeaconMajorValue , minor: <#T##CLBeaconMinorValue#>, identifier: "CGM Beacon")
    
    //the beacon constraint
    let beaconConstraint = CLBeaconIdentityConstraint(uuid: UUID(uuidString: "")!)
    
    //MARK: -Intialization
    override init() {
        super.init()
        setLocationManager()
    }
    
    //MARK: -Methods
    func setLocationManager(){
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }
    
    func startMonitoring(){
        locationManager.startMonitoring(for: region)
    }
}

extension IBeaconManager:CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFail:\(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        print("monitoringDidFailFor:\(error.localizedDescription)")
    }
    
    //MARK: -Beacon Enter or Exit the Region
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("BeaconEnterRegion")
        guard region is CLBeaconRegion else { return }
        guard CLLocationManager.isRangingAvailable() else { return }
        manager.startRangingBeacons(satisfying: beaconConstraint)
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("BeaconExitRegion")
        guard region is CLBeaconRegion else { return }
        guard CLLocationManager.isRangingAvailable() else { return }
        manager.stopRangingBeacons(satisfying: beaconConstraint)
    }
    
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        print("CheckTheBeaconRegion")
        manager.requestState(for: region)
    }
    
    //MARK: -Beacon region state
    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
        guard region is CLBeaconRegion else { return }
        switch state{
        case .inside:
            print("InsideTheRegion")
            if CLLocationManager.isRangingAvailable(){
                manager.startRangingBeacons(satisfying: beaconConstraint)
            }
        case .outside:
            print("OutsideTheRegion")
            if CLLocationManager.isRangingAvailable(){
                manager.stopRangingBeacons(satisfying: beaconConstraint)
            }
        case .unknown:
            print("Unknow")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRange beacons: [CLBeacon], satisfying beaconConstraint: CLBeaconIdentityConstraint) {
        if let beacon = beacons.first{
            print("becon is here")
        }
    }
}
