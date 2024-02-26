//
//  DetailsUseCase.swift
//  MVVM-Clean
//
//  Created by Systems on 25/02/2024.
//

import Foundation
import Combine

class DetailsUseCase {
    private let repo: DetailsRepositoryProtocol

    init(repo: DetailsRepositoryProtocol = DetailsRepositoryImplementation()) {
        self.repo = repo
    }

    func getDetails() -> AnyPublisher <Posts, Error> {
        repo.getDetails()
    }
}
