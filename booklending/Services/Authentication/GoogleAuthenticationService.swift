//
//  GoogleAuthenticationService.swift
//  booklending
//

import Foundation
import PromiseKit

class GoogleAuthenticationService: NSObject {
    fileprivate let promise = Promise<User>.pending()
    fileprivate var provider: GoogleSignInProviderProtocol
    
    init(provider: GoogleSignInProviderProtocol = GoogleSignInProvider()) {
        self.provider = provider
        
        super.init()
        
        self.provider.config(delegate: self)
        self.provider.config(uiDelegate: self)
    }
}

extension GoogleAuthenticationService: AuthenticationService {
    func signIn() -> Promise<User> {
        self.provider.signIn()
        return self.promise.promise
    }
}

extension GoogleAuthenticationService: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!,
              didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            self.promise.reject(error)
            return
        }
        
        let email = user.profile.email
        let user = User(email: email!)
        self.promise.fulfill(user)
    }
}

extension GoogleAuthenticationService: GIDSignInUIDelegate {
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        UIApplication.shared.delegate?.window??.rootViewController?.present(viewController, animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        viewController.dismiss(animated: true, completion: nil)
    }
}
