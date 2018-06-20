//
//  ViewController.swift
//  CareWeather
//
//  Created by 蓝麒麟 on 2018/6/14.
//  Copyright © 2018年 蓝麒麟. All rights reserved.
//

import UIKit
import SnapKit

class HomeVC: BaseViewController {
    
    lazy var menuButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.setImage(UIImage(named: "HamburgMenu"), for: .normal)
        button.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var detailButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.setImage(UIImage(named: "Go"), for: .normal)
        button.addTarget(self, action: #selector(toDetail), for: .touchUpInside)
        return button
    }()
    
    lazy var pullTab: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.setImage(UIImage(named: "PullTab"), for: .normal)
        button.addTarget(self, action: #selector(toDetail), for: .touchUpInside)
        return button
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIBoldFontFromPixel(pixel: 30)
        label.textColor = Main_Word_Color
        label.text = "早上好小明！"
        return label
    }()
    
    lazy var greetingsLabel: UILabel = {
        let label = UILabel()
        label.font = UIBoldFontFromPixel(pixel: 30)
        label.textColor = Main_Word_Color
        label.text = "今天又是一个好天气"
        return label
    }()
    
    lazy var mainWeatherView: WeatherView = {
        
        let view = WeatherView()
        
        return view
    }()
    
    lazy var detailWeatherView: WeatherDetailView = {
        
        let view = WeatherDetailView()
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeUserInterface()
    }
    
    func initializeUserInterface() {
        self.view.addSubview(self.menuButton)
        self.view.addSubview(self.detailButton)
        self.view.addSubview(self.timeLabel)
        self.view.addSubview(self.greetingsLabel)
        self.view.addSubview(self.mainWeatherView)
        
        self.menuButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(StatuBar_H + 20)
            make.left.equalTo(self.view).offset(Left_Space)
            make.width.equalTo(30)
            make.height.equalTo(15)
        }
        
        self.detailButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.menuButton)
            make.right.equalTo(self.view).offset(-Left_Space)
            make.width.equalTo(30)
            make.height.equalTo(20)
        }
        
        self.mainWeatherView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.view)
            make.left.equalTo(self.view).offset(Left_Space)
            make.width.equalTo(self.view).offset(-20)
            make.height.equalTo(110)
        }
        
        self.timeLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.mainWeatherView.snp.top).offset(-100)
            make.left.equalTo(self.mainWeatherView)
            make.width.equalTo(Screen_W - Left_Space * 2)
            make.height.equalTo(15)
        }
        
        self.greetingsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.timeLabel.snp.bottom).offset(12)
            make.left.equalTo(self.timeLabel)
            make.width.equalTo(self.timeLabel)
            make.height.equalTo(15)
        }
        
    }

    @objc func buttonPressed(sender: UIButton) {
        
    }
    
    @objc func toDetail() {
        
    }


}

