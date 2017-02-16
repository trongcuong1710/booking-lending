//
//  GoogleAuthenticationServiceSpecs.swift
//  booklending
//

import Foundation
import Quick
import Nimble

@testable import booklending

class GoogleAuthenticationServiceSpec: QuickSpec {
    override func spec() {
        describe(".signIn") {
            context("sign in success") {
                it("should fulfill with user model") {
                    let service = GoogleAuthenticationService(provider: MockGoogleSignInProvider(resultType: .Success))
                    service.signIn().then { user in
                        expect(user.email).to(equal("trongcuong@siliconstraits.com"))
                    }.catch { error in
                        fail("Case sign in success failed. Expect to fulfill with user model but throw error instead.")
                    }
                }
            }
            
            context("sign in failed") {
                it("should throw error") {
                    let service = GoogleAuthenticationService(provider: MockGoogleSignInProvider(resultType: .Failed))
                    service.signIn().then { user in
                        fail("Case sign in failed failed. Expect to throw error but fulfilled with user model instead.")
                    }.catch { error in
                        expect(error.localizedDescription).to(equal("Sign in with google failed."))
                    }
                }
            }
        }
    }
}

