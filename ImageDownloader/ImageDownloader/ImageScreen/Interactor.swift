//
//  Interactor.swift
//  ImageDownloader
//
//  Created by Вика on 30/10/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

import Foundation

protocol InteractorInput {
    func downloadImage()
    func clearCache()
    func retrieveImageFromCache()
}

protocol InteractorOutput: AnyObject {
    func didDownloadCorrectData()
    func handle(error: Error)
    func handle(data: Data)
    func hideImage()
}

class Interactor: InteractorInput {
    
    weak var presenter: InteractorOutput?
    
    let networkService: NetworkServiceProtocol
    let urlProvider: URLProviderProtocol
    let cacheService: CacheServiceProtocol
    let validator: DataValidatorProtocol
    
    init(networkService: NetworkServiceProtocol,
         urlProvider: URLProviderProtocol,
         cacheService: CacheServiceProtocol,
         validator: DataValidatorProtocol) {
        self.networkService = networkService
        self.urlProvider = urlProvider
        self.cacheService = cacheService
        self.validator = validator
    }
    
    func downloadImage() {
        guard let url = urlProvider.imageURL else { return }
        networkService.downloadData(from: url)
        
    }
    
    func clearCache() {
        cacheService.clear()
        presenter?.hideImage()
    }
    
    func retrieveImageFromCache() {
        cacheService.retrieveData()
    }
}

extension Interactor: CacheServiceDelegate {
    
    enum CustomError: LocalizedError {
        case emptyCache
        case downloadedWrongData
        
        var errorDescription: String? {
            switch self {
            case .emptyCache:
                return "Кэш пуст"
            case .downloadedWrongData:
                return "Скачанные данные не являются картинкой"
            }
        }
    }
    
    func cacheService(service: CacheServiceProtocol, didRetrieve data: Data?) {
        guard let cacheData = data else {
            presenter?.handle(error: CustomError.emptyCache)
            return
        }
        presenter?.handle(data: cacheData)
    }
}

extension Interactor: NetworkServiceDelegate {
    
    func networkService(service: NetworkServiceProtocol, didLoad data: Data) {
        guard validator.validate(data: data) else {
            presenter?.handle(error: CustomError.downloadedWrongData)
            return
        }
        cacheService.save(data: data)
        presenter?.didDownloadCorrectData()
    }
    
    func networkService(service: NetworkServiceProtocol, didFailWith error: Error) {
        presenter?.handle(error: error)
    }
}
