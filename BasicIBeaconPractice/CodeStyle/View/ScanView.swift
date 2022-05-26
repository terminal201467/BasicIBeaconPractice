//
//  View.swift
//  BasicIBeaconPractice
//
//  Created by 辴 穆 on 2022/5/25.
//

import UIKit
import SnapKit

class ScanView: UIView {
    //MARK: -Properties
    
    let activityIndicator:UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .gray
        return activityIndicator
    }()
    
    //Label
    let label:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    //Button
    let button:UIButton = {
       let button = UIButton()
        button.setTitle("掃描", for: .normal)
        button.layer.backgroundColor = .init(red: 0, green: 0, blue: 1, alpha: 1)
        button.layer.cornerRadius = 15
        return button
    }()
    
    let iBeaconListButton:UIButton = {
        let button = UIButton()
        button.setTitle("已儲存的Beacon", for: .normal)
        button.layer.backgroundColor = CGColor.init(red: 0, green: 0, blue: 1, alpha: 1)
        button.layer.cornerRadius = 15
        return button
    }()
    
    
    
    //MARK: -Intialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(button)
        addSubview(activityIndicator)
        addSubview(iBeaconListButton)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -UI
    private func autoLayout(){
        button.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(100)
            make.center.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.top.equalTo(button.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        iBeaconListButton.snp.makeConstraints { make in
            make.width.equalTo(180)
            make.height.equalTo(button.snp.height)
            make.centerX.equalToSuperview()
            make.centerY.equalTo(button.snp.centerY).offset(100)
        }
    }
    
    //MARK: -DataInterface
    func configure(){
        
    }

}
