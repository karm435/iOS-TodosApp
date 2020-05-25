//
//  TodoContextMenu.swift
//  ToDoApp
//
//  Created by karmjit singh on 22/5/20.
//  Copyright © 2020 karmjit singh. All rights reserved.
//

import SwiftUI

struct TodoContextMenu: View {
    let todo: Todo
    @EnvironmentObject var userData: UserData
    
    var todoIndex: Int {
        return userData.todos.firstIndex(where: { $0.id == todo.id })!
    }
    
    var body: some View {
        HStack{
            Button(action: {
                self.userData.todos[self.todoIndex].isCompleted.toggle()
            }, label: {
                HStack{
                    Text("Complete")
                        .foregroundColor(.green)
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                }
            })
            Button(action: {
                self.userData.todos.remove(at: self.todoIndex)
            }, label: {
                    HStack{
                        Text("Delete")
                            .foregroundColor(.red)
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
            })
        }
    }
}

struct TodoContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        TodoContextMenu(todo: Todo.Default)
        .environmentObject(UserData())
    }
}
