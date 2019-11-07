//
//  Assembly.swift
//  ImageDownloader
//
//  Created by Вика on 30/10/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

import UIKit

class Assembly {
    
    func createScreen() -> UIViewController {
        let networkService = NetworkService()
        let urlProvider = URLProvider()
        let cache = DiskCache()
        let dataValidator = DataValidator()
        let interactor = Interactor(networkService: networkService,
                                    urlProvider: urlProvider,
                                    cacheService: cache,
                                    validator: dataValidator)
        let router = Router()
        let presenter = Presenter(interactor: interactor, router: router)
        let viewController = ViewController(presenter: presenter)
        
        networkService.delegate = interactor
        cache.delegate = interactor
        interactor.presenter = presenter
        presenter.view = viewController
        router.viewController = viewController
        
        return viewController
    }
}
