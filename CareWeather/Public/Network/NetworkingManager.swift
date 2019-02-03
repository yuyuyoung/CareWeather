//
//  NetworkingManager.swift
//  CareWeather
//
//  Created by yangyu on 2019/1/21.
//  Copyright © 2019 蓝麒麟. All rights reserved.
//

import Foundation
import Moya

enum NetAPI {
    case cityWeather(city: String)
}


extension NetAPI: TargetType {
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var baseURL: URL { return URL(string: "http://v.juhe.cn/")! }
    var path: String {
        switch self {
        case .cityWeather:
            return "weather/index"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .cityWeather:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .cityWeather(let city): // Send no parameters
            return .requestParameters(parameters: ["format":2, "cityname": city, "key":JH_APPKEY], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
