//
//  DetailVC.swift
//  CareWeather
//
//  Created by 蓝麒麟 on 2018/7/30.
//  Copyright © 2018年 蓝麒麟. All rights reserved.
//

import UIKit

class DetailVC: BaseViewController {
    
    var model: [WeatherModel.Result.Future]?
    
    lazy var aaChart: AAChartView = {
        let chart = AAChartView()
        let chartViewWidth  = self.view.frame.size.width
        let chartViewHeight = self.view.frame.size.height / 3
        chart.frame = CGRect(x:0,y:0,width:chartViewWidth,height:chartViewHeight)
        
        return chart
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        
        return image
    }()

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
        self.view.addSubview(self.aaChart)
        
        if let model = self.model {
            let dates = model.map{
                $0.date
            }
            
            let lowTemp = model.map { (future) -> String in
                let str = future.temperature
                let strArr = str.split(separator: "~")
                return String(strArr[0])
            }
            
            let HighTemp = model.map { (future) -> String in
                let str = future.temperature
                let strArr = str.split(separator: "~")
                return String(strArr[1])
            }
            
            let chartModel = AAChartModel().chartType(.AreaSpline).animationType(.Bounce).yAxisTitle("℃").backgroundColor("#ffffff").dataLabelEnabled(true).tooltipValueSuffix("摄氏度").categories(dates).colorsTheme(["#fe117c","#ffc069"]).series([
                AASeriesElement()
                    .name("最低温")
                    .data(lowTemp.map{Int($0) ?? 0})
                    .toDic()!,
                AASeriesElement()
                    .name("最高温")
                    .data(HighTemp.map{Int($0) ?? 0})
                    .toDic()!,])
            
            self.aaChart.aa_drawChartWithChartModel(chartModel)
        }
        
        
        
    }
    
    init(model: [WeatherModel.Result.Future]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateViewConstraints() {
        
        super.updateViewConstraints()
    }

}
