//
//  HomeViewModel.swift
//  TaskManager
//
//  Created by Шермат Эшеров on 01/04/2023.
//

import Foundation

protocol HomeViewDelegate: AnyObject {
    func taskDidSaved(task: [Task])
    
}

class HomeViewModel: HomeViewDelegate{
    
    var task = Dynamic([Task]())
    
    var storeManager = StorageManager.shared
    
    var createViewModel = CreateTaskViewModel.shared
    
    func viewDidLoad(){
        createViewModel.delegate = self
        storeManager.readTaskClosure(completion: { data in
            self.task.value = data
        })
    }
    
    func deleteTaskWithIndex(id: Int16){
        storeManager.deleteById(id: id)
    }
    
    func taskDidSaved(task: [Task]) {
        self.task.value = task
    }
}
