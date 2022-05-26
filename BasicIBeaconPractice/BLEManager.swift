//
//  BLEManager.swift
//  BasicIBeaconPractice
//
//  Created by 辴 穆 on 2022/5/26.
//

import Foundation
import CoreBluetooth


class BLEManager:NSObject{
    
    //MARK: - Properties
    let bleCentralManager = CBCentralManager()
    
    //MARK: - Intializer
    override init() {
        super.init()
        setCentralManager()
        
    }
    
    //MARK: - Methods
    func setCentralManager(){
        bleCentralManager.delegate = self
        
    }
    
    func startScan(){
    
    }
    
    
    
    
}


extension BLEManager:CBCentralManagerDelegate{
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("Update")
    }
    
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("Discover")
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        peripheral.delegate = self
        print("Connect")
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print("FailToConnect")
    }

}

extension BLEManager:CBPeripheralDelegate{
    
    
    
    
}
