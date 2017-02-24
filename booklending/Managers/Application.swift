//
//  ApplicationManager.swift
//  booklending
//

import Foundation

class Application {
    fileprivate var _userManager: UserManagerProtocol?
    
    static var userManager: UserManagerProtocol {
        get {
            if Application.shareInstance._userManager == nil {
                Application.shareInstance._userManager = UserManager()
            }
            
            return Application.shareInstance._userManager!
        }
    }
    
    func unsubscribe() {
        self._userManager = nil
    }
}

extension Application {
    static let shareInstance = Application()
}
