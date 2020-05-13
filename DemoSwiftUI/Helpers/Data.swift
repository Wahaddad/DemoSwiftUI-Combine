//
//  Data.swift
//  DemoSwiftUI
//
//  Created by Walid Haddad on 20/04/2020.
//  Copyright © 2020 ForgeTech Consulting. All rights reserved.
//

import UIKit
import Combine


let userData: User = loadMockData("User.json")

func loadMockData<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

//let apiUrl = "https://my.api.mockaroo.com/users.json?key=27559150"

enum MockarooAPI {
    static let agent = Agent()
    static let urlString = "https://my.api.mockaroo.com/users.json"
//    static let ApiKey = "27559150"
    static let apiKey = "9fde4460"
}

extension MockarooAPI {

    static func users() -> AnyPublisher<[User], Error> {
        guard let url = URL(string: urlString + "?key=" + apiKey) else {
            fatalError("Could not create url")
        }
        return fetch(request: URLRequest(url: url))
    }

    static func fetch<T: Decodable>(request: URLRequest) -> AnyPublisher<T, Error> {
        return agent.fetch(request: request)
                .map(\.value)
                .eraseToAnyPublisher()
    }

    static func remoteImageUrl(url: URL) -> AnyPublisher<Data, Error> {
        return agent.remoteImageUrl(url)
                .map(\.value)
                .eraseToAnyPublisher()
    }
}
