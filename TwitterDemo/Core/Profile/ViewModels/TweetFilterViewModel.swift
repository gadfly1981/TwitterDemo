//
//  TweetFilterViewModel.swift
//  TwitterDemo
//
//  Created by wang yu on 2023/11/18.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweets:
            "Tweets"
        case .replies:
            "Replies"
        case .likes:
            "Likes"
        }
    }
}
