//
//  AuthenticationViewProtocol.swift
//  booklending
//

import Foundation

protocol AuthenticationViewProtocol: class {
    var presenter: AuthenticationPresenterProtocol { get }
    
    func show(error: Error)
    func authenticationSucceed(user: User)
}
