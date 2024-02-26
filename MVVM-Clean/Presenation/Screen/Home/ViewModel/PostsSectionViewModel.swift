//
//  PostsSectionViewModel.swift
//  MVVM-Clean
//
//  Created by Systems on 25/02/2024.
//

import Foundation

class PostsSectionViewModel {
    var dataSource: Posts
    init(_  dataSource: Posts) {
        self.dataSource = dataSource
    }
}
