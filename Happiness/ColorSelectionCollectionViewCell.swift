//
//  ColorSelectionCollectionViewCell.swift
//  Happiness
//
//  Created by Aliya Hassam on 2017-07-07.
//  Copyright © 2017 Aliya Hassam. All rights reserved.
//

import UIKit

class ColorSelectionCollectionViewCell: UICollectionViewCell {

    var colorAsHex: String {
        get {
            guard let backgroundColor = contentView.backgroundColor else {
                return ""
            }
            
            return backgroundColor.toHexString
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
