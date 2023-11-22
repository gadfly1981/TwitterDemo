//
//  TweetRowView.swift
//  TwitterDemo
//
//  Created by wang yu on 2023/11/15.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundStyle(.blue)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Bruce Wayne")
                            .font(.subheadline)
                            .bold()
                        Text("@batman")
                            .foregroundStyle(.gray)
                            .font(.caption)
                        
                        Text("2W")
                            .foregroundStyle(.gray)
                            .font(.caption)
                    }
                    
                    Text("I believe in Hary Dent")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "bubble.left")
                }
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                }
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                }
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "bookmark")
                }
            }
            .foregroundStyle(.gray)
            .padding()
            
            Divider()
        }
        .padding(.horizontal)
    }
}

#Preview {
    TweetRowView()
}
