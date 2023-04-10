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
    
    static let shared = StorageManager()
    private override init() {}
    
    private var appDelegate: AppDelegate{
        UIApplication.shared.delegate as! AppDelegate
    }
    
    private var context: NSManagedObjectContext {
        appDelegate.persistentContainer.viewContext
    }
    
    
    //MARK: CREATE
    public func createTask(id: Int16, title: String?, description: String?,
                           hourStart: Int16, hourEnd: Int16, day: Int16){
        //MARK: Entity
        guard let taskEntityDescription = NSEntityDescription.entity(forEntityName: "Task", in: context) else { return }
        
        //MARK: Obj Entity
        let task = Task(entity: taskEntityDescription, insertInto: context)
        task.id = id
        task.title = title
        task.descr = description
        task.day = day
        task.hourStart = hourStart
        task.hourEnd = hourEnd
        
        //MARK: Save To DB
        appDelegate.saveContext()
    }
    
    //MARK: Read All
    public func readTasks() -> [Task]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        do{
            return try? context.fetch(fetchRequest) as? [Task] ?? []
        }
    }
    
    //MARK: Read Single By Id
    public func readTask(id: Int16) -> Task? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        do{
            let tasks = try? context.fetch(fetchRequest) as? [Task]
            return tasks?.first(where: {$0.id == id})
        }
    }
    
    //MARK: Read Closure
    public func readTaskClosure(completion: @escaping([Task]) -> Void){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        do{
            guard let fetchedData = try? context.fetch(fetchRequest) as? [Task] ?? [] else { return }
            completion(fetchedData)
        }
    }
    
    //MARK: Update
    public func updateTask(id: Int16, newTitle: String?, newDesciption: String?,
                           newHourStart: Int16, newHourEnd: Int16, newDay: Int16){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        do{
            guard let tasks = try? context.fetch(fetchRequest) as? [Task],
                  let task = tasks.first(where: {$0.id == id}) else { return }
            task.title = newTitle
            task.descr = newDesciption
            task.hourStart = newHourStart
            task.hourEnd = newHourEnd
            task.day = newDay
        }
        appDelegate.saveContext()
    }
    
    //MARK: Delete All
    public func deleteAll(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        do{
            let tasks = try? context.fetch(fetchRequest) as? [Task]
            tasks?.forEach{ context.delete($0) }
        }
        appDelegate.saveContext()
    }
    
    //MARK: Delete By Id
    public func deleteById(id: Int16){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        do{
            guard let tasks = try? context.fetch(fetchRequest) as? [Task],
                  let task = tasks.first else { return }
            context.delete(task)
        }
        appDelegate.saveContext()
    }
    
}

