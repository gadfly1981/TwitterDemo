//
//  MainTabView.swift
//  TwitterDemo
//
//  Created by wang yu on 2023/11/17.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    @Binding var showMenu: Bool
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView(showMenu: $showMenu)
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(0)
            ExploreView(showMenu: $showMenu)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            NotificationsView()
                .tabItem {
                    Image(systemName: "bell")
                }
                .tag(2)
            MessagesView()
                .tabItem {
                    Image(systemName: "envelope")
                }
                .tag(3)
        }
    }
}

#Preview {
    MainTabView(showMenu: .constant(false))
}
