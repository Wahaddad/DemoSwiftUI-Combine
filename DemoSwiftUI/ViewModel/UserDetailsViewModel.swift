//
//  UserDetailsViewModel.swift
//  DemoSwiftUI
//
//  Created by Walid Haddad on 20/04/2020.
//  Copyright © 2020 ForgeTech Consulting. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class UserDetailsViewModel: ObservableObject {
    
    var user: User
    @ObservedObject var remoteImageUrl: RemoteImageUrl
    
    init(user: User) {
        self.user = user
        remoteImageUrl = RemoteImageUrl(imageUrl: user.avatar)
    }
    
    var userName: String {
        return "\(user.firstName) \(user.lastName)"
    }
    
    var userEmail: String {
        return user.email
    }
    
    var userAnnotation: UserAnnotation {
        UserAnnotation(title: userName, coordinate: user.locationCoordinate)
    }

    func userImage() -> Image {
        if !self.remoteImageUrl.data.isEmpty, let image = UIImage(data: self.remoteImageUrl.data) {
            return Image(uiImage: image)
        } else {
            return Image("Placeholder")
        }
    }

}
