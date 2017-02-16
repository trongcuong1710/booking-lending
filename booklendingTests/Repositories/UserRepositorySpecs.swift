//
//  UserRepositorySpecs.swift
//  booklending
//

import Foundation
import Quick
import Nimble
@testable import booklending

class UserRepositorySpecs: QuickSpec {
    private var repository = UserRepository()
    
    override func spec() {
        beforeEach {
            UserDefaults.standard.removeObject(forKey: NSUserDefaultCurrentUserKey)
        }
        
        describe(".saveUser(user:)") {
            it("should be able to retrieve back User object and its original information using UserDefaults") {
                let user = User(email: "trongcuong@siliconstraits.com")
                self.repository.save(user: user)
                
                guard let encodedData = UserDefaults.standard.object(forKey: NSUserDefaultCurrentUserKey) as? Data else {
                    fail("could not be able to retrieve back user data from UserDefaults")
                    return
                }
                
                let customObject = NSKeyedUnarchiver.unarchiveObject(with: encodedData)
                
                expect((customObject as? User)?.email).to(equal(user.email))
            }
        }
        
        describe(".deleteUser") {
            it("should return nil when retrieve from UserDefaults") {
                let user = User(email: "trongcuong@siliconstraits.com")
                let encodedData = NSKeyedArchiver.archivedData(withRootObject: user)
                UserDefaults.standard.set(encodedData, forKey: NSUserDefaultCurrentUserKey)
                self.repository.deleteUser()
                
                expect(UserDefaults.standard.object(forKey: NSUserDefaultCurrentUserKey)).to(beNil())
            }
        }
        
        describe(".getCurrentUser") {
            context("when current user is not available") {
                it("should return nil") {
                    expect(self.repository.getCurrentUser()).to(beNil())
                }
            }
            
            context("when current user is available") {
                it("should be able to retrive back User object") {
                    let user = User(email: "trongcuong@siliconstraits.com")
                    let encodedData = NSKeyedArchiver.archivedData(withRootObject: user)
                    UserDefaults.standard.set(encodedData, forKey: NSUserDefaultCurrentUserKey)
                    
                    let currentUser = self.repository.getCurrentUser()
                    
                    expect(currentUser).toNot(beNil())
                    expect(currentUser?.email).to(equal(user.email))
                }
            }
        }
    }
}
