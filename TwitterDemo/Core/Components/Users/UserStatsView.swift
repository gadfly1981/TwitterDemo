//
//  UserStatsView.swift
//  TwitterDemo
//
//  Created by wang yu on 2023/11/20.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 24) {
            HStack(spacing: 4) {
                Text("807")
                    .font(.subheadline)
                    .bold()
                Text("Following")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            HStack(spacing: 4) {
                Text("6.9M")
                    .font(.subheadline)
                    .bold()
                Text("Followers")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    UserStatsView()
}
