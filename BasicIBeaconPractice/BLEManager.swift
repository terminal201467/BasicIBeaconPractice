//
//  BLEManager.swift
//  BasicIBeaconPractice
//
//  Created by 辴 穆 on 2022/5/26.
//

import Foundation
import CoreBluetooth


class BLEManager:NSObject{
    
    //MARK: - BindingClosure
    var valueChanged:(()->Void)?
    
    //MARK: - Properties
    private var bleCentralManager:CBCentralManager!
    
    var peripherals:[CBPeripheral] = []{
        didSet{
            valueChanged?()
            peripherals.removeDuplicates()
        }
    }
     
    var connectPeripheral:CBPeripheral?
    
    var RSSIs:[NSNumber] = []

    //MARK: - Intializer
    override init() {
        super.init()
        setCentralManager()
        
    }
    
    //MARK: - Methods
    func setCentralManager(){
        bleCentralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func startScan(){
        peripherals.removeAll()
        RSSIs.removeAll()
        print("Start Scanning")
        bleCentralManager.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey:true])
    }
    
    func stopScan(){
        bleCentralManager.stopScan()
        print("Stop Scaning")
    }
    
    func connect(peripheral:CBPeripheral){
        print("Connect")
        print("theConnectedPeripheral:\(peripheral)")
        self.connectPeripheral = peripheral
        bleCentralManager.connect(self.connectPeripheral!, options: nil)
    }
}


extension BLEManager:CBCentralManagerDelegate{
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("UpdateState")
        switch central.state{
        case .poweredOn:    print("開啟裝置")
        case .poweredOff:   print("關閉裝置")
        case .resetting:    print("重新設置")
        case .unauthorized: print("未授權")
        case .unsupported:  print("未支援")
        case .unknown:      print("未知")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if peripheral.name != nil{
            peripherals.append(peripheral)
            print("Peripherals：",peripherals.map{$0.name!})
        }
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        peripheral.delegate = self
        connectPeripheral = peripheral
        central.stopScan()
        peripheral.discoverServices(nil)
        print("CentralManagerConnect")
        self.connect(peripheral: peripheral)
        peripherals.removeAll()
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        if error != nil{
            print("CentralManagerFailToConnect:\(error!.localizedDescription)")
        }
    }
}

extension BLEManager:CBPeripheralDelegate{
    
    //MARK: -Found Service
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        print("PeripheralDiscoverService")
        if error != nil{
            print("Error discovering service:\(error?.localizedDescription)")
        }
        
        guard let services = peripheral.services else { return }
        print("Discovered service:\(services)")
        services.map{ service in
            peripheral.discoverCharacteristics(nil, for: service)
        }
    }
    
    //MARK: -Found Discriptor
    func peripheral(_ peripheral: CBPeripheral, didDiscoverDescriptorsFor characteristic: CBCharacteristic, error: Error?) {
        if error != nil{
            print("\(error.debugDescription)")
            return
        }
        
        if (characteristic.descriptors != nil){
            print(
            """
            UUID:\(characteristic.uuid)
            Descriptors:\(characteristic.descriptors)
            Service:\(characteristic.service)
            Value:"\(characteristic.value)
            """
            )
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor descriptor: CBDescriptor, error: Error?) {
        print("PeripheralUpdateValue")
        
    }
    
    func peripheral(_ peripheral: CBPeripheral, didWriteValueFor characteristic: CBCharacteristic, error: Error?) {
        print("PeripheralWriteValue")
    }
    
    
}
