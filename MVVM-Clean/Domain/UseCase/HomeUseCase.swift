//
//  HomeUseCase.swift
//  MVVM-Clean
//
//  Created by Systems on 24/02/2024.
//

import Foundation
import Combine

class HomeUseCase {
    private let repo: HomeRepositoryProtocol

    init(repo: HomeRepositoryProtocol = HomeRepositoryImplementation()) {
        self.repo = repo
    }

    func getPosts() -> AnyPublisher <Posts, Error> {
        repo.getPosts()
    }

//    func getTitleFromPosts() -> [String]  {
//        getPosts().values.flatMap {$0.title}
//    }
}
