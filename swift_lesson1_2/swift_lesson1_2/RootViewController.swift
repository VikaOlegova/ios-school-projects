//
//  File.swift
//  swift_lesson1_2
//
//  Created by 16817252 on 14/10/2019.
//  Copyright © 2019 16817252. All rights reserved.
//

import Foundation
import UIKit


class RootViewController: UIViewController {
    
    lazy var dataSource = DataSource(navigationController: self.navigationController!)
    
    let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationItem.title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // регистрируем свой класс ячейки в таблицу
        tableView.register(SmallCell.self, forCellReuseIdentifier: String(describing: SmallCellData.self))
        tableView.register(BigCell.self, forCellReuseIdentifier: String(describing: BigCellData.self))
        tableView.dataSource = dataSource
        tableView.contentInset.top = 20.0
        tableView.delegate = dataSource
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        
        tableView.mas_makeConstraints { (make) in
            make?.edges.equalTo()(view)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
}
