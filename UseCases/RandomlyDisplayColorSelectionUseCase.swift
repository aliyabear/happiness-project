//
//  RandomlyDisplayColorSelectionUseCase.swift
//  Happiness
//
//  Created by Aliya Hassam on 2017-07-14.
//  Copyright © 2017 Aliya Hassam. All rights reserved.
//

import GameplayKit
import UIKit

class RandomlyDisplayColorSelectionUseCase : DisplayColorSelectionUseCaseProtocol {

    private var _colors: [UIColor]
    var colors: [UIColor] {
        get {
            return _colors
        }
    }
    
    init(colorSelection: [UIColor]) {
        randomizeColors(colorSelection);
    }
 
    private func randomizeColors(_ forColorSelection: [UIColor]) {
        _colors = GKRandomSource
            .sharedRandom()
            .arrayByShufflingObjects(
                in: Array(Configuration.sharedInstance().forColorSelection.keys))
            as! Array<UIColor>
    }
    
}
