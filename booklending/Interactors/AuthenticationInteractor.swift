//
//  UserInteractor.swift
//  booklending
//

import Foundation
import PromiseKit

class AuthenticationInteractor: AuthenticationInteractorProtocol {
    weak var output: AuthenticationOutput?
    fileprivate var authenticationService: AuthenticationService
    
    init(authenticationService: AuthenticationService = GoogleAuthenticationService()) {
        self.authenticationService = authenticationService
    }
    
    func signIn() {
        self.authenticationService.signIn().then {
            self.output?.onAuthenticationSucceed($0)
        }.catch {
            self.output?.onAuthenticationFailed($0)
        }
    }
}
