//
//  AuthenticationPresenterSpecs.swift
//  booklending
//

import Foundation
import Quick
import Nimble
@testable import booklending

class AuthenticationPresenterSpecs: QuickSpec {
    override func spec() {
        describe(".signIn") {
            context("sign in success") {
                it("should call view's authenticationSucceed(user:) method with instance of User as argument") {
                    let interactor = MockAuthenticationInteractor(resultType: .Success)
                    let presenter = AuthenticationPresenter(interactor: interactor)
                    let view = TestedAuthenticationView(presenter: presenter)
                    
                    presenter.signInButtonDidTouch()
                    
                    expect(view.error).to(beNil())
                    expect(view.user).toNot(beNil())
                    expect(view.user?.email.value).to(equal("trongcuong@siliconstraits.com"))
                }
            }
            
            context("sign in failed") {
                it("should call view's show(error:) method with Error as argument") {
                    let interactor = MockAuthenticationInteractor(resultType: .Failed)
                    let presenter = AuthenticationPresenter(interactor: interactor)
                    let view = TestedAuthenticationView(presenter: presenter)
                    
                    presenter.signInButtonDidTouch()
                    
                    expect(view.user).to(beNil())
                    expect(view.error).toNot(beNil())
                    expect(view.error?.localizedDescription).to(equal("Sign in with google failed"))
                }
            }
        }
    }
}

class TestedAuthenticationView: AuthenticationViewProtocol {
    private(set) var presenter: AuthenticationPresenterProtocol
    private(set) var error: Error?
    private(set) var user: User?
    
    init(presenter: AuthenticationPresenterProtocol) {
        self.presenter = presenter
        self.presenter.view = self
    }
    
    func show(error: Error) {
        self.error = error
    }
    
    func authenticationSucceed(user: User) {
        self.user = user
    }
}
