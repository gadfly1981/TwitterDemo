//
//  ExploreView.swift
//  TwitterDemo
//
//  Created by wang yu on 2023/11/17.
//

import SwiftUI

struct ExploreView: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(0...25, id: \.self) { _ in
                            NavigationLink {
                                ProfileView()
                            } label: {
                                UserRowView()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Explore")
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
        }
    }
}

#Preview {
    ExploreView(showMenu: .constant(false))
}
