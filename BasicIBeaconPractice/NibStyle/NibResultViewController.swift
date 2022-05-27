//
//  ResultViewController.swift
//  BasicIBeaconPractice
//
//  Created by 辴 穆 on 2022/5/27.
//

import UIKit

class NibResultViewController: UIViewController {
    
    @IBOutlet var table:UITableView!
    
    //MARK: -LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setTableView()
    }
    
    //MARK: -Methods
    
    private func setNavigationBar(){
        title = "搜尋到的裝置"
    }
    
    private func setTableView(){
        table.delegate = self
        table.dataSource = self
    }

}

extension NibResultViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        BLEManager.shared.numberOfRowInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = BLEManager.shared.getBLEData(indexPath)
        return cell
    }
    
    
    
}
