//
//  Constants.swift
//  ServicesCMS
//
//  Created by Shashank Panwar on 29/04/23.
//

import Foundation
import UIKit


struct StoryBoards{
    static var mainStoryboardId = "Main"
    static var authenticateStoryboardId = "Authenticate"
    
    static func getStoryboard(for storyboardName : String) -> UIStoryboard{
        return UIStoryboard(name: storyboardName, bundle: nil)
    }
}

struct ThemeColor{
    
    struct Light{
        static let textField = UIColor(named: "TextField") ?? UIColor.white
        static let textColor = UIColor(named: "TextColor") ?? UIColor.darkGray
        static let strokeColor = UIColor(named: "StrokeColor") ?? UIColor.red
        static let disableField = UIColor(named: "DisableField") ?? UIColor.lightGray
        static let btnColor = UIColor(named: "BtnColor") ?? UIColor.red
        static let bgColor = UIColor(named: "BgColor") ?? UIColor.red
    }
}
