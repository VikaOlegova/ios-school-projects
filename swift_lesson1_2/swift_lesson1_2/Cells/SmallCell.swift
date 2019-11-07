//
//  SmallCell.swift
//  swift_lesson1_2
//
//  Created by Вика on 21/10/2019.
//  Copyright © 2019 16817252. All rights reserved.
//

import UIKit
import Masonry

class SmallCellData {
    var title : String
    let icon : UIImage
    
    init(title: String, icon: UIImage) {
        self.title = title
        self.icon = icon
    }
}

class SmallCell: UITableViewCell, CellForData {
    
    let iconImageView = UIImageView()
    let titleLabel = UILabel()
    
    func setup(data: Any) {
        guard let data = data as? SmallCellData else { return }
        
        titleLabel.text = data.title
        iconImageView.image = data.icon
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(iconImageView)
        
        titleLabel.numberOfLines = 0
        
        iconImageView.mas_makeConstraints({ (make) in
            make?.width.height()?.equalTo()(30)
            make?.centerY.equalTo()(contentView)
            make?.left.equalTo()(contentView)?.inset()(18)
            make?.top.greaterThanOrEqualTo()(contentView)?.inset()(5)
            make?.bottom.lessThanOrEqualTo()(contentView)?.inset()(5)
        })
        
        titleLabel.mas_makeConstraints { (make) in
            make?.left.equalTo()(iconImageView.mas_right)?.inset()(12)
            make?.right.equalTo()(contentView)?.inset()(12)
            make?.centerY.equalTo()(contentView)
            make?.top.greaterThanOrEqualTo()(contentView)?.inset()(5)
            make?.bottom.lessThanOrEqualTo()(contentView)?.inset()(5)
        }
        
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

