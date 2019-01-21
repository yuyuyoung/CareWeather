//
//  CityModel.swift
//  CareWeather
//
//  Created by 蓝麒麟 on 2018/7/24.
//  Copyright © 2018年 蓝麒麟. All rights reserved.
//

import UIKit

class CityModel: NSObject {

    public var cityName: String?
    public var nickname: String?
    public var time: String?
    public var temperature: String?
    
    init?(dictionary : [String : AnyObject]?) {
        
        super.init()
        if let _ : [String : AnyObject] = dictionary {
            setValuesForKeys(dictionary!)
        } else {
            return nil
            
        }
    }
    
    override init() {
        
        super.init()
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    class func loadDataSource(array: [AnyObject]) -> [AnyObject] {
        
        let modelArray = NSMutableArray()
        for infoDic:AnyObject in array {
            let dic = NSMutableDictionary(dictionary: infoDic as! [String : Any])
            
            let model = CityModel(dictionary: dic as? [String : AnyObject])
            if let _ = model {
                modelArray.add(model!)
            }
        }
        return modelArray as [AnyObject]
    }
    
}
