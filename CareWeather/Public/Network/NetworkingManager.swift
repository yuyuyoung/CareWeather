//
//  NetworkingManager.swift
//  CareWeather
//
//  Created by yangyu on 2019/1/21.
//  Copyright © 2019 蓝麒麟. All rights reserved.
//

import Foundation
import Alamofire

public typealias HTTPSuccessBlock = (_ result : Data) -> Void
public typealias HTTPFailureBlock = (_ error : Error) -> Void

public class NetworkingManager {
    
    class func post(_ url:String, paramters: [String : Any], success: @escaping HTTPSuccessBlock, failure: @escaping HTTPFailureBlock) {
        
        guard let Url = URL(string: url) else {
            return
        }
        
        Alamofire.request(Url, method: .post, parameters: paramters, encoding: JSONEncoding.default, headers: nil).downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
            print("Progress: \(progress.fractionCompleted)")
            }.responseJSON { response in
                
                switch response.result {
                case .success(let vaule):
                    
                    let data : Data = try! JSONSerialization.data(withJSONObject: vaule, options: []) as Data
                    print(vaule)
                    success(data)
                    
                case .failure(let error):
                    failure(error)
                }
                
        }
        
    }
    
    class func get(_ url: String, success: @escaping HTTPSuccessBlock, failure: @escaping HTTPFailureBlock) {
        
        guard let Url = URL(string: url) else {
            return
        }
        
        Alamofire.request(Url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (respond) in
            
            switch respond.result {
            case .success(let value):
                
                let data : Data = try! JSONSerialization.data(withJSONObject: value, options: []) as Data
                print(value)
                success(data)

                
            case .failure(let error):
                failure(error)
            }
            
        }
        
    }
    
}


//MARK: weather
extension NetworkingManager {
    
    public class func getWeatherInfo(_ city: String, success: @escaping HTTPSuccessBlock, failure: @escaping HTTPFailureBlock) {
        
        let url = "http://v.juhe.cn/weather/index?format=2&cityname=\(city.utf8)&key=\(JH_APPKEY)"
        
        get(url, success: success, failure: failure)
        
    }
    
}
