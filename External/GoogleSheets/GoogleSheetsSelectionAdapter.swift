//
//  GoogleSheetsSelectionAdapter.swift
//  Happiness
//
//  Created by Aliya Hassam on 2017-07-14.
//  Copyright © 2017 Aliya Hassam. All rights reserved.
//

import GoogleAPIClientForREST
import GoogleSignIn

class GoogleSheetsSelectionAdapter: HandleSelectionAdapterProtocol {
    var authentication: GIDAuthentication
    
    init(withAuthenticatedService: GIDAuthentication) {
        self.authentication = withAuthenticatedService
    }
    
    func submit(selection: UIColor) -> Bool {
        guard let selectedColor = selectedColor else {
            return false
        }
        
        let spreadsheetId = Configuration.sharedInstance().googleSpreadSheetID
        
        let service = GTLRSheetsService()
        service.authorizer = authentication.fetcherAuthorizer()
        
        
        let date = Date()
        // make 2 a constant or a configuration setting
        let row = 2 + Calendar.current.component(.hour, from: date)
        
        
        let calendar = Calendar.current
        
        // Specify date components
        var dateComponents = DateComponents()
        dateComponents.year = 2017
        dateComponents.month = 7
        dateComponents.day = 9
        
        
        // Create date from components
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        
        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: someDateTime)
        let date2 = calendar.startOfDay(for: date)
        
        let components = calendar.dateComponents([.day], from: date1, to: date2)        // make a constant for start date
        let column = components.day //Calendar.current.component(<#T##component: Calendar.Component##Calendar.Component#>, from: <#T##Date#>)
        
        let cellToUpdate = Configuration.sharedInstance().googleSheetIDName + "!G\(row)"
        
        // time starts at C2
        // date starts at
        let valueRange = GTLRSheets_ValueRange.init()
        
        valueRange.values =  [[("#" + selectedColor.toHexString) as Any]]//Array<Any>()
        
        let query = GTLRSheetsQuery_SpreadsheetsValuesUpdate
            .query(withObject: valueRange, spreadsheetId: spreadsheetId, range:cellToUpdate)
        
        query.valueInputOption = "USER_ENTERED"
        
        service.executeQuery(query,
                             delegate: self,
                             didFinish: #selector(displayResultWithTicket(ticket:finishedWithObject:error:)))

    }
    
    // Process the response and display output
    func displayResultWithTicket(ticket: GTLRServiceTicket,
                                 finishedWithObject result : GTLRSheets_ValueRange,
                                 error : NSError?) {
    
        if let error = error {
            AlertControllerHelper.showAlert(title: "Error", message: error.localizedDescription)
            return
        }
    }
}
// extension from http://crunchybagel.com/working-with-hex-colors-in-swift-3/
extension UIColor {
    var toHexString: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        return String(
            format: "%02X%02X%02X",
            Int(r * 0xff),
            Int(g * 0xff),
            Int(b * 0xff)
        )
    }
}
