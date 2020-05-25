//
//  CreateTodo.swift
//  ToDoApp
//
//  Created by karmjit singh on 25/5/20.
//  Copyright © 2020 karmjit singh. All rights reserved.
//

import SwiftUI

struct CreateTodo: View {
    @State var todo: Todo
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        VStack {
            HStack(alignment: .center){
                
                Spacer()
                Button(action: {
                    let nextId = self.userData.todos.count + 1
                    self.todo.id = nextId
                    self.userData.todos.append(self.todo)
                    
                }, label: {
                    Text("Save")
                })
                    .disabled(self.todo.task.isEmpty)
            }
            
            TextField("Task", text: $todo.task)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            VStack(alignment: .leading, spacing: 20){
                Text("Priority")
                
                Picker(selection: $todo.priority, label: Text("Priority"), content: {
                    Text("!").tag(TaskPriority.hightest)
                    Text("!!").tag(TaskPriority.high)
                    Text("!!!").tag(TaskPriority.lowest)
                    Text("!!!!").tag(TaskPriority.none)
                }).pickerStyle(SegmentedPickerStyle())
            }
            .padding(.top)
            
            VStack(alignment: .leading, spacing: 20){
                Text("Due Date")
                
                DatePicker(selection: $todo.dueDate, label: { Text("Due Date") })
            }
            .padding(.top)
            Spacer()
            
        }
        .padding()
        .navigationBarTitle(Text("Create Todo"))
    }
}

struct CreateTodo_Previews: PreviewProvider {
    static var previews: some View {
        CreateTodo(todo: Todo.Default)
        .environmentObject(UserData())
    }
}
