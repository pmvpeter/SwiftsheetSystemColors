//
//  ColorDetailViewModel.swift
//  SystemColors
//
//  Created by Pedro Vasconcelos on 20/03/2020.
//  Copyright © 2020 PMV Peter. All rights reserved.
//

import UIKit

class ColorDetailViewModel {

    // MARK: - Properties

    var title: String {
        String(describing: systemColor)
    }

    var color: UIColor {
        systemColor.uiColor
    }

    // MARK: - Private properties

    private let systemColor: SystemColor

    init(systemColor: SystemColor) {
        self.systemColor = systemColor
    }
}
