//
//  Coordinator.swift
//  MVVM-Clean
//
//  Created by Systems on 25/02/2024.
//

import Foundation

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] {get}
    func start()
}
