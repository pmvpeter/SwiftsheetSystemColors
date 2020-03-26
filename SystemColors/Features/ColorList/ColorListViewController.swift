//
//  ColorListViewController.swift
//  SystemColors
//
//  Created by Pedro Vasconcelos on 19/03/2020.
//  Copyright © 2020 PMV Peter. All rights reserved.
//

import UIKit

class ColorListViewController: UIViewController {

    // MARK: - Private properties

    private let coordinator: ColorListCoordinator

    private let viewModel: ColorListViewModel

    private lazy var colorsContainerViewController = {
        ColorsContainerViewController(coordinator: coordinator, viewModel: viewModel, viewType: .list)
    }()

    private var isCurrentViewTypeList = true

    private lazy var listViewButton: UIBarButtonItem = {
        let listImage = UIImage(systemName: "rectangle.grid.1x2.fill")!
        let button = UIBarButtonItem(image: listImage, style: .plain, target: self, action: #selector(viewTypeToggleButtonTapped(sender:)))
        return button
    }()

    private lazy var gridViewButton: UIBarButtonItem = {
        let gridImage = UIImage(systemName: "square.grid.2x2.fill")!
        let button = UIBarButtonItem(image: gridImage, style: .plain, target: self, action: #selector(viewTypeToggleButtonTapped(sender:)))
        return button
    }()

    // MARK: - Init

    init(coordinator: ColorListCoordinator, viewModel: ColorListViewModel) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UIViewController

    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground
        navigationItem.title = "System Colors"
        configureSubviews()
        setupConstraints()
    }

    // MARK: - Selectors

    @objc func viewTypeToggleButtonTapped(sender: UIBarButtonItem) {
        if isCurrentViewTypeList {
            colorsContainerViewController.transition(to: .grid)
            navigationItem.rightBarButtonItem = listViewButton

        } else {
            colorsContainerViewController.transition(to: .list)
            navigationItem.rightBarButtonItem = gridViewButton
        }

        isCurrentViewTypeList.toggle()
    }

    // MARK: - Private methods

    private func configureSubviews() {
        addChild(colorsContainerViewController)
        view.addSubview(colorsContainerViewController.view)

        navigationItem.rightBarButtonItem = isCurrentViewTypeList ? gridViewButton : listViewButton

        let searchController = UISearchController()
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false

        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false

        definesPresentationContext = true
    }

    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide

        colorsContainerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        colorsContainerViewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        colorsContainerViewController.view.rightAnchor.constraint(equalTo: safeArea.rightAnchor).isActive = true
        colorsContainerViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        colorsContainerViewController.view.leftAnchor.constraint(equalTo: safeArea.leftAnchor).isActive = true
        colorsContainerViewController.didMove(toParent: self)
    }
}

// MARK: - Private methods

extension ColorListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text else { return }
        viewModel.filter(using: query)
    }
}
