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
                        .foregroundColor(.green)
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                }
            })
            Button(action: {}, label: {
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
        TodoContextMenu()
    }
}
