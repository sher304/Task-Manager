//
//  HomeViewModel.swift
//  TaskManager
//
//  Created by Шермат Эшеров on 01/04/2023.
//

import Foundation

protocol HomeViewModelDelegate {
    func viewDidLoad()
    func saveTask(_ title: String, decsiption: String, id: Int, hourStart: Int, hourEnd: Int, day: Int)
}

class HomeViewModel: HomeViewModelDelegate{
    
    var task = Dynamic(TaskModel(title: "", desc: "", id: Int(), dateStart: Int(), dateEnd: Int(), day: Int()))
    
    var storeManager = StorageManager.shared
    
    func viewDidLoad(){
        storeManager.readTaskClosure(completion: { data in
            print(data.first?.title)
        })
        
    }
    
    func saveTask(_ title: String, decsiption: String, id: Int, hourStart: Int, hourEnd: Int, day: Int){
        storeManager.createTask(id: Int16(id), title: title, description: decsiption, hourStart: Int16(hourStart), hourEnd: Int16(hourEnd), day: Int16(day))
    }
    
    
    
}
