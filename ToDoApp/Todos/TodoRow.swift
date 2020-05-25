//
//  TodoRow.swift
//  ToDoApp
//
//  Created by karmjit singh on 22/5/20.
//  Copyright © 2020 karmjit singh. All rights reserved.
//

import SwiftUI

struct TodoRow: View {
    @State var doubleTapped = false
    var todo: Todo
    
    var body: some View {
        HStack {
            Text(todo.task)
                .font(.system(size: 15, weight: .light, design: .serif)) //TODO: use the font from settings later
                .italic()
                .frame(width: 200, alignment: .leading)
                .lineLimit(1)
                .contextMenu(menuItems: {
                    TodoContextMenu(todo: todo)
                })
            Spacer()
            Text(todo.priority.rawValue)
        }
    }
}

struct TodoRow_Previews: PreviewProvider {
    static var previews: some View {
        TodoRow(todo: Todo.Default)
    }
}
