//
//  UserDefaults+CustomObject.swift
//  booklending
//

import Foundation

extension UserDefaults {
    func set(customObject: Any?, forKey key: String) {
        guard let customObject = customObject else {
            /// Remove object from UserDefaults if attempting to set nil
            UserDefaults.standard.removeObject(forKey: key)
            return
        }
        
        let encodedObject = NSKeyedArchiver.archivedData(withRootObject: customObject)
        UserDefaults.standard.set(encodedObject, forKey: key)
    }
    
    func customObject(forKey key: String) -> Any? {
        guard let encodedObject = UserDefaults.standard.object(forKey: key) else { return nil }
        return NSKeyedUnarchiver.unarchiveObject(with: encodedObject as! Data)
    }
}
