//
//  HomeViewModel.swift
//  TaskManager
//
//  Created by Шермат Эшеров on 01/04/2023.
//

import Foundation

class HomeViewModel{

    var task = Dynamic([Task]())
    
    var storeManager = StorageManager.shared
    
    func viewDidLoad(){
        storeManager.readTaskClosure(completion: { data in
            self.task.value = data
        })
        
    } 
}
