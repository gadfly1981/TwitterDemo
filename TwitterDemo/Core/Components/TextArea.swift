//
//  TextArea.swift
//  TwitterDemo
//
//  Created by wang yu on 2023/11/22.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String
    
    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholder)
                    .background(Color(.placeholderText))
                    .padding()
            }
            TextEditor(text: $text)
                .padding()
        }
        .font(.body)
    }
}
