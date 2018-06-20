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

    

}
