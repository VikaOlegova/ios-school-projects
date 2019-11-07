//
//  DragDropDataSource.swift
//  LikeTrello
//
//  Created by Вика on 05/11/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

import UIKit

class DragDropDataSource: NSObject {
    
    let collectionView: UICollectionView
    
    var data = [Task]()
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        
        super.init()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.dragDelegate = self
        collectionView.dropDelegate = self
        collectionView.dragInteractionEnabled = true
    }
    
    func insert(_ task: Task, at optionalIndexPath: IndexPath?, from originDataSource: DragDropDataSource?) {
        originDataSource?.remove(task)
        
        // Индекс места, в которое мы дропнули элемент.
        // Иногда может быть nil, в таком случае просто кидаем в конец списка.
        let indexPath = optionalIndexPath ?? IndexPath(item: data.count, section: 0)
        // Когда удаляем из себя
        let row = min(indexPath.row, data.count)
        data.insert(task, at: row)
        collectionView.insertItems(at: [IndexPath(row: row, section: 0)]) // анимация вставки
    }
    
    func remove(_ task: Task) {
        if let index = data.firstIndex(where: { $0 === task }) {
            data.remove(at: index)
            collectionView.deleteItems(at: [IndexPath(row: index, section: 0)]) // анимация удаления
        }
    }
}

extension DragDropDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
        cell.show(text: data[indexPath.row].title)
        return cell
    }
}

extension DragDropDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let task = data[indexPath.row]
        let width = collectionView.frame.size.width - 10
        let height = Cell.height(with: width, text: task.title)
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

extension DragDropDataSource: UICollectionViewDragDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        itemsForBeginning session: UIDragSession,
                        at indexPath: IndexPath) -> [UIDragItem] {
        let task = data[indexPath.row]
        let dragItem = UIDragItem(itemProvider: NSItemProvider(object: "fake" as NSString))
        dragItem.localObject = task
        session.localContext = self
        return [dragItem]
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        dragSessionIsRestrictedToDraggingApplication session: UIDragSession) -> Bool {
        return true
    }
}

extension DragDropDataSource: UICollectionViewDropDelegate {
    
    func collectionView(_ collectionView: UICollectionView, canHandle session: UIDropSession) -> Bool {
        return session.items.first?.localObject as? Task != nil
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        dropSessionDidUpdate session: UIDropSession,
                        withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        return UICollectionViewDropProposal(operation: .move,
                                            intent: .insertAtDestinationIndexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        performDropWith coordinator: UICollectionViewDropCoordinator) {
        
        let destinationIndexPath = coordinator.destinationIndexPath
        
        guard
            case .move = coordinator.proposal.operation,
            let item = coordinator.items.first,
            let task = item.dragItem.localObject as? Task,
            let originDataSource = coordinator.session.localDragSession?.localContext as? DragDropDataSource
            else { return }
        
        insert(task, at: destinationIndexPath, from: originDataSource)
    }
}
