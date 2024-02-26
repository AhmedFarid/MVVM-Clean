//
//  DetailsNetwork.swift
//  MVVM-Clean
//
//  Created by Systems on 25/02/2024.
//

import Foundation
import Combine

protocol DetailsRemoteRepository {
    func getDetails() -> AnyPublisher<Posts, Error>
}

class DetailsNetwork: DetailsRemoteRepository {
    func getDetails() -> AnyPublisher<Posts, Error> {
        let url = "https://jsonplaceholder.typicode.com/posts"
        let posts = Session.instance.request(from: url, Posts.self)
        return posts
    }
}
