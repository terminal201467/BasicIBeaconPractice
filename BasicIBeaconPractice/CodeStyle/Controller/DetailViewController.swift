//
//  DetailViewController.swift
//  BasicIBeaconPractice
//
//  Created by 辴 穆 on 2022/5/27.
//

import UIKit

class DetailViewController: UIViewController {
    
    let detailView = DetailView()
    
    //MARK: -LifeCycle
    override func loadView() {
        super.loadView()
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setDeviceInfo()
    }
    
    private func setNavigationBar(){
        title = "裝置資訊"
        let checkServiceButton = UIBarButtonItem(title: "查看服務", style: .plain, target: self, action: #selector(checkService))
        navigationItem.rightBarButtonItem = checkServiceButton
    }
    
    @objc func checkService(){
        //從下面Push一個View出來
        
    }
    
    func setDeviceInfo(){
        detailView.configurePeripheral(BLEManager.shared.connectPeripheral!)
        detailView.configureService(BLEManager.shared.discoveredServices)
    }
}
