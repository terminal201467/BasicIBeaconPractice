//
//  ViewController.swift
//  BasicIBeaconPractice
//
//  Created by 辴 穆 on 2022/5/25.
//

import UIKit

class ViewController: UIViewController {

    //MARK: -Properties
    
    let beaconDataView = View()
    
    let ble = BLEManager.init()
    
    //MARK: -LifeCycle
    override func loadView() {
        super.loadView()
        view = beaconDataView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
    }
    
    //MARK: -Methods
    func setBLE(){
        ble.valueChanged = {
            print("Changed")
            
            
        }
    }
}

