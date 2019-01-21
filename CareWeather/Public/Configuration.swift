//
//  Configuration.swift
//  CareWeather
//
//  Created by 蓝麒麟 on 2018/6/19.
//  Copyright © 2018年 蓝麒麟. All rights reserved.
//

import UIKit

public enum Season {
    case Spring
    case Summer
    case Autumn
    case Winter
}

public enum Gender {
    case Male
    case Female
    case Other
}

public let Main_Gray = #colorLiteral(red: 0.9411764706, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
public let Main_Blue = #colorLiteral(red: 0.1843137255, green: 0.5019607843, blue: 0.9647058824, alpha: 1)
public let Main_Word_Color = #colorLiteral(red: 0.3751252845, green: 0.3752647934, blue: 0.3763250613, alpha: 1)
public let Light_Word_Color = #colorLiteral(red: 0.568627451, green: 0.568627451, blue: 0.568627451, alpha: 1)

public let Summer_Color = #colorLiteral(red: 0.7647058824, green: 0.8862745098, blue: 0.9882352941, alpha: 1)
public let Spring_Color = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
public let Autumn_Color = #colorLiteral(red: 0.9921568627, green: 0.8745098039, blue: 0.7568627451, alpha: 1)
public let Winter_Color = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)

public let Left_Space: CGFloat = 20.0
public let StatuBar_H = UIApplication.shared.statusBarFrame.height
public let Screen_W = UIScreen.main.bounds.width
public let Screen_H = UIScreen.main.bounds.height
public let JH_APPKEY = "f091852028a82831d2703e6d28a4af60"

func UIFontFromPixel(pixel:CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: pixel * (3.0 / 4.0))
}

func UIBoldFontFromPixel(pixel:CGFloat) -> UIFont {
    return UIFont.boldSystemFont(ofSize: pixel * (3.0 / 4.0))
}

func UIFontFromPixel(name: String, pixel:CGFloat) -> UIFont? {
    return UIFont(name: name, size: pixel * (3.0 / 4.0))
}

func isEmptyString(string: String?) -> Bool {
    
    guard string != nil else {
        return true
    }
    
    if string!.count <= 0 {
        return true
    }
    
    if string!.trimmingCharacters(in: NSCharacterSet.whitespaces).count == 0 {
        return true
    }
    
    return false;
}

func FilePath(byName name : String) -> String? {
    
    return Bundle.main.path(forResource: name, ofType: nil)
}

