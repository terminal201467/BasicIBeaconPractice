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
    
    //MARK: -LifeCycle
    override func loadView() {
        super.loadView()
        view = beaconDataView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
    }
}

