//
//  MyStorage.swift
//  Homework_Genegics
//
//  Created by Вика on 08/10/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

import Foundation

extension Result where Failure == MyStorage.CustomError {
    var description : String {
        switch self {
        case .failure(let err):
            return "Error: \(err.localizedDescription)"
        case .success(let res):
            return "Success: \(res)"
        }
    }
}

class MyStorage {
    
    enum CustomError: String, Error {
        case nilValue = "Value not found for this key"
        case wrongType = "Type of saved object is different"
        
        var localizedDescription: String {
            return self.rawValue
        }
    }
    
    static func receiveValue<T>(key: String) -> Result<T, CustomError> {
        guard let result1 = UserDefaults.standard.object(forKey: key) else {
            return .failure(.nilValue)
        }
        guard let result2 = result1 as? T else {
            return .failure(.wrongType)
        }
        return .success(result2)
    }
    
    static func saveValue<T>(value: T, key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
}
