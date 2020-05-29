//
//  CompletedTodos.swift
//  ToDoApp
//
//  Created by karmjit singh on 19/5/20.
//  Copyright © 2020 karmjit singh. All rights reserved.
//

import SwiftUI

struct CompletedTodos: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Todo.entity(), sortDescriptors: [], predicate: NSPredicate(format: "isCompleted == TRUE")) var completedTodos: FetchedResults<Todo>
    
    
    var body: some View {
        List {
            ForEach(self.completedTodos, id:\.id){ todo in
                    CompletedTodoRow(todo: todo)
            }
            
            .edgesIgnoringSafeArea(.top)
        }
    }
}
