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
        let month = Int16(String(arrDay[3...])) ?? 0
        filterTaskDay(day: day, month: month)
    }
    
    func filterTaskDay(day: Int16, month: Int16){
        for data in self.task.value{
            let date = Array(String(data.day))
            let monthData = Int16(String(date[0])) ?? 0
            let dayData = Int16(String(date[1...])) ?? 0
            if day == dayData && month == monthData{
                print("same")
                let sameData = Int16("\(month)\(day)") ?? 0
                let filtredId = self.task.value.first(where: {$0.day == sameData})?.id ?? 0
                readFiltredTask(id: filtredId)
            }else{
                readFiltredTask(id: 0)
            }
        }
    }
    
    func readFiltredTask(id: Int16){
        storeManager.readTaskClosure(id: id) { taskData in
            self.task.value = [taskData]
        }
    }
    
    
    
}

