//
//  WeatherView.swift
//  CareWeather
//
//  Created by 蓝麒麟 on 2018/6/19.
//  Copyright © 2018年 蓝麒麟. All rights reserved.
//

import UIKit

class WeatherView: UIView {
//   温度
    lazy var temperature: UILabel = {
        let label = UILabel ()
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
        return label
    }()
//    降水概率
    lazy var precipitationProbability: UILabel = {
        let label = UILabel ()
        return label
    }()
    
//    空气质量
    lazy var airQuality: UILabel = {
        let label = UILabel ()
        return label
    }()
//    图片
    lazy var picture: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let shapeLayer = CAShapeLayer ()
        let path = UIBezierPath.init(roundedRect: CGRect(x: 0, y: 0, width: Screen_W - 20, height: 120), byRoundingCorners: [.topLeft ,.bottomLeft], cornerRadii: CGSize(width: 8, height: 8))
        path.fill()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.black.cgColor
        self.layer.mask = shapeLayer
        self.backgroundColor = Main_Gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
