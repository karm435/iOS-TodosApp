//
//  TodoRow.swift
//  ToDoApp
//
//  Created by karmjit singh on 22/5/20.
//  Copyright © 2020 karmjit singh. All rights reserved.
//

import SwiftUI

struct TodoRow: View {
    var todo: Todo
    
    var body: some View {
        HStack {
            Text(todo.task)
                .italic()
                .frame(width: 200, alignment: .leading)
                .lineLimit(1)
                .layoutPriority(1)
                .contextMenu(menuItems: {
                    TodoContextMenu(todo: todo)
                })
            Spacer()
            Text(todo.priority.rawValue)
                .padding(.horizontal)
                .font(.system(size: 15, weight: .light, design: .serif))
            Text(todo.dueDate.ShortDate)
                .font(.system(size: 15, weight: .light, design: .serif))
        }
        .lineLimit(1)
    }
}

struct TodoRow_Previews: PreviewProvider {
    static var previews: some View {
        TodoRow(todo: Todo.Default)
    }
}
