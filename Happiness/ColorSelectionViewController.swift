//
//  ViewController.swift
//  happiness
//
//  Created by Aliya Hassam on 2017-07-05.
//  Copyright © 2017 Aliya Hassam. All rights reserved.
//

import UIKit

class ColorSelectionViewController: UICollectionViewController {
    let reuseIdentifier = "happyColorCell"
    var colorSelectionDelegate: DisplayColorSelectionUseCaseProtocol
    var colorSelectionLayoutDelegate: ColorSelectionViewLayoutProtocol
    var handleSelectionAdapterDelegate: HandleSelectionAdapterProtocol
    
    init(colorSelectionDelegate: DisplayColorSelectionUseCaseProtocol,
         colorSelectionLayoutDelegate: ColorSelectionViewLayoutProtocol,
         handleSelectionAdapterDelegate: HandleSelectionAdapterProtocol,
         title: String = "My Happiness Project") {
        
        self.colorSelectionDelegate = colorSelectionDelegate
        self.colorSelectionLayoutDelegate = colorSelectionLayoutDelegate
        self.handleSelectionAdapterDelegate = handleSelectionAdapterDelegate
        
        super.init(collectionViewLayout: self.colorSelectionLayoutDelegate.layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        // make this configurable
        collectionView?.backgroundColor = .white
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
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
        
        return self.colorSelectionDelegate.colors.count
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
        ) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: reuseIdentifier,
            for: indexPath
        )
        
        let cellColor = self.colorSelectionDelegate.colors[indexPath.item]
        
        cell.contentView
            .backgroundColor = cellColor
            
        return cell
    }

    let alertCotroller = UIAlertController()
    override func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
        ) {
        
        let selectedColor = self.colorSelectionDelegate.colors[indexPath.item]
        let message = "Selected color: \(Configuration.sharedInstance().colors[selectedColor]!)"
        
        
        if (self.handleSelectionAdapterDelegate.submit(selectedColor: self.colorSelectionDelegate.colors[indexPath.item])) {
                AlertControllerHelper.showAlert(title: "Thank You", message: message)
        }
    }
}

