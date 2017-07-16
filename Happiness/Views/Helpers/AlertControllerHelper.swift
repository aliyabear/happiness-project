//
//  AlertHelper.swift
//  Happiness
//
//  Created by Aliya Hassam on 2017-07-09.
//  Copyright © 2017 Aliya Hassam. All rights reserved.
//

import UIKit

class AlertControllerHelper {
    static func showAlert(title : String = "Alert", message: String, controller: UIViewController?) {
        
        let alert =
            UIAlertController(
                title: title,
                message: message,
                preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(
            UIAlertAction(
                title: "Click",
                style: UIAlertActionStyle.default,
                handler: nil))
        
        
        if let controller = controller {
            controller.present(alert, animated: true, completion: nil)
        } else {
            if let rootVC = UIApplication.shared.keyWindow?.rootViewController {
                rootVC.present(alert, animated: true, completion: nil)
            }
        }
    }
    
}
