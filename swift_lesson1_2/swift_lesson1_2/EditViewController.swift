//
//  EditViewController.swift
//  swift_lesson1_2
//
//  Created by Вика on 21/10/2019.
//  Copyright © 2019 16817252. All rights reserved.
//

import UIKit

protocol EditableTitle {
    var title: String { get set }
}

extension SmallCellData: EditableTitle {}
extension BigCellData: EditableTitle {}

class EditViewController: UIViewController {
    
    let textView = UITextView()
    var cellData: EditableTitle
    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(buttonTapped))
    
    init(cellData: EditableTitle) {
        self.cellData = cellData
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textView)
        
        navigationItem.rightBarButtonItem = doneButton
        navigationItem.title = "Edit cell"
        
        view.backgroundColor = .lightGray
        
        textView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textView.layer.cornerRadius = 10
        textView.font = UIFont.systemFont(ofSize: UIFont.labelFontSize)
        textView.text = cellData.title
        textView.becomeFirstResponder() // перенос фокуса
        
        textView.mas_makeConstraints { (make) in
            make?.left.right()?.equalTo()(view)?.inset()(20)
            make?.top.equalTo()(view.mas_safeAreaLayoutGuideTop)?.inset()(20)
            make?.height.equalTo()(250)
        }
    }
    
    @objc func buttonTapped() {
        cellData.title = textView.text
        navigationController?.popViewController(animated: true)
    }
}
