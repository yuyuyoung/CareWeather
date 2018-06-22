//
//  ViewController.swift
//  CareWeather
//
//  Created by 蓝麒麟 on 2018/6/14.
//  Copyright © 2018年 蓝麒麟. All rights reserved.
//

import UIKit
import SnapKit

class HomeVC: BaseViewController, UIGestureRecognizerDelegate {
    
    var startY: CGFloat = 0.0
    
    lazy var menuButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.setImage(UIImage(named: "HamburgMenu"), for: .normal)
        button.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var detailButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.setImage(UIImage(named: "Go"), for: .normal)
        button.addTarget(self, action: #selector(nextPage(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var pullTab: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "PullTab"))
        imageView.isUserInteractionEnabled = true
        let drag = UIPanGestureRecognizer (target: self, action: #selector(toDetail(sender:)))
        drag.delegate = self
        imageView.addGestureRecognizer(drag)
        return imageView
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
    
    lazy var shareButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.center = CGPoint(x: Screen_W - 40, y: Screen_H - 60)
        button.bounds = CGRect(x: 0, y: 0, width: 60, height: 60)
        button.setImage(UIImage(named: "Share"), for: .normal)
        button.addTarget(self, action: #selector(shareWithSomeone(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var mainWeatherView: WeatherView = {
        
        let view = WeatherView()
        
        return view
    }()
    
    lazy var detailWeatherView: WeatherDetailView = {
        
        let view = WeatherDetailView()
        view.alpha = 0.2
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
        self.view.addSubview(self.detailWeatherView)
        self.view.addSubview(self.mainWeatherView)
        self.view.addSubview(self.pullTab)
        self.view.addSubview(self.shareButton);
        
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
            make.centerY.equalTo(self.view).priority(.high)
            make.left.equalTo(self.view).offset(Left_Space)
            make.width.equalTo(self.view).offset(-20)
            make.height.equalTo(120)
        }
        
        self.detailWeatherView.snp.makeConstraints { (make) in
            make.top.equalTo(self.mainWeatherView)
            make.left.equalTo(self.mainWeatherView).offset(15)
            make.width.equalTo(self.mainWeatherView).offset(-30)
            make.height.equalTo(120)
        }
        
        self.pullTab.snp.makeConstraints { (make) in
            make.top.equalTo(self.detailWeatherView.snp.bottom)
            make.centerX.equalTo(self.detailWeatherView)
            make.width.equalTo(20)
            make.height.equalTo(30)
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
    
    //MARK: Handle Interactions

    @objc func buttonPressed(sender: UIButton) {
        
    }
    
    @objc func nextPage(sender: UIButton) {
        
    }
    
    @objc func toDetail(sender: UIPanGestureRecognizer) {
        if (sender.state == .began) {
            
        }else if (sender.state == .changed) {
            
            let point = sender.translation(in: self.view).y - startY
            self.detailWeatherView.snp.updateConstraints { (make) in
                if (point <= 120 && point > 0) {
                    make.top.equalTo(self.mainWeatherView).offset(point)
                }else if (point <= 0){
                    make.top.equalTo(self.mainWeatherView)
                }else {
                    make.top.equalTo(self.mainWeatherView).offset(120)
                }
            }
            
            if (point < 0) {
                UIView.animate(withDuration: 0.35) {
                    self.view.layoutIfNeeded()
                    self.detailWeatherView.alpha = 0.2
                }
            }else {
                self.view.layoutIfNeeded()
            }
            
        }else if (sender.state == .failed || sender.state == .cancelled || sender.state == .ended) {
            let space = pullTab.frame.minY - self.mainWeatherView.frame.maxY
            if (space < 60) {
                self.detailWeatherView.snp.updateConstraints { (make) in
                    make.top.equalTo(self.mainWeatherView)
                }
                UIView.animate(withDuration: 0.35) {
                    self.view.layoutIfNeeded()
                }
            }else if (space >= 60) {
                self.detailWeatherView.snp.updateConstraints { (make) in
                    make.top.equalTo(self.mainWeatherView).offset(120)
                    
                }
                UIView.animate(withDuration: 0.35) {
                    self.view.layoutIfNeeded()
                    self.detailWeatherView.alpha = 1
                }
            }
        }
    }
    
    @objc func shareWithSomeone(sender:UIButton) {
        
    }
    
    //MARK: - UIGestureRecognizerDelegate
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if let sender = gestureRecognizer as? UIPanGestureRecognizer {
            startY = sender.translation(in: self.view).y
        }
        return true
    }


}

