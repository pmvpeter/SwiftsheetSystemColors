//
//  ColorTableViewCell.swift
//  SystemColors
//
//  Created by Pedro Vasconcelos on 19/03/2020.
//  Copyright © 2020 PMV Peter. All rights reserved.
//

import UIKit

class ColorTableViewCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet weak var colorContainerView: UIView!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var colorIdentifierLabel: UILabel!
    @IBOutlet weak var hexValueLabel: UILabel!
    @IBOutlet weak var rgbValueLabel: UILabel!

    // MARK: - UITableViewCell methods

    override func awakeFromNib() {
        super.awakeFromNib()

        colorContainerView.layer.borderWidth = 0.5
        colorContainerView.layer.borderColor = UIColor.systemGray2.cgColor
        colorContainerView.layer.cornerRadius = 3

        colorView.layer.cornerRadius = 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(for systemColor: SystemColor) {
        colorView.backgroundColor = systemColor.uiColor
        colorIdentifierLabel.text = String(describing: systemColor)
        hexValueLabel.text = systemColor.uiColor.hexString()
        rgbValueLabel.text = systemColor.uiColor.rgbString()
    }

}
