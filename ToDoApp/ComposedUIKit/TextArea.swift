//
//  TextArea.swift
//  ToDoApp
//
//  Created by karmjit singh on 12/6/20.
//  Copyright © 2020 karmjit singh. All rights reserved.
//

import SwiftUI
import Combine

struct TextArea: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.isScrollEnabled = true
        view.isEditable = true
        view.isUserInteractionEnabled = true
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.cornerRadius = 10
        return view
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}
