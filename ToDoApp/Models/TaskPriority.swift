//
//  TaskPriority.swift
//  ToDoApp
//
//  Created by karmjit singh on 25/5/20.
//  Copyright © 2020 karmjit singh. All rights reserved.
//

import Foundation

enum TaskPriority: String, CaseIterable, Hashable {
    case hightest = "!"
    case high = "!!"
    case lowest = "!!!"
    case none = "!!!!"
    
    var name: String {
        get {return String(describing: self)}
    }
    
    var dispalyName: String {
        switch self {
        case .hightest:
            return "!"
        case .high:
            return "!!"
        case .lowest:
            return "!!!"
        case .none:
            return "!!!!"
        }
    }
}
