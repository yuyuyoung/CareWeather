//
//  DetailVC.swift
//  CareWeather
//
//  Created by 蓝麒麟 on 2018/7/30.
//  Copyright © 2018年 蓝麒麟. All rights reserved.
//

import UIKit

class DetailVC: BaseViewController {

    lazy var backButton: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.frame = CGRect(x: Left_Space, y: StatuBar_H + 20, width: 30, height: 20)
        button.setImage(UIImage(named: "Back"), for: .normal)
        button.addTarget(self, action: #selector(back(sender:)), for: .touchUpInside)
        return button
    }()
    
    @objc func back(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.backButton)
        
    }
    
    override func updateViewConstraints() {
        
        
        super.updateViewConstraints()
    }

}
