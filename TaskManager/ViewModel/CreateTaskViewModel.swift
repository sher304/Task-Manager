//
//  CreateTaskViewModel.swift
//  TaskManager
//
//  Created by Шермат Эшеров on 06/04/2023.
//

import Foundation


class CreateTaskViewModel{
    
    let storageManager = StorageManager.shared
    
    var taskData = Dynamic([Task]())
    
    func viewDidLoad(){
        storageManager.readTaskClosure { taskData in
            self.taskData.value = taskData
        }
    }
    
    func createTask( _ title: String, _ description: String,_ hour: Int,_ minute: Int,_ day: Int){
        
    }
}
