//
//  SystemColor.swift
//  SystemColors
//
//  Created by Pedro Vasconcelos on 19/03/2020.
//  Copyright © 2020 PMV Peter. All rights reserved.
//

import UIKit

enum SystemColor: CaseIterable {

    case systemRed
    case systemGreen
    case systemBlue
    case systemOrange
    case systemYellow
    case systemPink
    case systemPurple
    case systemTeal
    case systemIndigo
    case systemGray
    case systemGray2
    case systemGray3
    case systemGray4
    case systemGray5
    case systemGray6
    case label
    case secondaryLabel
    case tertiaryLabel
    case quaternaryLabel
    case link
    case placeholderText
    case separator
    case opaqueSeparator
    case systemBackground
    case secondarySystemBackground
    case tertiarySystemBackground
    case systemGroupedBackground
    case secondarySystemGroupedBackground
    case tertiarySystemGroupedBackground
    case systemFill
    case secondarySystemFill
    case tertiarySystemFill
    case quaternarySystemFill
    case lightText
    case darkText
    case groupTableViewBackground



    var uiColor: UIColor {
        switch self {
        case .systemRed:
            return .systemRed
        case .systemGreen:
            return .systemGreen
        case .systemBlue:
            return .systemBlue
        case .systemOrange:
            return .systemOrange
        case .systemYellow:
            return .systemYellow
        case .systemPink:
            return .systemPink
        case .systemPurple:
            return .systemPurple
        case .systemTeal:
            return .systemTeal
        case .systemIndigo:
            return .systemIndigo
        case .systemGray:
            return .systemGray
        case .systemGray2:
            return .systemGray2
        case .systemGray3:
            return .systemGray3
        case .systemGray4:
            return .systemGray4
        case .systemGray5:
            return .systemGray5
        case .systemGray6:
            return .systemGray6
        case .label:
            return .label
        case .secondaryLabel:
            return .secondaryLabel
        case .tertiaryLabel:
            return .tertiaryLabel
        case .quaternaryLabel:
            return .quaternaryLabel
        case .link:
            return .link
        case .placeholderText:
            return .placeholderText
        case .separator:
            return .separator
        case .opaqueSeparator:
            return .opaqueSeparator
        case .systemBackground:
            return .systemBackground
        case .secondarySystemBackground:
            return .secondarySystemBackground
        case .tertiarySystemBackground:
            return .tertiarySystemBackground
        case .systemGroupedBackground:
            return .systemGroupedBackground
        case .secondarySystemGroupedBackground:
            return .secondarySystemGroupedBackground
        case .tertiarySystemGroupedBackground:
            return .tertiarySystemGroupedBackground
        case .systemFill:
            return .systemFill
        case .secondarySystemFill:
            return .secondarySystemFill
        case .tertiarySystemFill:
            return .tertiarySystemFill
        case .quaternarySystemFill:
            return .quaternarySystemFill
        case .lightText:
            return .lightText
        case .darkText:
            return .darkText
        case .groupTableViewBackground: // Deprecated
            return .groupTableViewBackground
        }
    }
}


