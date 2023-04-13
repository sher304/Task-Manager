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
    
    weak var delegate: HomeViewModelDelegate?
    
    func createTask( _ title: String, _ description: String,_ hour: Int,_ minute: Int,_ day: String){
        let amountTask = (checkAmountOfTask() ?? 0) + 1
        let joinedData = getDayToJoin(dayMonth: day)
        storageManager.createTask(id: Int16(amountTask), title: title, description: description, hourStart: Int16(hour), hourEnd: Int16(minute), day: joinedData)
        delegate?.taskDidSaved(task: storageManager.readTasks() ?? [])
    }
    
    func getDayToJoin(dayMonth: String) -> Int16{
        return Int16(dayMonth) ?? 0
        
    }
    
    func checkAmountOfTask() -> Int?{
        let dataTask = storageManager.readTasks()?.count
        return dataTask
    }
    
}
