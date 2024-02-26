//
//  HomeViewModel.swift
//  MVVM-Clean
//
//  Created by Systems on 24/02/2024.
//

import Foundation
import Combine

protocol HomeViewModelProtocol: AnyObject {
    var input: HomeViewModel.Input {get}
    var output: HomeViewModel.Output {get}

    func viewDidLoad()
}

final class HomeViewModel: ObservableObject, HomeViewModelProtocol, ViewModel {

    class Input {

    }

    class Output {
        @Published var posts: Posts = []
    }

    var input: Input = .init()
    var output: Output = .init()
    let useCase: HomeUseCase
    private var anyCancellable = Set<AnyCancellable>()

    init( useCase: HomeUseCase = HomeUseCase() ) {
        self.useCase = useCase
    }

    func viewDidLoad() {
        callPosts()
    }

    func callPosts() {
        useCase.getPosts().receive(on: DispatchQueue.main)
            .sink { finish in
                print(finish)
            } receiveValue: { [weak self] posts in
                guard let self = self else {return}
                self.output.posts = posts
            }.store(in: &anyCancellable)
    }

}
