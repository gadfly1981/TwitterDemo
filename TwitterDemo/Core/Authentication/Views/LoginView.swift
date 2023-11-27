//
//  LoginView.swift
//  TwitterDemo
//
//  Created by wang yu on 2023/11/22.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Hello.", title2: "Welcome Back")
            
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope",
                                 placeholderText: "Email",
                                 isPassword: false,
                                 text: $email)
                CustomInputField(imageName: "lock",
                                 placeholderText: "Password",
                                 isPassword: true,
                                 text: $password)
            }
            .padding(.top, 44)
            .padding(.horizontal)
            
            HStack {
                Spacer()
                NavigationLink {
                    
                } label: {
                    Text("Forgot Password?")
                        .foregroundStyle(.blue)
                        .font(.caption)
                        .fontWeight(.semibold)
                }
            }
            .padding()
            
            Button {
                viewModel.login(withEmail: email, password: password)
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(.blue)
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Spacer()
            
            NavigationLink {
                RegistrationView()
                    .toolbar(.hidden, for: .navigationBar)
            } label: {
                HStack {
                    Text("Don't have an account?")
                        .font(.footnote)
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundStyle(.blue)
            .toolbar(.hidden, for: .navigationBar)
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LoginView()
}
