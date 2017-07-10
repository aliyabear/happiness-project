//
//  AlertHelper.swift
//  Happiness
//
//  Created by Aliya Hassam on 2017-07-09.
//  Copyright © 2017 Aliya Hassam. All rights reserved.
//

import UIKit

class AlertControllerHelper {
    static func showAlert(title : String = "Alert", message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertControllerStyle.alert
        )
        let ok = UIAlertAction(
            title: "OK",
            style: UIAlertActionStyle.default,
            handler: nil
        )
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}
