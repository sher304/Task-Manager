//
//  StorageManager.swift
//  TaskManager
//
//  Created by Шермат Эшеров on 01/04/2023.
//

import UIKit
import CoreData
//MARK: CRUD


public final class StorageManager: NSObject{
    
    private static let shared = StorageManager()
    private override init() {}
    
    private var appDelegate: AppDelegate{
        UIApplication.shared.delegate as! AppDelegate
    }
    
    private var context: NSManagedObjectContext {
        appDelegate.persistentContainer.viewContext
    }
    
    
    //MARK: CREATE
    public func createTask(id: Int16, title: String?, description: String?,
                           dateStart: Int16, dateEnd: Int16, day: Int16){
        
        //MARK: Entity
        guard let taskEntityDescription = NSEntityDescription.entity(forEntityName: "Task", in: context) else { return }
        
        //MARK: Obj Entity
        let task = Task(entity: taskEntityDescription, insertInto: context)
        task.id = id
        task.title = title
        task.descr = description
        task.day = day
        task.dateStart = dateStart
        task.dateEnd = dateEnd
        
        //MARK: Save To DB
        appDelegate.saveContext()
    }
}
