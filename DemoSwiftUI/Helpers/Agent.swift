//
//  Agent.swift
//  DemoSwiftUI
//
//  Created by Walid Haddad on 20/04/2020.
//  Copyright © 2020 ForgeTech Consulting. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

struct Agent {

    let session = URLSession.shared

    struct Response<T> {
        let value: T
        let response: URLResponse
    }

    func fetch<T: Decodable>(request: URLRequest, decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, Error> {
        return session
            .dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                let value = try decoder.decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func remoteImageUrl(_ url: URL) -> AnyPublisher<Response<Data>, Error> {
        return session
            .dataTaskPublisher(for: url)
            .tryMap { result -> Response<Data> in
                return Response(value: result.data, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
