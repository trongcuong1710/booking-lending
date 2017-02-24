//
//  UserManagerProtocol.swift
//  booklending
//

import Foundation

protocol UserManagerProtocol {
    func signIn()
    func signIn(model: SignIn)
    func setOnAuthenticationSucceedCallback(callback: @escaping (User) -> ())
    func setOnAuthenticationFailedCallback(callback: @escaping (Error) -> ())
}
