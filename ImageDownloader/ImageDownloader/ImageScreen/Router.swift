//
//  Router.swift
//  ImageDownloader
//
//  Created by Вика on 30/10/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

import UIKit

protocol RouterInput {
    func show(error: Error)
    func showDownloadCompleted()
}

class Router: RouterInput {
    
    weak var viewController: UIViewController?
    
    private func showAlert(title: String, message: String? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let defaultAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (action) in
        }
        alert.addAction(defaultAction)
        
//        guard let controller = viewController else { return }
//        alert.show(controller, sender: self)
        viewController?.present(alert, animated: true, completion: nil)
    }
    
    func show(error: Error) {
        showAlert(title: "Ошибка", message: error.localizedDescription)
    }
    
    func showDownloadCompleted() {
        showAlert(title: "Изображение успешно загружено")
    }
}


