//
//  GoogleSignInProvider.swift
//  booklending
//

import Foundation

struct GoogleSignInProvider: GoogleSignInProviderProtocol {
    func config(delegate: GIDSignInDelegate) {
        GIDSignIn.sharedInstance().delegate = delegate
    }
    
    func signIn() {
        GIDSignIn.sharedInstance().signIn()
    }
}
