//
//  UserInteractorProtocol.swift
//  booklending
//

import Foundation

protocol AuthenticationInteractorProtocol {
    weak var output: AuthenticationOutput? { get set }
    
    func signIn()
}
