//
//  HomeViewController.swift
//  MVVM-Clean
//
//  Created by Systems on 24/02/2024.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    private let viewModel: HomeViewModelProtocol
    weak var coordinator: HomeTransitionDelegate?
    private var dataSources: PostsDataSources?
    private var anyCancellable = Set<AnyCancellable>()


    init(viewModel: HomeViewModelProtocol = HomeViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: "HomeViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
         fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        registerCell()
        bindToPostsDataSources()
        setupUI()
    }

    func setupUI() {
        title = "Home"
    }

    func registerCell() {
        tableView.register(UINib(nibName: String(describing: PostCell.self), bundle: .main), forCellReuseIdentifier: String(describing: PostCell.self))
    }

        func bindToPostsDataSources() {
        viewModel.output
            .$posts.sink { [weak self] posts in
                guard let self = self else {return}
                let postsSectionViewModel = PostsSectionViewModel(posts)
                self.dataSources = .init(postsSectionViewModel)
                self.tableView.dataSource = dataSources
                self.tableView.delegate = self
                self.tableView.reloadData()
            }.store(in: &anyCancellable)
    }



    func navigateToDetails(index: Int) {
        coordinator?.goDetails(post: viewModel.output.posts[index])
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToDetails(index: indexPath.row)
    }
}
// ViewController instance from ViewModel
// ViewModel instance form UseCase
// UseCase instance from repository
// repository instance from remote&local Data
