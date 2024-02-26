//
//  HomeRepositoryImplementation.swift
//  MVVM-Clean
//
//  Created by Systems on 24/02/2024.
//

import Foundation
import Combine

final class HomeRepositoryImplementation: HomeRepositoryProtocol {

    let homeNetwork: HomeRemoteRepository

    init(homeNetwork: HomeRemoteRepository = HomeNetwork() ) {
        self.homeNetwork = homeNetwork
    }

    func getPosts() -> AnyPublisher<Posts, Error> {
        homeNetwork.getPosts()
    }

}
