//
//  GlobalInfo.swift
//  CareWeather
//
//  Created by 蓝麒麟 on 2018/6/20.
//  Copyright © 2018年 蓝麒麟. All rights reserved.
//

import UIKit

final class GlobalInfo: NSObject {
    
    lazy var month: Int = {
        
        let calendar = NSCalendar.current
        let components = calendar.component(.month, from: Date())
        
        return components
    }()
    
    lazy var season: Season = {
        switch self.month {
        case 3, 4, 5:
            return .Spring
        case 6, 7, 8:
            return .Summer
        case 9, 10, 11:
            return .Autumn
        case 12, 1, 2:
            return .Winter
        default:
            return .Summer
        }
    }()
    
    static let shareGlobalInfo = GlobalInfo()
    private override init() {}
}
