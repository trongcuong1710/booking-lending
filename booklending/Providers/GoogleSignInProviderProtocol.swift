//
//  GoogleSignInProviderProtocol.swift
//  booklending
//

import Foundation

protocol GoogleSignInProviderProtocol {
    func config(delegate: GIDSignInDelegate)
    func config(uiDelegate: GIDSignInUIDelegate)
    func signIn()
    func signOut()
}
