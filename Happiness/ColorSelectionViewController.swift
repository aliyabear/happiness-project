//
//  ViewController.swift
//  happiness
//
//  Created by Aliya Hassam on 2017-07-05.
//  Copyright © 2017 Aliya Hassam. All rights reserved.
//

import GameplayKit
import GoogleAPIClientForREST
import GoogleSignIn

import UIKit


class ColorSelectionViewController: UICollectionViewController {

    var randomizedColors: Array<UIColor>
    let reuseIdentifier = "happyColorCell"
    //let colors: Dictionary<UIColor: String>
    // Google Sign-In Stuff
    
    var authentication: GIDAuthentication
    
    init(withAuthentication: GIDAuthentication) {
        
        // #warning: all of this will be configurable
        let layout  = UICollectionViewFlowLayout()
        randomizedColors = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: Array(Configuration.sharedInstance().colors.keys)) as! Array<UIColor>
       self.authentication = withAuthentication
        
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
        let cellHeight = screenHeight / CGFloat(randomizedColors.count * 2)
        
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
        
        return randomizedColors.count
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
        ) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: reuseIdentifier,
            for: indexPath
        ) as! ColorSelectionCollectionViewCell
        
        
        let cellColor = randomizedColors[indexPath.item]
        
        cell.contentView
            .backgroundColor = cellColor
            
        return cell
    }

    let alertCotroller = UIAlertController()
    override func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
        ) {
        
        // this is always nil so fix it
        let selectedColor = randomizedColors[indexPath.item]
        let message = "Selected color: \(Configuration.sharedInstance().colors[selectedColor]!)"
        
        storeHappiness(selectedColor: selectedColor.toHexString)
        
        AlertControllerHelper.showAlert(title: "Thank You", message: message)
    }
    
    func storeHappiness(selectedColor: String?) {
        
        guard let selectedColor = selectedColor else {
            return
        }
        
        let spreadsheetId = Configuration.sharedInstance().googleSpreadSheetID
        
        let service = GTLRSheetsService()
        service.authorizer = authentication.fetcherAuthorizer()
        
        
        let date = Date()
        // make 2 a constant or a configuration setting
        let row = 2 + Calendar.current.component(.hour, from: date)
        
        
        let calendar = Calendar.current
        
        // Specify date components
        var dateComponents = DateComponents()
        dateComponents.year = 2017
        dateComponents.month = 7
        dateComponents.day = 9
        
        
        // Create date from components
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        
        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: someDateTime)
        let date2 = calendar.startOfDay(for: date)
        
        let components = calendar.dateComponents([.day], from: date1, to: date2)        // make a constant for start date
        let column = components.day //Calendar.current.component(<#T##component: Calendar.Component##Calendar.Component#>, from: <#T##Date#>)
        
        let cellToUpdate = Configuration.sharedInstance().googleSheetIDName + "!G\(row)"
        
        // time starts at C2
        // date starts at
        let valueRange = GTLRSheets_ValueRange.init()
       
        valueRange.values =  [[("#" + selectedColor) as Any]]//Array<Any>()
        
        let query = GTLRSheetsQuery_SpreadsheetsValuesUpdate
            .query(withObject: valueRange, spreadsheetId: spreadsheetId, range:cellToUpdate)
        
        query.valueInputOption = "USER_ENTERED"
    
        service.executeQuery(query,
                             delegate: self,
                             didFinish: #selector(displayResultWithTicket(ticket:finishedWithObject:error:)))
        
    }
    
    // Process the response and display output
    func displayResultWithTicket(ticket: GTLRServiceTicket,
                                 finishedWithObject result : GTLRSheets_ValueRange,
                                 error : NSError?) {
        
        if let error = error {
            showAlert(title: "Error", message: error.localizedDescription)
            return
        }
        
        
    }
    
}

