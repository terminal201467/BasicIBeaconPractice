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
        detailView.configure(BLEManager.shared.connectPeripheral!)
    }
    
    private func setNavigationBar(){
        title = "裝置資訊"
    }
}
