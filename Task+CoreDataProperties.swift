//
//  Task+CoreDataProperties.swift
//  TaskManager
//
//  Created by Шермат Эшеров on 01/04/2023.
//
//

import Foundation
import CoreData


@objc(Task)
public class Task: NSManagedObject {

}

extension Task {
    @NSManaged public var title: String?
    @NSManaged public var descr: String?
    @NSManaged public var id: Int16
    @NSManaged public var hourStart: Int16
    @NSManaged public var hourEnd: Int16
    @NSManaged public var day: Int16

}

extension Task : Identifiable {

}
