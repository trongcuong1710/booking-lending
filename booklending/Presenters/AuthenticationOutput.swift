//
//  UserOutput.swift
//  booklending
//

import Foundation

protocol AuthenticationOutput: class {
    var interactor: AuthenticationInteractorProtocol { get }
    
    func onAuthenticationSucceed(_ user: User)
    func onAuthenticationFailed(_ error: Error)
}
