//
//  WeatherDetailView.swift
//  CareWeather
//
//  Created by 蓝麒麟 on 2018/6/19.
//  Copyright © 2018年 蓝麒麟. All rights reserved.
//

import UIKit

class WeatherDetailView: UIView {
    
    //   温度范围
    lazy var temperatureRange: UILabel = {
        let label = UILabel ()
        return label
    }()
    //    紫外线强度
    lazy var ultravioletIntensity: UILabel = {
        let label = UILabel ()
        return label
    }()
    //    生活质量指数
    lazy var precipitationProbability: UILabel = {
        let label = UILabel ()
        return label
    }()
    
    //    防晒提示
    lazy var sunscreenTip: UILabel = {
        let label = UILabel ()
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 5
        self.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 1, height: 2);
        self.layer.shadowOpacity = 2
        self.layer.shadowPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: Screen_W - 50, height: 120), cornerRadius: 5).cgPath
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        
        
        
        super.updateConstraints()
    }
    

}
