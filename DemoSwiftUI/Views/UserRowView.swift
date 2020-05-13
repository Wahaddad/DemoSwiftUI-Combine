//
//  UserRowView.swift
//  DemoSwiftUI
//
//  Created by Walid Haddad on 20/04/2020.
//  Copyright © 2020 ForgeTech Consulting. All rights reserved.
//

import SwiftUI

struct UserRowView: View {

    var user: User
    @ObservedObject var remoteImageUrl: RemoteImageUrl

    init(user: User) {
        self.user = user
        remoteImageUrl = RemoteImageUrl(imageUrl: user.avatar)
    }

    fileprivate func userImage() -> Image {
        if !self.remoteImageUrl.data.isEmpty, let image = UIImage(data: self.remoteImageUrl.data) {
            return Image(uiImage: image)
        } else {
            return Image("Placeholder")
        }
    }
    
    var body: some View {
        HStack(spacing: 20) {
            userImage()
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(user.firstName + " " + user.lastName)
                    .font(.title)
                    .lineLimit(nil)
                Text(user.email)
                    .font(.subheadline)
            }
            Spacer()
        }
        .padding(.leading, 10)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(user: userData)
    }
}
