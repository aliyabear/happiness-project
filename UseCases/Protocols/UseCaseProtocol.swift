//
//  UseCaseProtocol.swift
//  Happiness
//
//  Created by Aliya Hassam on 2017-07-06.
//  Copyright © 2017 Aliya Hassam. All rights reserved.
//

import Foundation

protocol UseCaseProtocol {
    var request: UseCaseRequestProtocol { get set }
    var response: UseCaseResponseProtocol { get set }
    
    func run(request: UseCaseRequestProtocol) -> Bool
}
