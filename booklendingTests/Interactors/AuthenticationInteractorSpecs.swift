//
//  UserInteractorSpecs.swift
//  booklending
//

import Foundation
import Quick
import Nimble
@testable import booklending

class AuthenticationInteractorSpecs: QuickSpec {
    override func spec() {
        describe(".signIn") {
            context("sign in succeed") {
                let repository = MockUserRepository()
                let service = MockGoogleAuthenticationService(resultType: .Success)
                let interactor = AuthenticationInteractor(authenticationService: service,
                                                          userRepository: repository)
                let output = TestOutput(interactor: interactor)
                
                interactor.signIn()
                
                it("should call onAuthenticationSucceed on UserOutput") {
                    expect(output.user).toNotEventually(beNil())
                    expect(output.error).toEventually(beNil())
                    expect(output.user?.email).toEventually(equal("trongcuong@siliconstraits.com"))
                }
                
                it("should save User's information using UserRepository") {
                    expect(repository.getCurrentUser()).toNotEventually(beNil())
                    expect(repository.getCurrentUser()?.email).toEventually(equal("trongcuong@siliconstraits.com"))
                }
            }
            
            context("sign in failed") {
                let repository = MockUserRepository()
                let service = MockGoogleAuthenticationService(resultType: .Failed)
                let interactor = AuthenticationInteractor(authenticationService: service,
                                                          userRepository: repository)
                let output = TestOutput(interactor: interactor)
                
                interactor.signIn()
                
                it("should call onAuthenticationFailed on UserOutput") {
                    expect(output.user).toEventually(beNil())
                    expect(output.error).toNotEventually(beNil())
                    expect(output.error?.localizedDescription).toEventually(equal("Sign in with google failed."))
                }
                
                it("should not save User's information") {
                    expect(repository.getCurrentUser()).toEventually(beNil())
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
