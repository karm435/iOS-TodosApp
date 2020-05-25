//
//  Todo.swift
//  ToDoApp
//
//  Created by karmjit singh on 19/5/20.
//  Copyright © 2020 karmjit singh. All rights reserved.
//

import Foundation

struct Todo : Identifiable, Hashable {
    var id: Int
    var task: String
    var priority: TaskPriority
    var dueDate: Date
    var isCompleted: Bool
    
    static var Default: Todo {
        return Todo(id: 0, task: "", priority: .hightest, dueDate: .init(), isCompleted: false)
    }
}


