//
//  BigCell.swift
//  swift_lesson1_2
//
//  Created by Вика on 21/10/2019.
//  Copyright © 2019 16817252. All rights reserved.
//

import UIKit
import Masonry

extension UIColor {
    static var lightBlue: UIColor {
        return UIColor(red: 0, green: 122/255.0, blue: 1, alpha: 1)
    }
}

class BigCellData {
    var title : String
    var subtitle : String
    let icon : UIImage
    
    init(title: String, subtitle: String, icon: UIImage) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
    }
}

class BigCell: UITableViewCell, CellForData {
    
    let iconImageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    func setup(data: Any) {
        guard let data = data as? BigCellData else { return }
        
        titleLabel.text = data.title
        subtitleLabel.text = data.subtitle
        iconImageView.image = data.icon
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        let container = UIView()
        
        container.addSubview(titleLabel)
        container.addSubview(subtitleLabel)
        contentView.addSubview(container)
        contentView.addSubview(iconImageView)
        
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .lightBlue
        subtitleLabel.textColor = .gray
        subtitleLabel.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        
        iconImageView.mas_makeConstraints({ (make) in
            make?.width.height()?.equalTo()(60)
            make?.centerY.equalTo()(contentView)?.inset()(5)
            make?.left.equalTo()(contentView)?.inset()(18)
            make?.top.greaterThanOrEqualTo()(contentView)?.inset()(5)
            make?.bottom.lessThanOrEqualTo()(contentView)?.inset()(5)
        })
        
        titleLabel.mas_makeConstraints { (make) in
            make?.left.top()?.right()?.equalTo()(container)
        }
        
        subtitleLabel.mas_makeConstraints { (make) in
            make?.top.equalTo()(titleLabel.mas_bottom)?.inset()(2.5)
            make?.left.bottom()?.right()?.equalTo()(container)
        }
        
        container.mas_makeConstraints { (make) in
            make?.left.equalTo()(iconImageView.mas_right)?.inset()(12)
            make?.right.equalTo()(contentView)?.inset()(12)
            make?.top.greaterThanOrEqualTo()(contentView)?.inset()(5)
            make?.bottom.lessThanOrEqualTo()(contentView)?.inset()(5)
            make?.centerY.equalTo()(contentView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

