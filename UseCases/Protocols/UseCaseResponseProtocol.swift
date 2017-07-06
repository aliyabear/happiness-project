//
//  UseCaseResponseProtocol.swift
//  Happiness
//
//  Created by Aliya Hassam on 2017-07-06.
//  Copyright © 2017 Aliya Hassam. All rights reserved.
//

import Foundation

protocol UseCaseResponseProtocol {
    /**
                    
        Response from UseCase.
        
        - Returns: true if successful, otherwise, false.
 
    */
    func response() -> Bool
}
