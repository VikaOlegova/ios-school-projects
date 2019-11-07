//
//  NetworkService.swift
//  ImageDownloader
//
//  Created by Вика on 30/10/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

import Foundation

protocol NetworkServiceProtocol {
    func downloadData(from url: URL)
}

protocol NetworkServiceDelegate: AnyObject {
    func networkService(service: NetworkServiceProtocol, didLoad data: Data)
    func networkService(service: NetworkServiceProtocol, didFailWith error: Error)
}

class NetworkService: NetworkServiceProtocol {
    
    enum CustomError: LocalizedError {
        case unknownError
        
        var errorDescription: String? {
            return "Неизвестная ошибка"
        }
    }
    
    weak var delegate: NetworkServiceDelegate?
    
    private lazy var urlSession: URLSession = {
        // do not cache requests
        return URLSession(configuration: .ephemeral)
    }()
    
    func downloadData(from url: URL) {
        urlSession.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let currentData = data else {
                    let currentError = error ?? CustomError.unknownError
                    self.delegate?.networkService(service: self, didFailWith: currentError)
                    return
                }
                self.delegate?.networkService(service: self, didLoad: currentData)
            }
        }
        .resume()
    }
}
