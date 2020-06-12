//
//  Todo+CoreDataProperties.swift
//  ToDoApp
//
//  Created by karmjit singh on 29/5/20.
//  Copyright © 2020 karmjit singh. All rights reserved.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var dueDate: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var priority: Int16
    @NSManaged public var task: String?
    
    var wrappedDueDate : Date {
        self.dueDate ?? .init()
    }
    
    var wrappedTask : String {
        self.task ?? ""
    }
    
    var taskPriority: TaskPriority {
        set { priority = newValue.rawValue}
        get{ TaskPriority(rawValue: priority) ?? .lowest}
    }

    static var Default: Todo {
        let defaultTodo = Todo()
        defaultTodo.dueDate = .init()
        defaultTodo.isCompleted = false
        defaultTodo.taskPriority = .lowest
        defaultTodo.task = ""
        
        return defaultTodo
    }
    
}
