//
//  TaskPriority.swift
//  ToDoApp
//
//  Created by karmjit singh on 25/5/20.
//  Copyright © 2020 karmjit singh. All rights reserved.
//

import Foundation

enum TaskPriority: Int16, CaseIterable, Hashable {
    case hightest = 1
    case high
    case lowest
    
    var name: String {
        switch self {
        case .hightest:
            return "!"
        case .high:
            return "!!"
        case .lowest:
            return "!!!"
        }
    }
}
