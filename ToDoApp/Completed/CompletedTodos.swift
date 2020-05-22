//
//  CompletedTodos.swift
//  ToDoApp
//
//  Created by karmjit singh on 19/5/20.
//  Copyright © 2020 karmjit singh. All rights reserved.
//

import SwiftUI

struct CompletedTodos: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        Text("Show Completed Todos here")
    }
}

struct CompletedTodos_Previews: PreviewProvider {
    static var previews: some View {
        CompletedTodos()
        .environmentObject(UserData())
    }
}
