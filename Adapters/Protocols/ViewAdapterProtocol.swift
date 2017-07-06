//
//  ViewAdapterProtocol.swift
//  Happiness
//
//  Created by Aliya Hassam on 2017-07-06.
//  Copyright © 2017 Aliya Hassam. All rights reserved.
//

import Foundation

protocol ViewAdapterProtocol {
    var availableColourSelections: Array<ColourSelection> { get }
    var presenter: PresenterAdapterProtocol { get }
    
    init(availableColourSelections: Array<ColourSelection>, presenter: PresenterAdapterProtocol)
}
