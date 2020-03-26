//
//  ColorsContainerViewController.swift
//  SystemColors
//
//  Created by Pedro Vasconcelos on 19/03/2020.
//  Copyright © 2020 PMV Peter. All rights reserved.
//

import UIKit

class ColorsContainerViewController: UIViewController {

    // MARK: - Properties

    enum ViewType {
        case list
        case grid
    }

    // MARK: - Private properties

    private let coordinator: ColorListCoordinator

    private let viewModel: ColorListViewModel

    private lazy var containedViewControllers: [ViewType: UIViewController] = {
        return [
            .list: ColorsTableViewController(coordinator: coordinator, viewModel: viewModel),
            .grid: ColorsCollectionViewController(coordinator: coordinator, viewModel: viewModel)
        ]
    }()

    private var currentViewType: ViewType

    // MARK: - Init

    init(coordinator: ColorListCoordinator, viewModel: ColorListViewModel, viewType: ViewType) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        currentViewType = viewType
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        transition(to: currentViewType)
    }

    // MARK: - Methods

    func transition(to viewType: ViewType) {
        // Remove current vc
        let currentVc = containedViewControllers[currentViewType]
        if currentVc?.parent != nil {
            currentVc?.willMove(toParent: nil)
            currentVc?.view.removeFromSuperview()
            currentVc?.removeFromParent()
        }

        guard let newVc = containedViewControllers[viewType] else { return }
        currentViewType = viewType
        addChild(newVc)
        view.addSubview(newVc.view)
        newVc.view.translatesAutoresizingMaskIntoConstraints = false
        newVc.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        newVc.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        newVc.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        newVc.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        newVc.didMove(toParent: self)
    }

}
