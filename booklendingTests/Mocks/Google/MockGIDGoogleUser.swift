//
//  MockGIDGoogleUser.swift
//  booklending
//

import Foundation

class MockGIDGoogleUser: GIDGoogleUser {
    override var profile: GIDProfileData! {
        return MockGIDProfileData()
    }
}
