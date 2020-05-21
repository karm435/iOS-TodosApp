//
//  CreateTodo.swift
//  ToDoApp
//
//  Created by karmjit singh on 19/5/20.
//  Copyright © 2020 karmjit singh. All rights reserved.
//

import SwiftUI

struct CreateTodo: View {
    @State var todoTask: String = ""
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        List {
            HStack {
                TextField("Describe task: ", text: $todoTask)
                Spacer()
                Button(action: {
                    self.addTodo(task: self.todoTask)
                    self.todoTask = ""
                }, label: {Text("Add")})
                .disabled(todoTask == "")
            }
            .padding()
            
            
            ForEach(userData.todos) { todo in
                Text("\(todo.task) \n ")
            }
           
            
            Spacer()
        }
    }
    
    func addTodo(task: String){
        let nextId = self.userData.todos.count + 1
        
        self.userData.todos.append(Todo(id: nextId, task: task, isCompleted: false))
    }
}

struct CreateTodo_Previews: PreviewProvider {
    static var previews: some View {
        CreateTodo(todoTask: "")
    }
}
