//
//  ColorListViewModel.swift
//  SystemColors
//
//  Created by Pedro Vasconcelos on 19/03/2020.
//  Copyright © 2020 PMV Peter. All rights reserved.
//

import UIKit

class ColorListViewModel {

    // MARK: - Properties

    var numberOfItems: Int {
        return colors.count
    }

    // MARK: - Private Properties

    private var colors: [SystemColor]
    private var originalColors: [SystemColor]

    private let notificationCenter = NotificationCenter.default

    // MARK: - Init

    init() {
        colors = SystemColor.allCases
        originalColors = colors
    }

    // MARK: - Methods

    func item(at indexPath: IndexPath) -> SystemColor {
        return colors[indexPath.row]
    }

    func filter(using query: String) {
        if query.isEmpty {
            colors = originalColors
        } else {
            colors = originalColors.filter {
                let colorIdentifier = String(describing: $0)
                return colorIdentifier.localizedCaseInsensitiveContains(query)
            }
        }

        notificationCenter.post(name: Constant.NotificationName.colorsUpdated, object: nil)
    }
    
}
