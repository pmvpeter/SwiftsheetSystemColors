//
//  ColorDetailViewController.swift
//  SystemColors
//
//  Created by Pedro Vasconcelos on 20/03/2020.
//  Copyright © 2020 PMV Peter. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {

    // MARK: - Private properties

    private let viewModel: ColorDetailViewModel

    private enum TextStyleIdentifier: CaseIterable {
        case largeTitle
        case headline
        case subheadline
        case title1
        case title2
        case title3
        case body
        case callout
        case caption1
        case caption2
        case footnote

        var textStyle: UIFont.TextStyle {
            switch self {
            case .largeTitle:
                return .largeTitle
            case .headline:
                return .headline
            case .subheadline:
                return .subheadline
            case .title1:
                return .title1
            case .title2:
                return .title2
            case .title3:
                return .title3
            case .body:
                return .body
            case .callout:
                return .callout
            case .caption1:
                return .caption1
            case .caption2:
                return .caption2
            case .footnote:
                return .footnote
            }
        }
    }

    // Views

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 24
        return stackView
    }()

    private lazy var colorView: ColorView = {
        let colorView = ColorView()
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.configure(for: viewModel.color)
        return colorView
    }()

    private lazy var hexValue: UILabel = {
        let hexValue = UILabel()
        hexValue.text = viewModel.color.hexString()
        hexValue.font = .preferredFont(forTextStyle: .subheadline)
        hexValue.textColor = .secondaryLabel
        return hexValue
    }()

    private lazy var rgbValue: UILabel = {
        let rgbValue = UILabel()
        rgbValue.text = viewModel.color.rgbString()
        rgbValue.font = .preferredFont(forTextStyle: .subheadline)
        rgbValue.textColor = .secondaryLabel
        return rgbValue
    }()

    // MARK: - Init

    init(viewModel: ColorDetailViewModel) {
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

        title = viewModel.title

        configureSubviews()
        setupConstraints()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if self.traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            hexValue.text = viewModel.color.hexString()
            rgbValue.text = viewModel.color.rgbString()
        }
    }

    // MARK: - Private methods

    private func configureSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(colorView)

        let rgbHexStackView = UIStackView()
        rgbHexStackView.axis = .horizontal
        rgbHexStackView.spacing = 16
        let hexStackView = UIStackView()
        hexStackView.axis = .horizontal
        hexStackView.spacing = 4
        let hexLabel = UILabel()
        hexLabel.text = "HEX"
        hexLabel.font = .preferredFont(forTextStyle: .subheadline)
        hexLabel.textColor = .tertiaryLabel
        hexStackView.addArrangedSubview(hexLabel)
        hexStackView.addArrangedSubview(hexValue)

        let rgbStackView = UIStackView()
        rgbStackView.axis = .horizontal
        rgbStackView.spacing = 4
        let rgbLabel = UILabel()
        rgbLabel.text = "RGB"
        rgbLabel.font = .preferredFont(forTextStyle: .subheadline)
        rgbLabel.textColor = .tertiaryLabel
        rgbStackView.addArrangedSubview(rgbLabel)
        rgbStackView.addArrangedSubview(rgbValue)
        rgbHexStackView.addArrangedSubview(hexStackView)
        rgbHexStackView.addArrangedSubview(rgbStackView)
        stackView.addArrangedSubview(rgbHexStackView)

        for textStyleIdentifier in TextStyleIdentifier.allCases {
            let textStyleStackView = UIStackView()
            textStyleStackView.axis = .vertical
            textStyleStackView.alignment = .center
            textStyleStackView.spacing = 4

            let identifierLabel = UILabel()
            identifierLabel.text = String(describing: textStyleIdentifier)
            identifierLabel.font = .preferredFont(forTextStyle: .callout)
            identifierLabel.textColor = .tertiaryLabel
            textStyleStackView.addArrangedSubview(identifierLabel)

            let exampleTextLabel = UILabel()
            exampleTextLabel.text = "Quick brown fox"
            exampleTextLabel.font = .preferredFont(forTextStyle: textStyleIdentifier.textStyle)
            exampleTextLabel.textColor = viewModel.color
            textStyleStackView.addArrangedSubview(exampleTextLabel)

            stackView.addArrangedSubview(textStyleStackView)
        }
    }

    private func setupConstraints() {
        let margins = view.layoutMarginsGuide

        // scrollView (use safe area?)
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true

        // contentView
        // The equalHeightConstraintmakes it possible to add views to contentView without adding bottom contraints.
        // Useful for very short scroll views that do not have enough content for scrolling.
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        let equalHeightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        equalHeightConstraint.priority = .init(rawValue: 250)
        equalHeightConstraint.isActive = true

        // stackView
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32).isActive = true
        stackView.leftAnchor.constraint(equalTo: margins.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32).isActive = true

        // colorView
        colorView.widthAnchor.constraint(lessThanOrEqualToConstant: 250).isActive = true
        let halfWidthConstraint = colorView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        halfWidthConstraint.priority = .init(rawValue: 750)
        halfWidthConstraint.isActive = true
        colorView.heightAnchor.constraint(equalTo: colorView.widthAnchor).isActive = true
    }
}
