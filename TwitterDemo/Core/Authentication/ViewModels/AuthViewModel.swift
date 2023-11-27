//
//  AuthViewModel.swift
//  TwitterDemo
//
//  Created by wang yu on 2023/11/24.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth()
            .createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let user = result?.user else { return }
                self.userSession = user
                
                let data = ["email": email,
                            "username": username.lowercased(),
                            "fullname": fullname,
                            "uid": user.uid]
                Firestore.firestore()
                    .collection("user")
                    .document(user.uid)
                    .setData(data) { _ in
                        print("did upload user data..")
                    }
            }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        userSession = nil
    }
}
