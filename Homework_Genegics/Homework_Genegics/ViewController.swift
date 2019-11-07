//
//  ViewController.swift
//  Homework_Genegics
//
//  Created by Вика on 07/10/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        MyStorage.saveValue(value: 10, key: "currentLevel")
//        MyStorage.saveValue(value: "Some String", key: "currentLevelString")
        
        let intValue: Result<Int, MyStorage.CustomError> = MyStorage.receiveValue(key: "currentLevel")
        let wrongTypeValue: Result<String, MyStorage.CustomError> = MyStorage.receiveValue(key: "currentLevel")
        let stringValue: Result<String, MyStorage.CustomError> = MyStorage.receiveValue(key: "currentLevelString")
        let nilValue: Result<String, MyStorage.CustomError> = MyStorage.receiveValue(key: "alala")
        
        print(intValue.description)
        print(wrongTypeValue.description)
        print(stringValue.description)
        print(nilValue.description)
    }
}

