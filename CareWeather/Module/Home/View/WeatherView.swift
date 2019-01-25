//
//  WeatherView.swift
//  CareWeather
//
//  Created by 蓝麒麟 on 2018/6/19.
//  Copyright © 2018年 蓝麒麟. All rights reserved.
//

import UIKit
import SnapKit

class WeatherView: UIView {
//   温度
    lazy var temperature: UILabel = {
        let label = UILabel ()
        label.font = UIBoldFontFromPixel(pixel: 70)
        label.textColor = Light_Word_Color
        label.text = "34"
        return label
    }()
    
//    图片
    lazy var Celsius: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Celsius"))
        return imageView
    }()
    
//    城市
    lazy var city: UILabel = {
        let label = UILabel ()
        label.font = UIBoldFontFromPixel(pixel: 24)
        label.textColor = Light_Word_Color
        label.text = "加利福利亚州"
        return label
    }()
//    降水概率
    lazy var precipitationProbability: UILabel = {
        let label = UILabel ()
        label.font = UIFontFromPixel(pixel: 16)
        label.textColor = Light_Word_Color
        label.text = "降水概率：30%"
        return label
    }()
    
//    空气质量
    lazy var airQuality: UILabel = {
        let label = UILabel ()
        label.font = UIFontFromPixel(pixel: 16)
        label.textColor = Light_Word_Color
        label.text = "空气质量：良"
        return label
    }()
//    图片
    lazy var picture: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initializeUserInterface()
    }
    
    func initializeUserInterface() {
        
        let shapeLayer = CAShapeLayer ()
        let path = UIBezierPath.init(roundedRect: CGRect(x: 0, y: 0, width: Screen_W - 20, height: 120), byRoundingCorners: [.topLeft ,.bottomLeft], cornerRadii: CGSize(width: 8, height: 8))
        path.fill()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.black.cgColor
        self.layer.mask = shapeLayer
        self.backgroundColor = Main_Gray
        
        self.addSubview(self.temperature)
        self.addSubview(self.Celsius)
        self.addSubview(self.city)
        self.addSubview(self.precipitationProbability)
        self.addSubview(self.airQuality)
        self.addSubview(self.picture)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        
        self.temperature.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(10)
            make.width.equalTo(self).multipliedBy(0.2)
        }
        
        self.Celsius.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.temperature).offset(3)
            make.left.equalTo(self.temperature.snp.right)
            make.width.equalTo(28)
            make.height.equalTo(30)
        }
        
        self.picture.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(-10)
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).offset(-10)
            make.width.equalTo(self.snp.height).offset(-20).multipliedBy(90.0/95.0)
        }
        
        self.city.snp.makeConstraints { (make) in
            make.left.equalTo(self.Celsius.snp.right).offset(8)
            make.bottom.equalTo(self.Celsius)
            make.right.equalTo(self.picture).offset(-10)
            make.height.equalTo(24)
        }
        
        self.precipitationProbability.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.city.snp.top).offset(-3)
            make.left.equalTo(self.city)
            make.width.equalTo(self.city)
            make.height.equalTo(16)
        }
        
        self.airQuality.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.precipitationProbability.snp.top).offset(-3)
            make.left.equalTo(self.city)
            make.width.equalTo(self.city)
            make.height.equalTo(16)
        }
        
        super.updateConstraints()
    }
    
    public func updateUIData(_ temp: String, city: String, precipitationProbability: String, airQuality: String) {
        
    }
    
}
