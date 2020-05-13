//
//  UsersListView.swift
//  DemoSwiftUI
//
//  Created by Walid Haddad on 20/04/2020.
//  Copyright © 2020 ForgeTech Consulting. All rights reserved.
//

import SwiftUI

struct UsersListView: View {
    
    @ObservedObject var usersListViewModel = UsersListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(usersListViewModel.users, id: \.id) { user in
                    NavigationLink(destination: self.goToDetailsView(user)) {
                        UserRowView(user: user)
                    }
                }
                Spacer()
                Button(action: {
                    print("Fetching...")
                    self.usersListViewModel.fetchUsers()
                }, label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 120, height: 40)
                            .foregroundColor(Color.blue)
                            .cornerRadius(10)
                        Text("Fetch").foregroundColor(Color.white)
                    }
                })
            }.padding(.bottom, 10)
            .navigationBarTitle(Text("Users List"))
        }
    }

    func goToDetailsView(_ user: User) -> UserDetailsView {
        UserDetailsView(userDetailsViewModel: UserDetailsViewModel(user: user))
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
    }
}
