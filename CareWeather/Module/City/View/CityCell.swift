//
//  CityCell.swift
//  CareWeather
//
//  Created by 蓝麒麟 on 2018/7/4.
//  Copyright © 2018年 蓝麒麟. All rights reserved.
//

import UIKit
import SnapKit

class CityCell: UITableViewCell {
    
    public var model: CityModel?
    
    lazy var content: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var cityNameLab: UILabel = {
        let label = UILabel();
        return label
    }()
    
    lazy var nicknameLab: UILabel = {
        let label = UILabel();
        return label
    }()
    
    lazy var timeLab: UILabel = {
        let label = UILabel();
        return label
    }()
    
    lazy var temperatureLab: UILabel = {
        let label = UILabel();
        return label
    }()
    
    let rightColor = #colorLiteral(red: 0.9411764706, green: 0.968627451, blue: 0.7215686275, alpha: 1)
    
    lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: Screen_W - 20, height: 80)
        layer.colors = [UIColor.white.cgColor, rightColor.cgColor];
        layer.startPoint = CGPoint(x: 0, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)
        layer.locations = [0.05, 1]
        return layer
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(content)
        self.content.layer.addSublayer(self.gradientLayer)
//        self.content.addSubview(cityNameLab)
//        self.content.addSubview(nicknameLab)
//        self.content.addSubview(timeLab)
//        self.content.addSubview(temperatureLab)
        
    }
    
    override func updateConstraints() {
        
        self.content.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView)
            make.right.equalTo(self.contentView).offset(-20);
            make.top.height.equalTo(self.contentView)
        }
        
        super.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
