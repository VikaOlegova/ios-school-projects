//
//  CacheService.swift
//  ImageDownloader
//
//  Created by Вика on 30/10/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

import Foundation

protocol CacheServiceProtocol {
    func clear()
    func save(data: Data)
    func retrieveData()
}

protocol CacheServiceDelegate: AnyObject {
    func cacheService(service: CacheServiceProtocol, didRetrieve data: Data?)
}

class RAMCache: CacheServiceProtocol {
    
    weak var delegate: CacheServiceDelegate?
    
    private var data: Data?
    
    func clear() {
        data = nil
    }
    
    func save(data: Data) {
        self.data = data
    }
    
    func retrieveData() {
        delegate?.cacheService(service: self, didRetrieve: data)
    }
}

class DiskCache: CacheServiceProtocol {
    
    weak var delegate: CacheServiceDelegate?
    
    private let fileManager = FileManager.default
    private lazy var fileURL: URL = {
        let documentDirectory = try! fileManager.url(for: .cachesDirectory,
                                                     in: .userDomainMask,
                                                     appropriateFor: nil,
                                                     create: true)
        return documentDirectory.appendingPathComponent("image")
    }()
    
    func clear() {
        DispatchQueue.global().async {
            try? self.fileManager.removeItem(at: self.fileURL)
        }
    }
    
    func retrieveData() {
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: self.fileURL)
            DispatchQueue.main.async {
                self.delegate?.cacheService(service: self, didRetrieve: data)
            }
        }
    }
    
    func save(data: Data) {
        DispatchQueue.global().async {
            try? data.write(to: self.fileURL)
        }
    }
}
