//
//  BaseViewController.swift
//  CareWeather
//
//  Created by 蓝麒麟 on 2018/6/20.
//  Copyright © 2018年 蓝麒麟. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    lazy var bottomColor: UIColor = {

        switch GlobalInfo.shareGlobalInfo.season {
            
        case .Spring:
            return Spring_Color
        case .Summer:
            return Summer_Color
        case .Autumn:
            return Autumn_Color
        case .Winter:
            return Winter_Color
        }
    }()
    
    lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.frame = self.view.bounds;
        layer.colors = [UIColor.white.cgColor, bottomColor.cgColor];
        layer.locations = [0.7, 1]
        return layer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.layer.addSublayer(self.gradientLayer)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
