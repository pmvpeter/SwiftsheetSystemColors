//
//  ColorView.swift
//  SystemColors
//
//  Created by Pedro Vasconcelos on 20/03/2020.
//  Copyright © 2020 PMV Peter. All rights reserved.
//

import UIKit

class ColorView: UIView {

    // MARK: - Private properties

    private lazy var colorView: UIView = {
        let colorView = UIView()
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.layer.cornerRadius = 3
        return colorView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground

        layer.borderWidth = 0.5
        layer.borderColor = UIColor.systemGray2.cgColor
        layer.cornerRadius = 3

        configureSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func configureSubviews() {
        addSubview(colorView)
    }

    private func setupConstraints() {
        colorView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        colorView.heightAnchor.constraint(equalTo: colorView.widthAnchor).isActive = true
        colorView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        colorView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

    // MARK: - Methods

    func configure(for color: UIColor) {
        colorView.backgroundColor = color
    }
    
}
