//
//  ConfigurationHelper.swift
//  Happiness
//
//  Created by Aliya Hassam on 2017-07-09.
//  Copyright © 2017 Aliya Hassam. All rights reserved.
//

import Foundation

class ConfigurationHelper {
    static func getRangeForNewInputValue(
        dayStartOffset: Int,
        timeColumnStart: String,
        dateRowStart: String
        ) -> String? {
        
        let timeStamp = Date()
        
        
        let hour = Calendar.current.component(.hour, from: timeStamp)
        
        let dayStartHour = dayStartOffset
        //let dayEndHour = datStartHour         let timeColumnIndex = hour
        
        return "A2"
    }
}
