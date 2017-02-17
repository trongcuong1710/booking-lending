//
//  User.swift
//  booklending
//

import Foundation

class User: NSObject, NSCoding {
    var email: Email
    
    init(email: String) {
        self.email = Email(value: email)
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        let emailString = aDecoder.decodeObject(forKey: "email") as! String
        self.email = Email(value: emailString)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.email.value, forKey: "email")
    }
}
