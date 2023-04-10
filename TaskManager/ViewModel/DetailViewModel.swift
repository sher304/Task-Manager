//
//  DetailViewModel.swift
//  TaskManager
//
//  Created by Шермат Эшеров on 10/04/2023.
//

import Foundation

protocol DetailViewDelegate: AnyObject{
    func updatedId(id: Int16, delegate: DetailViewDelegate)
}


class DetailViewModel: DetailViewDelegate{
    
    let storageManager = StorageManager.shared
    
    static let shared = DetailViewModel()
    
    public func updateTask(title: String, description: String, hour: Int, minute: Int, day: Int){
        guard let settedId = settedId else { return }
        print(settedId, "first func")
//        storageManager.updateTask(id: settedId, newTitle: title, newDesciption: description, newHourStart: Int16(hour), newHourEnd: Int16(minute), newDay: Int16(day))
    }
    
    weak var delegate: DetailViewDelegate?
    
    var settedId: Int16?
    
    func updatedId(id: Int16, delegate: DetailViewDelegate) {
        print(id)
        self.settedId = id
    }
    
}
