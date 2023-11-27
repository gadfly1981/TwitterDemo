//
//  TwitterDemoApp.swift
//  TwitterDemo
//
//  Created by wang yu on 2023/11/15.
//

import SwiftUI

@main
struct TwitterDemoApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
