//
//  User.swift
//  booklending
//

import Foundation

class User: NSObject, NSCoding {
    var email: String
    
    init(email: String) {
        self.email = email
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.email = aDecoder.decodeObject(forKey: "email") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.email, forKey: "email")
    }
}
