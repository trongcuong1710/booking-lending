//
//  MockAuthenticationInteractor.swift
//  booklending
//

import Foundation
@testable import booklending

class MockAuthenticationInteractor: AuthenticationInteractorProtocol {
    enum ResultType {
        case Success
        case Failed
    }
    
    weak var output: AuthenticationOutput?
    private var resultType: ResultType
    
    init(resultType: ResultType) {
        self.resultType = resultType
    }
    
    func signIn() {
        switch self.resultType {
        case .Success:
            self.output?.onAuthenticationSucceed(User(email: "trongcuong@siliconstraits.com"))
        case .Failed:
            self.output?.onAuthenticationFailed(NSError(domain: "www.google.com", code: 401, userInfo: [NSLocalizedDescriptionKey: "Sign in with google failed"]))
        }
    }
}
