//
//  GoogleSpreadSheetConfigurationProtocol.swift
//  Happiness
//
//  Created by Aliya Hassam on 2017-07-16.
//  Copyright © 2017 Aliya Hassam. All rights reserved.
//

protocol GoogleSpreadSheetConfigurationProtocol {
    var googleSpreadSheetID: String { get }
    var googleSpreadSheetName: String { get }
    var googleSpreadSheetTimeColumnStart: (String,String) { get }
    var googleSpreadSheetDateRowStart: (String, String) { get }
}
