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
    
    static let shared = CreateTaskViewModel()
    
    weak var delegate: HomeViewDelegate?
    
    func createTask( _ title: String, _ description: String,_ hour: Int,_ minute: Int,_ day: Int){
        let amountTask = (checkAmountOfTask() ?? 0) + 1
        storageManager.createTask(id: Int16(amountTask), title: title, description: description, hourStart: Int16(hour), hourEnd: Int16(minute), day: Int16(day))
        
        delegate?.taskDidSaved(task: storageManager.readTasks() ?? [])
    }
    
    func checkAmountOfTask() -> Int?{
        let dataTask = storageManager.readTasks()?.count
        return dataTask
    }
    
}
