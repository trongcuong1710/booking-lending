//
//  EmailSpecs.swift
//  booklending
//

import Foundation
import Quick
import Nimble
@testable import booklending

class EmailSpecs: QuickSpec {
    override func spec() {
        describe(".isSSSEmail") {
            context("when email domain is @siliconstraits.com") {
                it("should return true") {
                    let email = "trongcuong@siliconstraits.com"
                    
                    expect(Email(value: email).isSSSEmail()).to(beTrue())
                }
            }
            
            context("when email domain is @siliconstraits.vn") {
                it("should return true") {
                    let email = "trongcuong@siliconstraits.vn"
                    
                    expect(Email(value: email).isSSSEmail()).to(beTrue())
                }
            }
            
            context("when email domain is @ssf.vn") {
                it("should return true") {
                    let email = "trongcuong@ssf.vn"
                    
                    expect(Email(value: email).isSSSEmail()).to(beTrue())
                }
            }
            
            context("when email domain is @ssf.com.vn") {
                it("should return false") {
                    let email = "trongcuong@ssf.com.vn"
                    
                    expect(Email(value: email).isSSSEmail()).to(beFalse())
                }
            }
            
            context("when email domain is @siliconstraits.com.vn") {
                it("should return false") {
                    let email = "trongcuong@siliconstraits.com.vn"
                    
                    expect(Email(value: email).isSSSEmail()).to(beFalse())
                }
            }
            
            context("when email is empty") {
                it("should return false") {
                    let email = ""
                    
                    expect(Email(value: email).isSSSEmail()).to(beFalse())
                }
            }
        }
    }
}
