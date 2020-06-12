//
//  TodoRow.swift
//  ToDoApp
//
//  Created by karmjit singh on 22/5/20.
//  Copyright © 2020 karmjit singh. All rights reserved.
//
import CoreData
import SwiftUI

struct TodoRow: View {
    var todo: Todo
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(self.todo.wrappedTask)
                .font(.headline)
            Text("Due by: \(todo.wrappedDueDate.ShortDate)")
                .font(.footnote)
        }
        .contextMenu {
            Button(action: {
                self.markTodoCompleted()
            }){
                Text("Completed")
                    .foregroundColor(.green)
            }
        }
    }
    
    func markTodoCompleted() {
        self.todo.isCompleted = true;
    }
}

