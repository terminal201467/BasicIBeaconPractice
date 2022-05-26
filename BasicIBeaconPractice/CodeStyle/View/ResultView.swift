//
//  ResultView.swift
//  BasicIBeaconPractice
//
//  Created by 辴 穆 on 2022/5/26.
//

import UIKit

class ResultView: UIView {

    let table:UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.allowsSelection = true
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(table)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        table.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
