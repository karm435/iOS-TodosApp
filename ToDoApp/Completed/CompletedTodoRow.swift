//
//  CompletedTodoRow.swift
//  ToDoApp
//
//  Created by karmjit singh on 22/5/20.
//  Copyright © 2020 karmjit singh. All rights reserved.
//

import SwiftUI

struct CompletedTodoRow: View {
    let todo: Todo
    var body: some View {
        HStack {
            Image(systemName: "checkmark.seal.fill")
                .padding()
            Text(todo.wrappedTask)
                .lineLimit(1)
                .padding()
        }
    }
}
