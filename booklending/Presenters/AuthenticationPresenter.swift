//
//  AuthenticationPresenter.swift
//  booklending
//

import Foundation

class AuthenticationPresenter {
    var interactor: AuthenticationInteractorProtocol
    weak var view: AuthenticationViewProtocol?
    
    init(interactor: AuthenticationInteractorProtocol = AuthenticationInteractor()) {
        self.interactor = interactor
        self.interactor.output = self
    }
}

extension AuthenticationPresenter: AuthenticationPresenterProtocol {
    func signInButtonDidTouch() {
        self.interactor.signIn()
    }
}

extension AuthenticationPresenter: AuthenticationOutput {
    func onAuthenticationSucceed(_ user: User) {
        self.view?.authenticationSucceed(user: user)
    }
    
    func onAuthenticationFailed(_ error: Error) {
        self.view?.show(error: error)
    }
}
