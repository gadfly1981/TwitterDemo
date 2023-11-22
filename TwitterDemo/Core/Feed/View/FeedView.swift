//
//  FeedView.swift
//  TwitterDemo
//
//  Created by wang yu on 2023/11/15.
//

import SwiftUI

struct FeedView: View {
    @Binding var showMenu: Bool
    @State private var showNewTweetView = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    LazyVStack {
                        ForEach(0...20, id: \.self) { _ in
                            TweetRowView()
                        }
                    }
                }
                
                Button {
                    showNewTweetView.toggle()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 44, height: 44)
                        .padding()
                }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation(.easeInOut) {
                            showMenu.toggle()
                        }
                    } label: {
                        Circle()
                            .frame(width: 32, height: 32)
                    }
                }
            }
            .fullScreenCover(isPresented: $showNewTweetView) {
                NewTweetView()
            }
        }
    }
}

#Preview {
    FeedView(showMenu: .constant(false))
}
