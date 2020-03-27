//
//  ColorsTableViewController.swift
//  SystemColors
//
//  Created by Pedro Vasconcelos on 19/03/2020.
//  Copyright © 2020 PMV Peter. All rights reserved.
//

import UIKit

class ColorsTableViewController: UIViewController {

    // MARK: - Private properties

    private let coordinator: ColorListCoordinator

    private let viewModel: ColorListViewModel

    private lazy var tableView = {
        UITableView(frame: .zero, style: .plain)
    }()

    private let notificationCenter = NotificationCenter.default

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

        configureSubviews()
        setupConstraints()

        notificationCenter.addObserver(self, selector: #selector(didUpdateColors), name: Constant.NotificationName.colorsUpdated, object: nil)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if self.traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            tableView.reloadData()
        }
    }

    // MARK: - Selectors

    @objc func didUpdateColors() {
        tableView.reloadData()
    }

    // MARK: - Private methods

    private func configureSubviews() {
        view.addSubview(tableView)

        let colorTableViewCellNib = UINib(nibName: "ColorTableViewCell", bundle: nil)
        tableView.register(colorTableViewCellNib, forCellReuseIdentifier: "ColorTableViewCell")
    }

    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true

        tableView.dataSource = self
        tableView.delegate = self
    }

}

// MARK: - UITableViewDataSource

extension ColorsTableViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorTableViewCell", for: indexPath) as? ColorTableViewCell else {
            return UITableViewCell()
        }

        let color = viewModel.item(at: indexPath)
        cell.configure(for: color)

        return cell
    }

}

// MARK: - UITableViewDataSource

extension ColorsTableViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let color = viewModel.item(at: indexPath)
        coordinator.didSelectColor(systemColor: color)
    }
    
}
