//
//  HomeNetwork.swift
//  MVVM-Clean
//
//  Created by Systems on 25/02/2024.
//

import Foundation
import Combine

protocol HomeRemoteRepository {
    func getPosts() -> AnyPublisher<Posts, Error>
}

class HomeNetwork: HomeRemoteRepository {
    func getPosts() -> AnyPublisher<Posts, Error> {
        let url = "https://jsonplaceholder.typicode.com/posts"
        let posts  = Session.instance.request(from: url, Posts.self)
        return posts
    }
}
