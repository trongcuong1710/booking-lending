//
//  MockGoogleSignInProvider.swift
//  booklending
//

import Foundation
@testable import booklending

class MockGoogleSignInProvider: GoogleSignInProviderProtocol {
    enum ResultType {
        case Success
        case Failed
    }
    
    private weak var delegate: GIDSignInDelegate?
    private var resultType: ResultType
    
    init(resultType: ResultType) {
        self.resultType = resultType
    }
    
    func config(delegate: GIDSignInDelegate) {
        self.delegate = delegate
    }
    
    func config(uiDelegate: GIDSignInUIDelegate) {}
    
    func signIn() {
        switch self.resultType {
        case .Success:
            self.authenticationSucceed()
            
        case .Failed:
            self.authenticationFailed()
        }
    }
    
    func signOut() {}
    
    private func authenticationSucceed() {
        self.delegate?.sign(GIDSignIn.sharedInstance(), didSignInFor: MockGIDGoogleUser(), withError: nil)
    }
    
    private func authenticationFailed() {
        self.delegate?.sign(GIDSignIn.sharedInstance(), didSignInFor: nil, withError: NSError(domain: "www.google.com", code: 401, userInfo: [NSLocalizedDescriptionKey: "Sign in with google failed."]))
    }
}
