//
//  Cell.swift
//  LikeTrello
//
//  Created by Вика on 05/11/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

import UIKit
import EasyPeasy

class Cell: UICollectionViewCell {
    
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(label)
        label.easy.layout(Left(5), Right(5), CenterY())
        
        label.numberOfLines = 0
        
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 10
        layer.backgroundColor = UIColor.white.cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show(text: String) {
        label.attributedText = Cell.attributed(text: text)
    }
    
    static func height(with width: CGFloat, text: String) -> CGFloat {
        let sizeLimit = CGSize(width: width - 10,
                               height: CGFloat.greatestFiniteMagnitude)
        
        let attributed = self.attributed(text: text)
        let rect = attributed.boundingRect(with: sizeLimit, options: [.usesLineFragmentOrigin], context: nil)
        
        return rect.height + 10
    }
    
    private static func attributed(text: String) -> NSAttributedString {
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineBreakMode = .byWordWrapping
        return NSAttributedString(string: text,
                                  attributes: [
                                    .font : UIFont.systemFont(ofSize: UIFont.labelFontSize),
                                    .paragraphStyle : paragraph
            ])
    }
}
