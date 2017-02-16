//
//  GoogleSignInProviderProtocol.swift
//  booklending
//

import Foundation

protocol GoogleSignInProviderProtocol {
    func config(delegate: GIDSignInDelegate)
    func signIn()
}
