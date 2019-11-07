//
//  ViewController.swift
//  LikeTrello
//
//  Created by Вика on 31/10/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

import UIKit
import EasyPeasy

class ViewController: UIViewController {
    
    let stackView = UIStackView()
    let tasksCollectionViews = [TasksCollectionView(title: "To Do"),
                                TasksCollectionView(title: "In Progress"),
                                TasksCollectionView(title: "In Review"),
                                TasksCollectionView(title: "Done")]
    
    private lazy var addButton = UIBarButtonItem(barButtonSystemItem: .add,
                                                 target: self,
                                                 action: #selector(didTapAdd))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.title = "Tasks"
        navigationItem.rightBarButtonItem = addButton
        
        view.addSubview(stackView)
        stackView.easy.layout(Top().to(view.safeAreaLayoutGuide, .top),
                              Left().to(view.safeAreaLayoutGuide, .left),
                              Right().to(view.safeAreaLayoutGuide, .right),
                              Bottom().to(view.safeAreaLayoutGuide, .bottom))
        
        stackView.axis = .horizontal
        
        tasksCollectionViews.forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let w = stackView.bounds.width / 4
        
        tasksCollectionViews.forEach {
            $0.easy.layout(Width(w))
        }
    }
    
    @objc func didTapAdd() {
        let alert = UIAlertController(title: "Add Task", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Task title"
        }
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { (action) in
            guard let textField = alert.textFields?.first,
                let text = textField.text,
                text != "" else { return }
            
            let task = Task(title: text)
            self.tasksCollectionViews[0].dataSource.insert(task, at: nil, from: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
