//
//  UserDefaults+CustomObjectSpecs.swift
//  booklending
//

import Foundation
import Quick
import Nimble
@testable import booklending

class UserDefaults_CustomObjectSpecs: QuickSpec {
    private let key = "testkey"
    
    override func spec() {
        afterEach {
            UserDefaults.standard.removeObject(forKey: self.key)
        }
        
        describe(".set(customObject:forKey)") {
            context("when attempt to set nil") {
                it("should not set value to UserDefaults") {
                    UserDefaults.standard.set(customObject: nil, forKey: self.key)
                    
                    expect(UserDefaults.standard.object(forKey: self.key)).to(beNil())
                }
            }
            
            context("when attempt to set non-nil object") {
                it("should be able to retrieve that object and its original data") {
                    let user = User(email: "trongcuong@siliconstraits.com")
                    UserDefaults.standard.set(customObject: user, forKey: self.key)
                    let encodedData = UserDefaults.standard.object(forKey: self.key)
                    
                    expect(encodedData as? Data).toNot(beNil())
                    
                    let decodedObject = NSKeyedUnarchiver.unarchiveObject(with: encodedData as! Data)
                    
                    expect((decodedObject as? User)?.email.value).to(equal(user.email.value))
                }
            }
        }
        
        describe(".customObject(forKey:)") {
            context("when object is not available") {
                it("should return nil") {
                    expect(UserDefaults.standard.customObject(forKey: self.key)).to(beNil())
                }
            }
            
            context("when object is available") {
                it("should return object and its origin data") {
                    let user = User(email: "trongcuong@siliconstraits.com")
                    let encodedObject = NSKeyedArchiver.archivedData(withRootObject: user)
                    UserDefaults.standard.set(encodedObject, forKey: self.key)
                    let customObject = UserDefaults.standard.customObject(forKey: self.key)
                    
                    expect(customObject).toNot(beNil())
                    expect((customObject as? User)?.email.value).to(equal(user.email.value))
                }
            }
        }
    }
}
