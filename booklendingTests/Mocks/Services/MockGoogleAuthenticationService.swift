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
    
    enum ResultType {
        case Success
        case Failed
    }
    
    init(resultType: ResultType) {
        self.resultType = resultType
    }
    
    func signIn() -> Promise<User> {
        DispatchQueue(label: "async").asyncAfter(deadline: .now() + 0.4) {
            switch self.resultType {
            case .Success:
                self.promise.fulfill(User(email: "trongcuong@siliconstraits.com"))
                
            case .Failed:
                self.promise.reject(NSError(domain: "www.google.com", code: 401, userInfo: [NSLocalizedDescriptionKey : "Sign in with google failed."]))
            }
        }
        
        return self.promise.promise
    }
}
