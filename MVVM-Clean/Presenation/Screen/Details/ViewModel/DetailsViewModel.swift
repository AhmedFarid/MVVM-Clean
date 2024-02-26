//
//  DetailsViewModel.swift
//  MVVM-Clean
//
//  Created by Systems on 25/02/2024.
//

import Foundation
import Combine

protocol DetailsViewModelProtocol: AnyObject {
    var input: DetailsViewModel.Input {get}
    var output: DetailsViewModel.Output {get}

    func viewDidLoad()
}

final class DetailsViewModel: ObservableObject, DetailsViewModelProtocol, ViewModel {
    class Input {
    }

    class Output {
        @Published var post: Posts = []
    }

    var input: Input = .init()
    var output: Output = .init()
    let useCase: DetailsUseCase
    private var post: PostModel?
    private var anyCancellable = Set<AnyCancellable>()

    init(useCase: DetailsUseCase = DetailsUseCase(), post: PostModel? = nil) {
        self.useCase = useCase
        self.post = post
    }

    func viewDidLoad() {
        print(post)
    }

    func getDetails() {
        useCase.getDetails().receive(on: DispatchQueue.main)
            .sink { finish in
                print(finish)
            } receiveValue: { [weak self] post in
                guard let self = self else {return}
                self.output.post = post
            }.store(in: &anyCancellable)
    }
}
