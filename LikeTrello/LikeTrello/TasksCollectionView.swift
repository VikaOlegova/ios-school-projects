//
//  TasksCollectionView.swift
//  LikeTrello
//
//  Created by Вика on 05/11/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

import UIKit
import EasyPeasy

class TasksCollectionView: UIView {
    
    private let collectionView = UICollectionView(frame: .zero,
                                                  collectionViewLayout: UICollectionViewFlowLayout())
    
    let dataSource: DragDropDataSource
    
    private let headerLabel = UILabel()
    
    init(title: String) {
        dataSource = DragDropDataSource(collectionView: collectionView)
        
        super.init(frame: .zero)
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        addSubview(stackView)
        stackView.easy.layout(Edges(5))
        
        stackView.addArrangedSubview(headerLabel)
        stackView.addArrangedSubview(collectionView)
        
        headerLabel.text = title
        headerLabel.textAlignment = .center
        
        collectionView.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        collectionView.register(Cell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = .white
        
        var r = SystemRandomNumberGenerator()
        collectionView.backgroundColor = UIColor(hue: CGFloat(r.next() % 255) / 255.0, saturation: 1, brightness: 1, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
