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
    
    private var scanSituation:Bool = true
    
    private let resultController = ResultViewController()
    
    //MARK: -LifeCycle
    override func loadView() {
        super.loadView()
        view = scanView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBLE()
        setButton()
        
    }
    
    //MARK: -Methods
    private func setBLE(){
        BLEManager.shared
    }
    
    private func setButton(){
        scanView.button.addTarget(self, action: #selector(scan), for: .touchDown)
    }
    
    @objc func scan(){
        if scanSituation == true{
            scanView.activityIndicator.startAnimating()
            scanView.button.setTitle("停止掃描", for: .normal)
            BLEManager.shared.startScan()
            scanSituation.toggle()
        }else{
            scanView.activityIndicator.stopAnimating()
            scanView.button.setTitle("掃描", for: .normal)
            BLEManager.shared.stopScan()
            navigationController?.pushViewController(resultController, animated: true)
            scanSituation.toggle()
        }
    }
}

