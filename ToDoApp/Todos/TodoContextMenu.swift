//
//  TodoContextMenu.swift
//  ToDoApp
//
//  Created by karmjit singh on 22/5/20.
//  Copyright © 2020 karmjit singh. All rights reserved.
//

import SwiftUI

struct TodoContextMenu: View {
    var body: some View {
        HStack{
            Button(action: {}, label: {
                HStack{
                    Text("Complete")
                    Image(systemName: "checkmark.circle.fill")
                }
            })
            Button(action: {}, label: {
                    HStack{
                        Text("Delete")
                        Image(systemName: "trash")
                    }
            })
        }
    }
}

struct TodoContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        TodoContextMenu()
    }
}
