//
//  MockUserRepositories.swift
//  booklending
//

import Foundation
@testable import booklending

class MockUserRepository: UserRepositoryProtocol {
    private var user: User?
    
    func save(user: User) {
        self.user = user
    }
    
    func getCurrentUser() -> User? {
        return self.user
    }
    
    func deleteUser() {
        self.user = nil
    }
}
