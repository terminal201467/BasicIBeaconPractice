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
    
    //MARK: -LifeCycle
    
    override func loadView() {
        super.loadView()
        view = resultView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setTable()
    }
    
    //MARK: -Methods
    
    private func setTable(){
        resultView.table.delegate = self
        resultView.table.dataSource = self
    }

    
}

extension ResultViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        return cell
    }
    
    
    
    
}
