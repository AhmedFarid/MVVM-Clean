//
//  DetailsCoordinator.swift
//  MVVM-Clean
//
//  Created by Systems on 25/02/2024.
//

import UIKit

protocol DetailsTransitionDelegate: AnyObject {
    func backHome()
}

class DetailsCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController

    weak var parentCoordinator: HomeChilDelegate?
    private var post: PostModel?

    init(navigationController: UINavigationController, post: PostModel?) {
        self.navigationController = navigationController
        self.post = post 
    }

    deinit {
        print("de init \(self.self)")
    }

    func start() {
        guard let post = post else {return}
        let viewController = DetailsViewController(viewModel: DetailsViewModel(post: post))
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension DetailsCoordinator: DetailsTransitionDelegate {
    func backHome() {
        parentCoordinator?.didFinish(self)
    }
}
