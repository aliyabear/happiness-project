//
//  Configuration.swift
//  Happiness
//
//  Created by Aliya Hassam on 2017-07-09.
//  Copyright © 2017 Aliya Hassam. All rights reserved.
//

import UIKit

class Configuration {
    
    // make this a singleton for now. Consider injecting this into the appdelegate in the future.
    private init() {
        
    }
    private static let instance = Configuration()
    
    static func sharedInstance() -> Configuration {
        return instance
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
