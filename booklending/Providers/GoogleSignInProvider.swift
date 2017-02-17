//
//  GoogleSignInProvider.swift
//  booklending
//

import Foundation

struct GoogleSignInProvider: GoogleSignInProviderProtocol {
    func config(delegate: GIDSignInDelegate) {
        GIDSignIn.sharedInstance().delegate = delegate
    }
    
    func config(uiDelegate: GIDSignInUIDelegate) {
        GIDSignIn.sharedInstance().uiDelegate = uiDelegate
    }
    
    func signIn() {
        GIDSignIn.sharedInstance().signIn()
    }
    
    func signOut() {
        GIDSignIn.sharedInstance().signOut()
    }
}
