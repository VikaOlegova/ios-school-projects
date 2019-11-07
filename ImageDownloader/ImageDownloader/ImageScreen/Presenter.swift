//
//  Presenter.swift
//  ImageDownloader
//
//  Created by Вика on 29/10/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

import UIKit

protocol PresenterInput {
    func viewDidLoad()
    func didTapDownloadButton()
    func didTapShowButton()
    func didTapClearCacheButton()
}

protocol PresenterOutput: AnyObject {
    func showImage(image: UIImage)
    func hideImage()
}

class Presenter: PresenterInput {
    
    weak var view: PresenterOutput?
    
    let interactor: InteractorInput
    let router: RouterInput
    
    init(interactor: InteractorInput, router: RouterInput) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() { }
    
    func didTapDownloadButton() {
        interactor.downloadImage()
    }
    
    func didTapShowButton() {
        interactor.retrieveImageFromCache()
    }
    
    func didTapClearCacheButton() {
        interactor.clearCache()
    }
}

extension Presenter: InteractorOutput {
    
    func hideImage() {
        view?.hideImage()
    }
    
    func handle(data: Data) {
        guard let image = UIImage(data: data) else { return }
        view?.showImage(image: image)
    }
    
    func handle(error: Error) {
        router.show(error: error)
    }
    
    func didDownloadCorrectData() {
        router.showDownloadCompleted()
    }
}
