//
//  PostModel.swift
//  MVVM-Clean
//
//  Created by Systems on 24/02/2024.
//

import Foundation

struct PostModel: Codable {
    let title: String?
    let body: String?

    public init(title: String?, body: String?) {
        self.title = title
        self.body = body
    }
}
typealias Posts = [PostModel]
