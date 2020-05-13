//
//  RemoteImageUrl.swift
//  DemoSwiftUI
//
//  Created by Walid Haddad on 20/04/2020.
//  Copyright © 2020 ForgeTech Consulting. All rights reserved.
//

import Foundation
import Combine

class RemoteImageUrl: ObservableObject {

    @Published var data = Data()
    
    fileprivate var cancellable: AnyCancellable?

    init(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        cancellable = MockarooAPI.remoteImageUrl(url: url)
            .sink(receiveCompletion: { (_) in }) { (data) in
                self.data = data
        }
    }
}
