//
//  CreateTaskViewModel.swift
//  TaskManager
//
//  Created by Шермат Эшеров on 06/04/2023.
//

import Foundation
import RxSwift

class CreateTaskViewModel{
    
    let storageManager = StorageManager.shared
    
    func createTask( _ title: String, _ description: String,_ hour: Int,_ minute: Int,_ day: Int){
//        let amountTask = (checkAmountOfTask() ?? 0) + 1
//        storageManager.createTask(id: Int16(amountTask), title: title, description: description, hourStart: Int16(hour), hourEnd: Int16(minute), day: Int16(day))
//
//        print(storageManager.readTasks())
//        print(storageManager.readTasks().map({$0}))
    }
    
    func checkAmountOfTask() -> Int?{
        let dataTask = storageManager.readTasks()?.count
        return dataTask
    }
    
}
