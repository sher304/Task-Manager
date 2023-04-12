//
//  DetailViewModel.swift
//  TaskManager
//
//  Created by Шермат Эшеров on 10/04/2023.
//

import Foundation

protocol DetailViewDelegate: AnyObject{
    func updatedId(id: Int16, delegate: DetailViewDelegate)
    
}


class DetailViewModel{
    
    let storageManager = StorageManager.shared
    
    static let shared = DetailViewModel()
    
    var task = Dynamic([Task]())
    
    weak var delegate: HomeViewModelDelegate?
    
    func viewDidLoad(){
        storageManager.readTaskClosure(id: settedId ?? 0) { task in
            self.task.value = [task]
        }
    }
    
    var settedId: Int16?
    
    public func updateTask(title: String, description: String, hour: Int, minute: Int, day: Int){
        guard let settedId = settedId else { return }
        storageManager.updateTask(id: settedId, newTitle: title, newDesciption: description, newHourStart: Int16(hour), newHourEnd: Int16(minute), newDay: Int16(day))
        
        delegate?.taskDidSaved(task: storageManager.readTasks() ?? [])
        
    }
}
