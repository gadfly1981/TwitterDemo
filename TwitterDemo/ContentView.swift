//
//  ContentView.swift
//  TwitterDemo
//
//  Created by wang yu on 2023/11/15.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.userSession == nil {
                LoginView()
            } else {
                mainInterfaceView()
            }
        }
    }
    
    @ViewBuilder
    func mainInterfaceView() -> some View {
        ZStack(alignment: .topLeading) {
            MainTabView(showMenu: $showMenu)
            
            if showMenu {
                Color.black
                    .opacity(showMenu ? 0.25 : 0.0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            showMenu = false
                        }
                    }
            }
            SideMenuView(showMenu: $showMenu)
                .background(.white)
                .frame(width: 300)
                .offset(x: showMenu ? 0 : -300)
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    ContentView()
}
