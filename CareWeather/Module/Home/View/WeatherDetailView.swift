//
//  WeatherDetailView.swift
//  CareWeather
//
//  Created by 蓝麒麟 on 2018/6/19.
//  Copyright © 2018年 蓝麒麟. All rights reserved.
//

import UIKit
import SnapKit

class WeatherDetailView: UIView {
    
    //   温度范围
    lazy var temperatureRange: UILabel = {
        let label = UILabel ()
        label.textColor = Main_Blue
        label.font = UIBoldFontFromPixel(pixel: 24)
        label.text = "00 - 00"
        label.textAlignment = .center
        return label
    }()
    //    风力强度
    lazy var windIntensity: UILabel = {
        let label = UILabel ()
        return label
    }()
    //    生活质量指数
    lazy var precipitationProbability: UILabel = {
        let label = UILabel ()
        return label
    }()
    
    //    防晒指数
    lazy var sunscreenTip: UILabel = {
        let label = UILabel ()
        return label
    }()
    
    //    生活提示
    lazy var lifeTips: UILabel = {
        let label = UILabel ()
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initializeUserInterface()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeUserInterface() {
        
        self.layer.cornerRadius = 5
        self.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 1, height: 2);
        self.layer.shadowOpacity = 2
        self.layer.shadowPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: Screen_W - 50, height: 120), cornerRadius: 5).cgPath
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        self.addSubview(self.temperatureRange)
        self.addSubview(self.windIntensity)
        self.addSubview(self.precipitationProbability)
        self.addSubview(self.sunscreenTip)
        self.addSubview(self.lifeTips)
        
        for i in 0...1 {
            let view = UIView()
            view.tag = 200 + i
            view.layer.cornerRadius = 2
            view.backgroundColor = Main_Blue
            
            self.addSubview(view)
        }
        
    }
    
    override func updateConstraints() {
        
        self.temperatureRange.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).multipliedBy(1.0 / 3.0)
            make.width.equalTo(70)
            make.height.equalTo(14)
        }
        
        for i in 200...201 {
            let view = self.viewWithTag(i)
            guard let line = view else {
                continue;
            }
            line.snp.makeConstraints { (make) in
                make.left.equalTo(self).offset(10)
                make.centerY.equalTo(self).multipliedBy(1.0 + ((2.0 / 3.0) * (CGFloat(i) - 200.0)))
                make.width.equalTo(4)
                make.height.equalTo(20)
            }
        }
        
        super.updateConstraints()
    }
    
    public func updateUIData(_ temperatureRange:String, precipitationProbability:String, lifeTips: String, windIntensity: String, UVIndex: String) {
        
        
        
    }

}
