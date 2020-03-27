//
//  ColorListCoordinator.swift
//  SystemColors
//
//  Created by Pedro Vasconcelos on 19/03/2020.
//  Copyright © 2020 PMV Peter. All rights reserved.
//

import UIKit

class ColorListCoordinator {

    // MARK: - Properties

    let navigationController: UINavigationController

    // MARK: - Init

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Methods

    func start() {
        let colorListViewController = ColorListViewController(coordinator: self, viewModel: ColorListViewModel())
        navigationController.pushViewController(colorListViewController, animated: true)
    }

    func didSelectColor(systemColor: SystemColor) {
        let colorDetailViewModel = ColorDetailViewModel(systemColor: systemColor)
        let colorDetailViewController = ColorDetailViewController(viewModel: colorDetailViewModel)
        navigationController.pushViewController(colorDetailViewController, animated: true)
    }
    
}
