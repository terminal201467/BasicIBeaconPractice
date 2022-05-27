//
//  ServiceViewController.swift
//  BasicIBeaconPractice
//
//  Created by 辴 穆 on 2022/5/27.
//

import UIKit

class ServiceViewController: UIViewController {
    
    let serviceView = ServiceView()

    
    //MARK: -LifeCycle
    
    override func loadView() {
        super.loadView()
        view = serviceView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

}
