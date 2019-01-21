//
//  CityVC.swift
//  CareWeather
//
//  Created by 蓝麒麟 on 2018/7/3.
//  Copyright © 2018年 蓝麒麟. All rights reserved.
//

import UIKit
import SnapKit

class CityVC: BaseViewController {
    
    let kCityCellIdentifier = "kCityCellIdentifier"
    
    lazy var menuButton: UIButton = {
          let button = UIButton(type: UIButtonType.custom)
        button.setImage(UIImage(named: "HamburgMenu"), for: .normal)
        button.tag = 101
        button.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.setImage(UIImage(named: "Add"), for: .normal)
        button.tag = 100
        button.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var cityList: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.register(CityCell.self, forCellReuseIdentifier: kCityCellIdentifier)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 80
        tableView.backgroundColor = UIColor.clear
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.menuButton)
        self.view.addSubview(self.cityList)
        self.view.addSubview(self.addButton)
    }
    
    override func updateViewConstraints() {
        
        self.menuButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(StatuBar_H + 20)
            make.left.equalTo(self.view).offset(Left_Space)
            make.width.equalTo(30)
            make.height.equalTo(15)
        }
        
        self.addButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view).offset(-45)
            make.right.equalTo(self.view).offset(-30)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        self.cityList.snp.makeConstraints { (make) in
            make.top.equalTo(self.menuButton.snp.bottom)
            make.width.equalTo(self.view)
            make.bottom.equalTo(self.addButton.snp.top).offset(-10)
        }
        
        super.updateViewConstraints()
    }
    
    //MARK: button pressed handle
    
    @objc func buttonPressed(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension CityVC:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: kCityCellIdentifier)
        
        return cell!
    }
}
