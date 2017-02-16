//
//  UserInteractor.swift
//  booklending
//

import Foundation
import PromiseKit

class AuthenticationInteractor: AuthenticationInteractorProtocol {
    weak var output: AuthenticationOutput?
    fileprivate var authenticationService: AuthenticationService
    fileprivate var userRepository: UserRepositoryProtocol
    
    init(authenticationService: AuthenticationService = GoogleAuthenticationService(),
         userRepository: UserRepositoryProtocol = UserRepository()) {
        self.authenticationService = authenticationService
        self.userRepository = userRepository
    }
    
    func signIn() {
        self.authenticationService.signIn().then { user -> Void in
            self.userRepository.save(user: user)
            self.output?.onAuthenticationSucceed(user)
        }.catch {
            self.output?.onAuthenticationFailed($0)
        }
    }
}
