//
//  UserRepositoryProtocol.swift
//  booklending
//

import Foundation

protocol UserRepositoryProtocol {
    func getCurrentUser() -> User?
    func save(user: User)
    func deleteUser()
}
