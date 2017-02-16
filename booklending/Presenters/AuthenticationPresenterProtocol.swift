//
//  AuthenticationPresenterProtocol.swift
//  booklending
//

import Foundation

protocol AuthenticationPresenterProtocol {
    weak var view: AuthenticationViewProtocol? { get set }
    
    func signInButtonDidTouch()
}
