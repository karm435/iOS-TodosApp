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
    var isCompleted: Bool
}
