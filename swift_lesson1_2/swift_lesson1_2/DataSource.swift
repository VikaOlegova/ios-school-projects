//
//  DataSource.swift
//  swift_lesson1_2
//
//  Created by Вика on 18/10/2019.
//  Copyright © 2019 16817252. All rights reserved.
//

import UIKit

protocol CellForData {
    func setup(data: Any)
}

class DataSource : NSObject, UITableViewDataSource, UITableViewDelegate {
    
    weak var navigationController: UINavigationController?
    
    private let data: [[EditableTitle]]
    
    var s0 = [BigCellData(title: "Sign in to your iPhone",
                          subtitle: "Set up iCloud, the App Store, and more.",
                          icon: UIImage(named: "man")!)]
    
    var s1 = [SmallCellData(title: "General", icon: UIImage(named: "setting")!),
              SmallCellData(title: "Privacy", icon: UIImage(named: "hand")!)]

    var s2 = [SmallCellData(title: "Passwords & Accounts", icon: UIImage(named: "key")!)]

    var s3 = [SmallCellData(title: "Maps", icon: UIImage(named: "map")!),
              SmallCellData(title: "Safari", icon: UIImage(named: "compass")!),
              SmallCellData(title: "News", icon: UIImage(named: "news")!),
        SmallCellData(title: "Siri", icon: UIImage(named: "siri")!),
        SmallCellData(title: "Photos", icon: UIImage(named: "photo")!),
        SmallCellData(title: "Game Center", icon: UIImage(named: "game")!)]
    
    var s4 = [SmallCellData(title: "Developer", icon: UIImage(named: "hammer")!)]
    
    init(navigationController: UINavigationController ) {
        data = [s0, s1, s2, s3, s4]
        self.navigationController = navigationController
        
        super.init()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellData = data[indexPath.section][indexPath.row]
        let cellIdentifier = String(describing: type(of: cellData))
        
        let anyCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                    for: indexPath)
        let cell = anyCell as! CellForData
        cell.setup(data: cellData)
        return anyCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cellData = data[indexPath.section][indexPath.row]
        navigationController?.pushViewController(EditViewController(cellData: cellData), animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let defaultV: CGFloat = 20.0
        return [1, 4].contains(section) ? defaultV * 2.3 : defaultV
    }
}
