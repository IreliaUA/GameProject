//
//  FirebaseManager.swift
//  GameProject
//
//  Created by Ира on 25.01.2024.
//

import Foundation
import Firebase

class FirebaseManager {
    
    static let shared = FirebaseManager()
    
    
    func getSettings(completion: ((Bool) -> Void)?) {
        let ref = Database.database().reference().child("isOn")
        
        ref.observeSingleEvent(of: .value) { (snapshot)  in
            if let isOn = snapshot.value as? Bool {
                completion?(isOn)
            } else {
                completion?(false)
            }
        }
    }
}
