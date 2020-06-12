//
//  ContentView.swift
//  ToDoApp
//
//  Created by karmjit singh on 19/5/20.
//  Copyright © 2020 karmjit singh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TodosList()
                .tabItem {
                    Image(systemName: "pencil.and.ellipsis.rectangle")
                    Text("Todos")
                        .font(.title)
                }
            CompletedTodos()
                .tabItem {
                    Image(systemName: "checkmark.circle.fill")
                    Text("Completed")
                        .font(.title)
            }
        }
        .font(.headline)
    }
}
