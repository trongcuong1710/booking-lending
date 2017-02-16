//
//  AuthenticationService.swift
//  booklending
//

import Foundation
import PromiseKit

protocol AuthenticationService {
    func signIn() -> Promise<User>
}
