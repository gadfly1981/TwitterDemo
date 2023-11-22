//
//  UserRowView.swift
//  TwitterDemo
//
//  Created by wang yu on 2023/11/18.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .frame(width: 48, height: 48)
            VStack(alignment: .leading, spacing: 4) {
                Text("joker")
                    .font(.subheadline)
                    .bold()
                    .foregroundStyle(.black)
                Text("Health Ledger")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

#Preview {
    UserRowView()
}
