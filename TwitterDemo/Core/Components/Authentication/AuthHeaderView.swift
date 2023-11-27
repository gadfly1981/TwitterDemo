//
//  AuthHeaderView.swift
//  TwitterDemo
//
//  Created by wang yu on 2023/11/23.
//

import SwiftUI

struct AuthHeaderView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
            }
            Text("Hello.")
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text("Welcome Back")
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height: 260)
        .padding(.leading)
        .background(.blue)
        .foregroundStyle(.white)
        .clipShape(RoundedShape(corners: [.bottomRight]))
    }
}

#Preview {
    AuthHeaderView()
}
