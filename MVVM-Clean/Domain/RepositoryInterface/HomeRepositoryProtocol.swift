//
//  HomeRepositoryProtocol.swift
//  MVVM-Clean
//
//  Created by Systems on 24/02/2024.
//

import Foundation
import Combine

protocol HomeRepositoryProtocol {
    func getPosts() -> AnyPublisher< Posts, Error >
}
