//
//  ViewController.swift
//  BasicIBeaconPractice
//
//  Created by 辴 穆 on 2022/5/25.
//

import UIKit

class ScanViewController: UIViewController {

    //MARK: -UIProperties
    
    let scanView = ScanView()
    
    //MARK: -ControllerProperties
    
    let bleManager = BLEManager.init()
    
    private var scanSituation:Bool = false
    
    //MARK: -LifeCycle
    override func loadView() {
        super.loadView()
        view = scanView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        
    }
    
    //MARK: -Methods
    private func setButton(){
        scanView.button.addTarget(self, action: #selector(scan), for: .touchDown)
    }
    
    @objc func scan(){
       
        scanSituation.toggle()
        if scanSituation == true{
            scanView.activityIndicator.startAnimating()
            scanView.button.setTitle("停止掃描", for: .normal)
            bleManager.startScan()
        }else{
            scanView.activityIndicator.stopAnimating()
            scanView.button.setTitle("掃描", for: .normal)
            bleManager.stopScan()
            
        }
        
        //Button Font Change
    }
    
    //MARK: -Methods
    func setBLE(){
        bleManager.valueChanged = {
            print("Changed")
        }
    }
}

