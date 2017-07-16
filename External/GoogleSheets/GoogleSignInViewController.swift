//
//  GoogleSignInViewController.swift
//  Happiness
//
//  Created by Aliya Hassam on 2017-07-09.
//  Copyright © 2017 Aliya Hassam. All rights reserved.
//

import Foundation
import GoogleAPIClientForREST
import GoogleSignIn
import UIKit

class GoogleSignInViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {
    
    // If modifying these scopes, delete your previously saved credentials by
    // resetting the iOS simulator or uninstall the app.
    private let scopes = [kGTLRAuthScopeSheetsSpreadsheets]
    
    private let service = GTLRSheetsService()
    let signInButton = GIDSignInButton()
    let output = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure Google Sign-in.
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().scopes = scopes
        
        if (GIDSignIn.sharedInstance().hasAuthInKeychain()) {
            GIDSignIn.sharedInstance().signInSilently()
        } else {
            // if auth isn't in device's key chain, explicitly sign user in
            GIDSignIn.sharedInstance().signIn();
        }
        
        // Add the sign-in button.
        view.addSubview(signInButton)
        
        // Add a UITextView to display output.
        output.frame = view.bounds
        output.isEditable = false
        output.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        output.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        output.isHidden = true
        view.addSubview(output);
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            AlertControllerHelper.showAlert(title: "Authentication Error", message: error.localizedDescription, controller: self)
            self.service.authorizer = nil
        } else {
            
            self.signInButton.isHidden = true
            self.output.isHidden = false
            self.service.authorizer = user.authentication.fetcherAuthorizer()
            
            // move this stuff to a separate method
            let colorSelectionDelegate = RandomlyDisplayColorSelectionUseCase(colorSelection: Array(Configuration.sharedInstance().colors.keys))
            
            let colorSelectionLayoutDelegate = ColorSelectionViewLayoutUseCase()
            
            let handleSelectionAdapterDelegate = GoogleSheetsSelectionAdapter(withAuthenticatedService: user.authentication, forConfiguration: GoogleSheetsConfiguration())
            
            let colorSelectionViewController = ColorSelectionViewController(
                colorSelectionDelegate: colorSelectionDelegate,
                colorSelectionLayoutDelegate: colorSelectionLayoutDelegate,
                handleSelectionAdapterDelegate: handleSelectionAdapterDelegate)
            
            // move to next navigation page
            navigationController?.pushViewController(colorSelectionViewController, animated: true)
        }
    }
    
    }
