//
//  DataValidator.swift
//  ImageDownloader
//
//  Created by Вика on 30/10/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

import UIKit

protocol DataValidatorProtocol {
    func validate(data: Data) -> Bool
}

class DataValidator: DataValidatorProtocol {
    
    func validate(data: Data) -> Bool {
        return UIImage(data: data) != nil
    }
}
