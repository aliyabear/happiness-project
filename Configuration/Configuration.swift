//
//  Configuration.swift
//  Happiness
//
//  Created by Aliya Hassam on 2017-07-09.
//  Copyright © 2017 Aliya Hassam. All rights reserved.
//

import UIKit

class Configuration {
    
    // make this a singleton for now
    private init() {
        
    }
    
    private static let instance = Configuration()
    
    static func sharedInstance() -> Configuration {
        return instance
    }
    
    private let _googleSpreadSheetID = "11nv0oM9nGKYJ9OGIzO9tPr3cVEF345sJYoOdAyoMoE8"
    var googleSpreadSheetID: String {
        return _googleSpreadSheetID
    }
    
    private let _googleSheetID = "gid=1075620204"
    var googleSheetID: String {
        return _googleSheetID
    }
    
    private let _googleSpreadSheetTimeColumnStart = "A2"
    var googleSpreadSeetTimeColumnStart: String {
        return _googleSpreadSheetTimeColumnStart
    }
    
    private let _googleSpreadSheetDateRowStart = "B1"
    var googleSpreadSheetDateRowStart: String {
        return _googleSpreadSheetDateRowStart;
    }
    
    private let _googleSheetIDName = "Sheet4"
    var googleSheetIDName: String {
        return _googleSheetIDName
    }
    
    var colors: Dictionary<UIColor, String> {
        get
        {
            return [UIColor.black: "Black",
                    UIColor.cyan: "Cyan",
                    UIColor.purple: "Purple",
                    UIColor.green: "Green",
                    UIColor.yellow:  "Yellow",
                    UIColor.red: "Red"]
        }
    }
}
