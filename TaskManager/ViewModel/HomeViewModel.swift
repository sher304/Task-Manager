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
    
    func getDateToValidate(day: String){
        let arrDay = Array(day)
        let day = Int16(String(arrDay[...1])) ?? 0
        let month = String(arrDay[3...])
        changeTaskDataDay(day: day, month: month)
    }
    
    func changeTaskDataDay(day: Int16, month: String){
        for data in self.task.value{
            var date = Array(String(data.day))
            if date.count == 3{
                date.insert("0", at: 0)
                print(date)
                let month = String(date[0...1])
                let day = String(date[2...])
                print(day)
            }else{
                
            }

//            print(day ?? 0, month ?? 0, "validate")
        }
    }
}
