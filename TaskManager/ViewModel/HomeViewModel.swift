//
//  HomeViewModel.swift
//  TaskManager
//
//  Created by Шермат Эшеров on 01/04/2023.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func taskDidSaved(task: [Task])
    func updatedId(id: Int16)
    
}

class HomeViewModel: HomeViewModelDelegate{
    
    var task = Dynamic([Task]())
    
    var storeManager = StorageManager.shared
    
    var createViewModel = CreateTaskViewModel.shared
    
    var detailViewModel = DetailViewModel.shared
    
    func viewDidLoad(){
        detailViewModel.delegate = self
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
    
    func updatedId(id: Int16){
        self.detailViewModel.settedId = id
    }
}
