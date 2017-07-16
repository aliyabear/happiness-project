//
//  ColorSelectionViewLayoutUseCase.swift
//  Happiness
//
//  Created by Aliya Hassam on 2017-07-14.
//  Copyright © 2017 Aliya Hassam. All rights reserved.
//

import UIKit

class ColorSelectionViewLayoutUseCase: ColorSelectionViewLayoutProtocol {
    var layout: UICollectionViewLayout {
        get {
            
            let layout = UICollectionViewFlowLayout()
            
            layout.itemSize = makeCellSize()
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            
            return layout
        }
    }
    
    private func makeCellSize() -> CGSize {
        let screen = UIScreen.main.bounds
        let screenWidth = screen.size.width
        let screenHeight = screen.size.height
        
        let cellWidth =  screenWidth - 15
        let cellHeight = screenHeight / CGFloat(10)
        
        let size = CGSize(width: cellWidth, height: cellHeight)
        
        return size
    }

}
