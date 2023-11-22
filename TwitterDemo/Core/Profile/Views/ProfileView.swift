//
//  ProfileView.swift
//  TwitterDemo
//
//  Created by wang yu on 2023/11/17.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var mode
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    @Namespace var animation
    
    var body: some View {
        VStack(alignment: .leading) {
            headerView()
            
            actionButtons()
            
            userInfoDetails()
            
            tweetFilterBar()
            
            tweetsView()
            
            Spacer()
        }
    }
    
    @ViewBuilder
    func headerView() -> some View {
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            VStack {
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundStyle(.white)
                        .offset(x: 16, y: 12)
                }
                Circle()
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y: 24)
            }
        }
        .frame(height: 96)
    }
    
    @ViewBuilder
    func actionButtons() -> some View {
        HStack(spacing: 12) {
            Spacer()
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay {
                    Circle()
                        .stroke(.gray, lineWidth: 0.75)
                }
            Button {
                
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .bold()
                    .frame(width: 120, height: 32)
                    .foregroundStyle(.black)
                    .overlay {
                        Capsule()
                            .stroke(.gray, lineWidth: 0.75)
                    }
            }
            .padding(.trailing)
        }
    }
    
    @ViewBuilder
    func userInfoDetails() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text("Health Ledger")
                    .font(.title2)
                    .bold()
                Image(systemName: "checkmark.seal.fill")
                    .foregroundStyle(.blue)
            }
            Text("@joker")
                .font(.subheadline)
                .foregroundStyle(.gray)
            Text("Your moms favorite villain")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24) {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Gotham, NY")
                }
                HStack {
                    Image(systemName: "link")
                    Text("www.thejoker.com")
                        .tint(.gray)
                }
            }
            .font(.caption)
            .foregroundStyle(.gray)
            
            UserStatsView()
                .padding(.vertical)
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    func tweetFilterBar() -> some View {
        HStack {
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundStyle(selectedFilter == item ? .black : .gray)
                    if selectedFilter == item {
                        Capsule()
                            .foregroundStyle(.blue)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundStyle(.clear)
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedFilter = item
                    }
                }
            }
        }
        .overlay {
            Divider()
                .offset(x: 0, y: 16)
        }
    }
    
    @ViewBuilder
    func tweetsView() -> some View {
        ScrollView {
            LazyVStack {
                ForEach(0...9, id: \.self) { _ in
                    TweetRowView()
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
