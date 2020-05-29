//
//  CreateTodo.swift
//  ToDoApp
//
//  Created by karmjit singh on 25/5/20.
//  Copyright © 2020 karmjit singh. All rights reserved.
//

import SwiftUI

struct CreateTodo: View {
    @State var taskDescription: String = ""
    @State var dueDate: Date = .init()
    @State var priority: TaskPriority = .hightest
    @State var saved: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        VStack {
            HStack(alignment: .center){
                Spacer()
                Button(action: {
                    self.addTodo()
                }, label: {
                    Text("Save")
                })
                    .disabled(self.taskDescription.isEmpty)
            }
            .alert(isPresented: self.$saved, content: {
                Alert(title: Text("Success"), message: Text("Todo created successfully with \(self.priority.name) and due by \(self.dueDate.ShortDate)"), dismissButton: .cancel(Text("Ok"), action: {
                    self.presentationMode.wrappedValue.dismiss()
                }))
            })
            
            TextField("Task", text: self.$taskDescription)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            VStack(alignment: .leading, spacing: 20){
                Text("Priority")
                
                Picker(selection: self.$priority, label: Text("Priority"), content: {
                    ForEach(TaskPriority.allCases, id: \.self){ priority in
                        Text("\(priority.name)").tag(priority)
                        
                    }
                }).pickerStyle(SegmentedPickerStyle())
            }
            .padding(.top)
            
            VStack(alignment: .leading, spacing: 20){
                Text("Due Date")
                
                DatePicker(selection: self.$dueDate, label: { Text("Due Date") })
            }
            .padding(.top)
            Spacer()
            
        }
        .padding()
        .navigationBarTitle(Text("Create Todo"))
    }
    
    func addTodo(){
        let todo: Todo = Todo(context: self.moc)
        todo.dueDate = self.dueDate
        todo.isCompleted = false
        todo.taskPriority = self.priority
        todo.task = self.taskDescription
        
        try? moc.save()
        
        self.saved = true
    }
}
