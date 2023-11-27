//
//  RegistrationView.swift
//  TwitterDemo
//
//  Created by wang yu on 2023/11/22.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Get started.", title2: "Create your account")
            
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope",
                                 placeholderText: "Email",
                                 isPassword: false,
                                 text: $email)
                CustomInputField(imageName: "person",
                                 placeholderText: "Username",
                                 isPassword: false,
                                 text: $username)
                CustomInputField(imageName: "person",
                                 placeholderText: "Full name",
                                 isPassword: false,
                                 text: $fullname)
                CustomInputField(imageName: "lock",
                                 placeholderText: "Password",
                                 isPassword: true,
                                 text: $password)
            }
            .padding(32)
            
            Button {
                viewModel.register(withEmail: email,
                                   password: password,
                                   fullname: fullname,
                                   username: username)
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(.blue)
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                        .font(.footnote)
                    Text("Sign In")
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
    RegistrationView()
}
