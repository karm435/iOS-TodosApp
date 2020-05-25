//
//  CreateTodo.swift
//  ToDoApp
//
//  Created by karmjit singh on 19/5/20.
//  Copyright © 2020 karmjit singh. All rights reserved.
//

import SwiftUI

struct TodosList: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView{
            List {
                NavigationLink(destination: CreateTodo(todo: Todo.Default), label: {Text("+")})
                
                ForEach(userData.todos) { todo in
                    if !todo.isCompleted {
                        TodoRow(todo: todo)
                    }
                }
                
                Spacer()
            }
            .navigationBarTitle(Text("Todos"))
        }
    }
}

struct TodosList_Previews: PreviewProvider {
    static var previews: some View {
        TodosList()
            .environmentObject(UserData())
    }
}
