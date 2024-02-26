//
//  SessionManger.swift
//  MVVM-Clean
//
//  Created by Systems on 25/02/2024.
//

import Foundation
import Combine

public final class Session {
    private var anyCancellable = Set<AnyCancellable>()
    public static var instance = Session()

    private init() {}

    public func request<T: Codable>(from urlString: String,_ model: T.Type) -> AnyPublisher<T, Error> {
        let url = URL(string: urlString)!
        let decoder = JSONDecoder()

        return Future { [unowned self] promise in
            URLSession.shared.dataTaskPublisher(for: url)
                .retry(1)
                .mapError({$0})
                .tryMap { dataElement -> Data in
                    guard let httpResponse = dataElement.response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                        throw URLError(.badServerResponse)
                    }
                    return dataElement.data
                }
                .decode(type: model.self, decoder: decoder)
                .receive(on: DispatchQueue.main)
                .sink { finished in
                    print(finished)
                } receiveValue: { data in
                    promise(.success(data))
                }.store(in: &anyCancellable)
        }.eraseToAnyPublisher()
    }
}
