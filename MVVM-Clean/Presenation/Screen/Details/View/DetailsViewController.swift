//
//  DetailsViewController.swift
//  MVVM-Clean
//
//  Created by Systems on 25/02/2024.
//

import UIKit
import Combine

class DetailsViewController: UIViewController {

    private let viewModel: DetailsViewModelProtocol
    private var anyCancellable = Set<AnyCancellable>()
    weak var coordinator: DetailsTransitionDelegate?

    init(viewModel: DetailsViewModelProtocol = DetailsViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: "DetailsViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        setupUI()
    }

    override func viewWillDisappear(_ animated: Bool) {
        coordinator?.backHome()
    }

    func setupUI() {
        title = "Details"
    }

}
