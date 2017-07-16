//
//  GoogleSheetsConfiguration.swift
//  Happiness
//
//  Created by Aliya Hassam on 2017-07-14.
//  Copyright © 2017 Aliya Hassam. All rights reserved.
//

import Foundation

class GoogleSheetsConfiguration : GoogleSpreadSheetConfigurationProtocol {
    
    var googleSpreadSheetID: String {
        get {
            return "11nv0oM9nGKYJ9OGIzO9tPr3cVEF345sJYoOdAyoMoE8"
        }
    }
    
    var googleSpreadSheetName: String {
        get {
            return "Sheet4"
        }
    }
    
    var googleSpreadSheetTimeColumnStart: (String,String) {
        get {
            return ("B","1")
        }
    }
    
    var googleSpreadSheetDateRowStart: (String, String) {
        get {
            return ("A","2")
        }
    }

}
