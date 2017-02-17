//
//  MockGoogleAuthenticationService.swift
//  booklending
//

import Foundation
import PromiseKit
@testable import booklending

class MockGoogleAuthenticationService: AuthenticationService {
    private var resultType: ResultType
    
    private let promise = Promise<User>.pending()
    private var email: String
    
    enum ResultType {
        case Success
        case Failed
    }
    
    init(resultType: ResultType, email: String = "trongcuong@siliconstraits.com") {
        self.resultType = resultType
        self.email = email
    }
    
    func signIn() -> Promise<User> {
        DispatchQueue(label: "async").asyncAfter(deadline: .now() + 0.4) {
            switch self.resultType {
            case .Success:
                self.promise.fulfill(User(email: self.email))
                
            case .Failed:
                self.promise.reject(NSError(domain: "www.google.com", code: 401, userInfo: [NSLocalizedDescriptionKey : "Sign in with google failed."]))
            }
        }
        
        return self.promise.promise
    }
}
