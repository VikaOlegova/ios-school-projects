//
//  ViewController.swift
//  ButtonAnimation
//
//  Created by Вика on 17/10/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var size : CGSize {
        return self.view.bounds.size
    }
    
    lazy var button : UIButton = {
        let button = UIButton(type: .custom)
        
        if let image = UIImage(named: "icon_cat.png") {
            button.setImage(image, for: .normal)
        }
        
        button.frame.size = CGSize(width: 200, height: 200)
        button.center = CGPoint(x: size.width / 2, y: size.height / 2)
        
        button.addTarget(self, action:  #selector(tapButton), for:.touchDown)
        
        return button
    }()
    
    lazy var label : UILabel = {
        let label = UILabel()
        
        label.text = "Tap to get hypnotized"
        label.sizeToFit()
        label.center = CGPoint(x: size.width / 2, y: size.height / 2 + 300)
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = UIColor.white
        view.addSubview(button)
        view.addSubview(label)
    }
    
    @objc func tapButton() {
        let moveAnimation = CAKeyframeAnimation(keyPath: "position")
        moveAnimation.values = [CGPoint(x: 0, y: 0),
                                CGPoint(x: 0, y: -100),
                                CGPoint(x: -100, y: 0),
                                CGPoint(x: 0, y: 100),
                                CGPoint(x: 100, y: 0),
                                CGPoint(x: 0, y: -100),
                                CGPoint(x: 0, y: 0)]
        
        /// сглаживание изменения направления движения
        moveAnimation.calculationMode = .cubic
        /// задаем смещение относительно начальной позиции кнопки вместо абсолютных координат
        moveAnimation.isAdditive = true
        
        // ¯\_(ツ)_/¯
//       moveAnimation.tensionValues = [20,0.1,1,100,1,0.1,20]
        
        let scale = CABasicAnimation()
        scale.keyPath = "transform"
        scale.valueFunction = CAValueFunction(name: .scale)
        scale.fromValue = [1,1,1]
        scale.toValue = [2,2,2]
        
        let rotate = CABasicAnimation()
        rotate.keyPath = "transform.rotation.z"
        rotate.fromValue = 0
        rotate.toValue = CGFloat.pi * 20
        
        let fadeOut = CABasicAnimation(keyPath: "opacity")
        fadeOut.fromValue = 1
        fadeOut.toValue = 0

        let animation = CAAnimationGroup()
        animation.animations = [moveAnimation, scale, rotate, fadeOut]
        animation.duration = 6
        animation.autoreverses = true
        
        animation.delegate = self
        button.layer.add(animation, forKey: "animationGroup")
        
        let color = CAKeyframeAnimation(keyPath: "backgroundColor")
        color.values = [ UIColor.white.cgColor ]
            + stride(from: 0, to: 1, by: 0.1).map { UIColor(hue: $0, saturation: 1, brightness: 1, alpha: 1).cgColor }
        color.duration = animation.duration
        color.autoreverses = true
        view.layer.add(color, forKey: "colorAnimation")
    }
}

extension ViewController : CAAnimationDelegate {
    func animationDidStart(_ anim: CAAnimation) {
//        view.isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.5) {
            self.label.alpha = 0
        }
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
//        view.isUserInteractionEnabled = true
        
        if flag {
            UIView.animate(withDuration: 0.5) {
                self.label.alpha = 1
            }
        }
    }
}

