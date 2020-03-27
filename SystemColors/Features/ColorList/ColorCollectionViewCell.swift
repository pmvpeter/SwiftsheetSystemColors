//
//  ColorCollectionViewCell.swift
//  SystemColors
//
//  Created by Pedro Vasconcelos on 19/03/2020.
//  Copyright © 2020 PMV Peter. All rights reserved.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlets

    @IBOutlet weak var colorContainerView: UIView!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var colorIdentifierLabel: UILabel!

    // MARK: - UICollectionViewCell methods
    
    override func awakeFromNib() {
        super.awakeFromNib()

        colorContainerView.layer.borderWidth = 0.5
        colorContainerView.layer.borderColor = UIColor.systemGray2.cgColor
        colorContainerView.layer.cornerRadius = 3

        colorView.layer.cornerRadius = 3
    }

    func configure(for systemColor: SystemColor) {
        colorView.backgroundColor = systemColor.uiColor
        colorIdentifierLabel.text = String(describing: systemColor)
    }

}
