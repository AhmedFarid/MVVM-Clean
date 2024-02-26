//
//  PostsDataSources.swift
//  MVVM-Clean
//
//  Created by Systems on 25/02/2024.
//

import UIKit

final class PostsDataSources: NSObject  {

    // MARK: - Pro k
    private let postViewModel: PostsSectionViewModel

    //MARK: - Init
    init(_ postViewModel: PostsSectionViewModel) {
        self.postViewModel = postViewModel
    }
}
//
extension PostsDataSources: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postViewModel.dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        cell.titleLabel.text = postViewModel.dataSource[indexPath.item].title
        cell.bodyLabel.text = postViewModel.dataSource[indexPath.item].body
        return cell
    }
}
