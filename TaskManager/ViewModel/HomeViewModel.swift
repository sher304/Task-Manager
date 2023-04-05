//
//  HomeViewModel.swift
//  TaskManager
//
//  Created by Шермат Эшеров on 01/04/2023.
//

import Foundation

protocol HomeViewModelDelegate {
    func viewDidLoad()
}

class HomeViewModel: HomeViewModelDelegate{
    
    var task = Dynamic(TaskModel(title: "", desc: "", id: Int(), dateStart: Int(), dateEnd: Int(), day: Int()))
 
    var storeManager: StorageManager?
    
    func viewDidLoad(){
        print("hello world")
    }
    
}
