//
//  ColorsCollectionViewController.swift
//  SystemColors
//
//  Created by Pedro Vasconcelos on 19/03/2020.
//  Copyright © 2020 PMV Peter. All rights reserved.
//

import UIKit

class ColorsCollectionViewController: UIViewController {

    // MARK: - Private properties

    private let coordinator: ColorListCoordinator

    private let viewModel: ColorListViewModel

    private let itemsPerRow: CGFloat = 4

    private let sectionInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)

    private let notificationCenter = NotificationCenter.default

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
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

        configureSubviews()
        setupConstraints()

        notificationCenter.addObserver(self, selector: #selector(didUpdateColors), name: Constant.NotificationName.colorsUpdated, object: nil)
    }

    // MARK: - Selectors

    @objc func didUpdateColors() {
        collectionView.reloadData()
    }

    // MARK: - Private methods

    private func configureSubviews() {
        view.addSubview(collectionView)

        let colorCollectionViewCellNib = UINib(nibName: "ColorCollectionViewCell", bundle: nil)
        collectionView.register(colorCollectionViewCellNib, forCellWithReuseIdentifier: "ColorCollectionViewCell")
    }

    private func setupConstraints() {
        // Extend collection view an extra 0.5 on both sides to account for rounding errors when calculating item width
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0.5).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -0.5).isActive = true
    }
}

// MARK: - UICollectionViewDataSource

extension ColorsCollectionViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCollectionViewCell", for: indexPath) as? ColorCollectionViewCell else { return UICollectionViewCell() }

        let color = viewModel.item(at: indexPath)
        cell.configure(for: color)

        return cell
    }

}

// MARK: - UICollectionViewDelegateFlowLayout

extension ColorsCollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let marginSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = collectionView.bounds.width - marginSpace
        let squareItemWidth = availableWidth / itemsPerRow
        return CGSize(width: squareItemWidth, height: squareItemWidth)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sectionInsets.left
    }

}

// MARK: - UITableViewDataSource

extension ColorsCollectionViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)

        let color = viewModel.item(at: indexPath)
        coordinator.didSelectColor(systemColor: color)
    }
    
}
