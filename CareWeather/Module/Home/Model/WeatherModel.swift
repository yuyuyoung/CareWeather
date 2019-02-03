//
//  WeatherModel.swift
//  CareWeather
//
//  Created by yangyu on 2019/1/20.
//  Copyright © 2019 蓝麒麟. All rights reserved.
//

import Foundation
import Moya

struct WeatherModel: Codable {
    var resultcode: String
    var reason: String
    var result: Result
    var error_code: Int
    
    struct Result: Codable {
        
        var sk: Sk
        var today: Today
        var future: [Future]
        
        struct Sk: Codable { //实况天气
            var temp: String //当前温度
            var wind_direction: String //风向
            var wind_strength: String //风力
            var humidity: String //当前湿度
            var time: String //更新时间
        }
        
        struct Today: Codable {
            var city: String
            var date_y: String
            var week: String
            var temperature: String
            var weather: String
            var weather_id: WeatherId
            var wind: String
            var dressing_index: String
            var dressing_advice: String
            var uv_index: String
            var comfort_index: String
            var wash_index: String
            var travel_index: String
            var exercise_index: String
            var drying_index: String
            
            struct WeatherId: Codable {
                var fa: String
                var fb: String
            }
        }
        
        struct Future: Codable {
            var temperature: String
            var weather: String
            var weather_id: Today.WeatherId
            var wind: String
            var week: String
            var date: String
        }
        
    }
    
}


class WeatherInfo: NSObject {
    
    var weatherModel: WeatherModel?
    
    public func getInfo() {
        
        let provider = MoyaProvider<NetAPI>()
        provider.request(.cityWeather(city:"成都")) { result in
            
            switch result {
                
            case let .success(response):
                
                let data = response.data
                let decoder = JSONDecoder()
                let weatherInfo: WeatherModel  = try! decoder.decode(WeatherModel.self, from:data)
                print(weatherInfo.result.today.dressing_advice)
                
            case let .failure(error):
                print (error.localizedDescription)
            }
            
        }
    }
}

extension String {
    // URL Decode
    func URLDecode() -> String? {
        return self.removingPercentEncoding
    }
    
    // URL Encode
    func URLEncode() -> String? {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "!*'\"();:@&=+$,/?%#[]% "))
    }
}

