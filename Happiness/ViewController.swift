//
//  ViewController.swift
//  happiness
//
//  Created by Aliya Hassam on 2017-07-05.
//  Copyright © 2017 Aliya Hassam. All rights reserved.
//

import GameplayKit
import UIKit

class ViewController: UICollectionViewController {

    let colors = [UIColor.black, UIColor.cyan, UIColor.purple, UIColor.green, UIColor.yellow, UIColor.red]
    
    var randomizedColors: Array<UIColor>
    let reuseIdentifier = "happyColorCell"
    
    init() {
        
        // #warning: all of this will be configurable
        let layout  = UICollectionViewFlowLayout()
        randomizedColors = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: colors) as! Array<UIColor>
        super.init(collectionViewLayout: layout)
        
        
        layout.itemSize = makeCellSize()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        title = "My Happiness Project"
        
        
        //randomizedColors(colors) {_, _ in arc4random() % 2 == 0}
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeCellSize() -> CGSize {
        let screen = UIScreen.main.bounds
        let screenWidth = screen.size.width
        let screenHeight = screen.size.height
        
        let cellWidth =  screenWidth /*(screenWidth / 3.0)*/ - 15
        let cellHeight = screenHeight / CGFloat(colors.count * 2)
        
        let size = CGSize(width: cellWidth, height: cellHeight)
        
        return size
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        collectionView?.backgroundColor = .white
        collectionView?.register(ColorSelectionCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        //let layout = UICollectionViewLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewController
    
    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
        ) -> Int {
        
        return colors.count
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
        ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: reuseIdentifier,
            for: indexPath
        ) as! ColorSelectionCollectionViewCell
        
        cell.contentView
            .backgroundColor = randomizedColors[indexPath.item]
        
        return cell
    }

    // MARK: web stuff to move outta here!
    
    
}

