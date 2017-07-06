//
//  ColourSelectionProtocol.swift
//  Happiness
//
//  Created by Aliya Hassam on 2017-07-06.
//  Copyright © 2017 Aliya Hassam. All rights reserved.
//

import UIKit

protocol ColourSelectionProtocol {
    /**
     
        Colour that was selected by user.
     
    */
    var colour: UIColor { get set }
    /** 
 
        Date in UTC when selection was made.
     
    */
    var timestamp: Date { get set }
    /**
     
     Default initializer for ColourSelection.
     
     - Parameters:
        - selectedColour: Colour selected.
        - timestamp: When selection was made.
     */
    init(selectedColour: UIColor, timestamp: Date)
}
