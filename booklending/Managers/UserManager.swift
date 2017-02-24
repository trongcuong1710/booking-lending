//
//  UserManager.swift
//  booklending
//

import Foundation

class UserManager {
}

extension UserManager: UserManagerProtocol {
    func signIn() {
        
    }
    
    func signIn(model: SignIn) {
        
    }
    
    func setOnAuthenticationSucceedCallback(callback: @escaping (User) -> ()) {
        
    }
    
    func setOnAuthenticationFailedCallback(callback: @escaping (Error) -> ()) {
        
    }
}
