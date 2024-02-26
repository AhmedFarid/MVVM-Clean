//
//  DetailsRepositoryImplementation.swift
//  MVVM-Clean
//
//  Created by Systems on 25/02/2024.
//

import Foundation
import Combine

final class DetailsRepositoryImplementation: DetailsRepositoryProtocol {
    let detailsNetwork : DetailsNetwork

    init(detailsNetwork: DetailsNetwork = DetailsNetwork()) {
        self.detailsNetwork = detailsNetwork
    }

    func getDetails() -> AnyPublisher<Posts, Error> {
        detailsNetwork.getDetails()
    }
}
