//
//  UserInteractorSpecs.swift
//  booklending
//

import Foundation
import Quick
import Nimble
@testable import booklending

class UserInteractorSpecs: QuickSpec {
    override func spec() {
        describe(".signIn") {
            context("sign in succeed") {
                it("should call onAuthenticationSucceed on UserOutput") {
                    let service = MockGoogleAuthenticationService(resultType: .Success)
                    let interactor = AuthenticationInteractor(authenticationService: service)
                    let output = TestOutput(interactor: interactor)
                    
                    interactor.signIn()
                    
                    DispatchQueue(label: "async").asyncAfter(deadline: .now() + 0.4) {
                        expect(output.user).toNot(beNil())
                        expect(output.error).to(beNil())
                        expect(output.user?.email).to(equal("trongcuong@siliconstraits.com"))
                    }
                }
            }
            
            context("sign in failed") {
                it("should call onAuthenticationFailed on UserOutput") {
                    let service = MockGoogleAuthenticationService(resultType: .Failed)
                    let interactor = AuthenticationInteractor(authenticationService: service)
                    let output = TestOutput(interactor: interactor)
                    
                    interactor.signIn()
                    
                    DispatchQueue(label: "async").asyncAfter(deadline: .now() + 0.4) {
                        expect(output.user).to(beNil())
                        expect(output.error).toNot(beNil())
                        expect(output.error?.localizedDescription).to(equal("Sign in with google failed."))
                    }
                }
            }
        }
    }
    
    class TestOutput: AuthenticationOutput {
        private(set) var interactor: AuthenticationInteractorProtocol
        
        var user: User?
        var error: Error?
        
        init(interactor: AuthenticationInteractorProtocol) {
            self.interactor = interactor
            self.interactor.output = self
        }
        
        func onAuthenticationSucceed(_ user: User) {
            self.user = user
        }
        
        func onAuthenticationFailed(_ error: Error) {
            self.error = error
        }
    }
}
