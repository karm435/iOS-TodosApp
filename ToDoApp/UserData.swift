//
//  UserData.swift
//  ToDoApp
//
//  Created by karmjit singh on 19/5/20.
//  Copyright © 2020 karmjit singh. All rights reserved.
//

import Foundation
import Combine

final class UserData : ObservableObject {
    @Published var todos: [Todo] = []
}
