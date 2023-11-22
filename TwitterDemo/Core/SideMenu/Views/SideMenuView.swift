//
//  SideMenuView.swift
//  TwitterDemo
//
//  Created by wang yu on 2023/11/18.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Circle()
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Bruce Wayne")
                        .font(.headline)
                    Text("@batman")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                
                UserStatsView()
                    .padding(.vertical)
            }
            .padding(.leading)
            
            ForEach(SideMenuViewModel.allCases, id: \.rawValue) { option in
                if option == .profile {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        optionRowView(option: option)
                    }
                } else if option == .logout {
                    Button {
                        
                    } label: {
                        optionRowView(option: option)
                    }
                } else {
                    optionRowView(option: option)
                }
            }
            
            Spacer()
        }
    }
    
    @ViewBuilder
    func optionRowView(option: SideMenuViewModel) -> some View {
        HStack(spacing: 16) {
            Image(systemName: option.imageName)
                .font(.headline)
                .foregroundStyle(.gray)
            Text(option.title)
                .font(.subheadline)
                .foregroundStyle(.black)
            Spacer()
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}

#Preview {
    SideMenuView()
}
