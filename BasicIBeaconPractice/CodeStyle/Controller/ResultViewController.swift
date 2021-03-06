//
//  ResultViewController.swift
//  BasicIBeaconPractice
//
//  Created by 辴 穆 on 2022/5/26.
//

import UIKit

class ResultViewController: UIViewController {

    //MARK: -UIProperties
    
    let resultView = ResultView()
    
    //MARK: -Controller
    
    let detailViewController = DetailViewController()
    
    //MARK: -LifeCycle
    
    override func loadView() {
        super.loadView()
        view = resultView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setTable()
        setBLE()
    }
    
    //MARK: -Methods
    private func setNavigationBar(){
        title = "掃描的裝置"
    }
    
    private func setTable(){
        resultView.table.delegate = self
        resultView.table.dataSource = self
    }
    
    private func setBLE(){
        BLEManager.shared.valueChanged = {
            DispatchQueue.main.async {
                self.resultView.table.reloadData()
            }
        }
    }
}

extension ResultViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BLEManager.shared.peripherals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = BLEManager.shared.peripherals.map{$0.name!}[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(detailViewController, animated: true)
        BLEManager.shared.connect(peripheral: BLEManager.shared.peripherals[indexPath.row])
    }
}
