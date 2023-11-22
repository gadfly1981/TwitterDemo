//
//  NewTweetView.swift
//  TwitterDemo
//
//  Created by wang yu on 2023/11/21.
//

import SwiftUI

struct NewTweetView: View {
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundStyle(.blue)
                }
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Text("Tweet")
                        .bold()
                        .padding()
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(Capsule())
                }
            }
            .padding(.horizontal)
            .padding(.top)
            
            HStack(alignment: .top) {
                Circle()
                    .frame(width: 64, height: 64)
                TextArea("What's happening?", text: $caption)
            }
            .padding()
        }
    }
}

#Preview {
    NewTweetView()
}
