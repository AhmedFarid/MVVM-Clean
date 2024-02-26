//
//  DetailsRepositoryProtocol.swift
//  MVVM-Clean
//
//  Created by Systems on 25/02/2024.
//

import Foundation
import Combine

protocol DetailsRepositoryProtocol {
    func getDetails() -> AnyPublisher<Posts, Error>
}
