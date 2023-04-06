//
//  CreateTaskViewModel.swift
//  TaskManager
//
//  Created by Шермат Эшеров on 06/04/2023.
//

import Foundation


class CreateTaskViewModel{
    
    static let shared = CreateTaskViewModel()
    
    let storageManager = StorageManager.shared
    
    var taskData = Dynamic([Task]())
    
    func viewDidLoad(){
        storageManager.readTaskClosure { taskData in
            self.taskData.value = taskData
        }
    }
    
    func createTask(_ id:Int, _ title: String, _ description: String,_ hour: Int,_ Minute: Int,_ day: Int){
        storageManager.createTask(id: Int16(id), title: title, description: description, hourStart: Int16(hour), hourEnd: Int16(Minute), day: Int16(day))
    }
    
}
