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
            ZStack {
                List{
                    Section {
                        ForEach(self.todos, id: \.id) { todo in
                            TodoRow(todo: todo)
                        }
                        .onDelete { indexSet in
                            
                            for index in indexSet {
                                NotificationHandler.removeNotificationRequest(for: self.todos[index].id!)
                                
                                self.moc.delete(self.todos[index])
                            }
                            
                        }
                    }
                }
                .navigationBarTitle(Text("Todos"))
                .navigationBarItems(trailing: EditButton())
                .sheet(isPresented: self.$showCreate){
                    CreateTodo().environment(\.managedObjectContext, self.moc)
                }
                .listStyle(GroupedListStyle())
                
                VStack(alignment:.trailing){
                    
                    Spacer()
                    HStack(alignment: .bottom){
                        Spacer()
                        Button(action: {
                            self.showCreate = true
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(Color.white)
                        }.padding()
                            .background(Color.green)
                            .mask(Circle())
                            .frame(width: 60, height: 60)
                    }
                    .padding()
                }
            }
        }
        
    }
}
