//
//  UserRepository.swift
//  booklending
//

import Foundation

let NSUserDefaultCurrentUserKey = "currentUser"

class UserRepository: UserRepositoryProtocol {
    func save(user: User) {
        UserDefaults.standard.set(customObject: user, forKey: NSUserDefaultCurrentUserKey)
    }
    
    func deleteUser() {
        UserDefaults.standard.removeObject(forKey: NSUserDefaultCurrentUserKey)
    }
    
    func getCurrentUser() -> User? {
        return UserDefaults.standard.customObject(forKey: NSUserDefaultCurrentUserKey) as? User
    }
}
