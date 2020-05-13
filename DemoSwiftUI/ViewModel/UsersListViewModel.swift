//
//  UsersListViewModel.swift
//  DemoSwiftUI
//
//  Created by Walid Haddad on 20/04/2020.
//  Copyright © 2020 ForgeTech Consulting. All rights reserved.
//

import Foundation
import Combine


class UsersListViewModel: ObservableObject {
    @Published var users: [User] = []
    
    fileprivate var cancellable: AnyCancellable?
    
    init() {
        self.fetchUsers()
    }
    
    func fetchUsers() {
        users.removeAll()
        cancellable = MockarooAPI.users().sink(receiveCompletion: { status in
                switch status {
                    case .failure(let error):
                        print("Error: \(error.localizedDescription)")
                    case .finished:
                        print("Finished")
                    break
                }
            }) { (users) in
                self.users = users
                print("users: \(users)")
        }
    }
}

