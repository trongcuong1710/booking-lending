//
//  Email.swift
//  booklending
//

import Foundation

struct Email {
    private(set) var value: String!
    
    init(value: String) {
        self.value = value
    }
    
    func isSSSEmail() -> Bool {
        return self.value.hasSuffix("@siliconstraits.com") ||
               self.value.hasSuffix("@siliconstraits.vn") ||
               self.value.hasSuffix("@ssf.vn")
    }
}
