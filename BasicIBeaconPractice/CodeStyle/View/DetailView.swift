//
//  DetailView.swift
//  BasicIBeaconPractice
//
//  Created by 辴 穆 on 2022/5/27.
//

import UIKit
import CoreBluetooth

class DetailView: UIView {

    //MARK: - UIProperties
    
    private let name:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let UUID:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private let descriptor:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 5
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let foundedService:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var peripheralInfo:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [name,UUID,descriptor,foundedService])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    let storeButton:UIButton = {
        let button = UIButton()
        button.setTitle("儲存裝置", for: .normal)
        button.layer.backgroundColor = .init(red: 0, green: 0, blue: 1, alpha: 1)
        button.layer.cornerRadius = 15
        return button
    }()
    
    //MARK: -Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(peripheralInfo)
        addSubview(storeButton)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -Layout
    private func autoLayout(){
        peripheralInfo.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
        }
        
        storeButton.snp.makeConstraints { make in
            make.top.equalTo(peripheralInfo.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
        }
    }
    
    func configurePeripheral( _ peripheral:CBPeripheral){
        name.text = "裝置名稱：" + peripheral.name!
        UUID.text = "UUID：" + peripheral.identifier.uuidString
        descriptor.text = "描述：" + "\(peripheral.description)"
    }
    
    func configureService(_ services:[CBService]){
        foundedService.text = "發現的服務：\(services.map{$0})"
    }
        
}
