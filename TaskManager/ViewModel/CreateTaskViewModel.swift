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
    
    func createTask(_ id:Int, _ title: String, _ description: String,_ hour: Int,_ Minute: Int,_ day: Int){
//        let generatedId = UUID().uuidString.replacingOccurrences(of: "-", with: "")

        let generatedId = UUID().uuid
        print(generatedId)
        // Output: 8D31B96A-02AC-4531-976F-A455686F8FE2
//        storageManager.createTask(id: identifier, title: title, description: description, hourStart: Int16(hour), hourEnd: Int16(Minute), day: Int16(day))
    }
    
}
