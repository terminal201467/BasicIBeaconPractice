//
//  NibViewController.swift
//  BasicIBeaconPractice
//
//  Created by 辴 穆 on 2022/5/25.
//

import UIKit

class NibViewController: UIViewController {
    //MARK: -UIProperties
    
    @IBOutlet var scanButton:UIButton!
    
    @IBOutlet var activityIndicator:UIActivityIndicatorView!
    
    @IBOutlet var storeButton:UIButton!
    
    //MARK: -ControllerProperties
    
    private var scanSituation:Bool = false
    
    private let bleManager = BLEManager()
    
    //MARK: -LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
    }
    
    //MARK: -Methods
    
    private func setButton(){
        scanButton.addTarget(self, action: #selector(scan), for: .touchDown)
    }
    
    @objc func scan(){
        scanSituation.toggle()
        if scanSituation == true{
            activityIndicator.startAnimating()
            scanButton.setTitle("停止掃描", for: .normal)
            bleManager.startScan()
        }else{
            activityIndicator.stopAnimating()
            scanButton.setTitle("掃描", for: .normal)
            bleManager.stopScan()
        }
    }
}
