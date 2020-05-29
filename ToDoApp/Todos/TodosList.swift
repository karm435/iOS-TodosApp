//
//  CreateTodo.swift
//  ToDoApp
//
//  Created by karmjit singh on 19/5/20.
//  Copyright © 2020 karmjit singh. All rights reserved.
//

import SwiftUI
import CoreData

struct TodosList: View {
    @State var showCreate = false
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Todo.entity(), sortDescriptors: [], predicate: NSPredicate(format: "NOT isCompleted == TRUE", false)) var todos: FetchedResults<Todo>
    
    var body: some View {
        NavigationView {
            List{
                Section {
                    Button(action: {
                        self.showCreate = true
                    }, label: { Text("Add Todo") })
                }
                Section{

                        ForEach(self.todos, id: \.id) { todo in
                                TodoRow(todo: todo)
                        }
                }
            }
            .navigationBarTitle(Text("Todos"))
            .navigationBarItems(trailing: EditButton())
            .sheet(isPresented: self.$showCreate){
                CreateTodo().environment(\.managedObjectContext, self.moc)
            }
            .listStyle(GroupedListStyle())
        }
        
    }
}
