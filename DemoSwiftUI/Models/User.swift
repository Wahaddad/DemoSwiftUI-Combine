//
//  User.swift
//  DemoSwiftUI
//
//  Created by Walid Haddad on 20/04/2020.
//  Copyright © 2020 ForgeTech Consulting. All rights reserved.
//

import Foundation
import CoreLocation

struct User: Decodable, Identifiable {
    var id : Int
    var firstName: String
    var lastName: String
    var email: String
    var avatar: String
    fileprivate var latitude: Double
    fileprivate var longitude: Double
    var isFavorite: Bool
    var description: String
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar = "avatar_url"
        case isFavorite = "is_favorite"

        case id
        case email
        case latitude
        case longitude
        case description
    }
}
