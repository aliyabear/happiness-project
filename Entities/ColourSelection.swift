//
//  ColourSelection.swift
//  Happiness
//
//  Created by Aliya Hassam on 2017-07-06.
//  Copyright © 2017 Aliya Hassam. All rights reserved.
//

import UIKit

class ColourSelection : ColourSelectionProtocol {
    
    var _colour: UIColor = .white
    var colour: UIColor {
        get {
            return _colour
        }
        set (value) {
            _colour = value
        }
    }
    
    var _timestamp: Date = Date()
    var timestamp: Date {
        get {
            return _timestamp
        }
        set (value) {
            _timestamp = value
        }
    }
    
    init(selectedColour: UIColor, timestamp: Date) {
        self.colour = selectedColour
        self.timestamp = timestamp
    }
    
}
