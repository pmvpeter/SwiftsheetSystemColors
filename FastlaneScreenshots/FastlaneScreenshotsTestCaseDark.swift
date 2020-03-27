//
//  FastlaneScreenshotsTestCaseDark.swift
//  FastlaneScreenshots
//
//  Created by Pedro Vasconcelos on 27/03/2020.
//  Copyright © 2020 PMV Peter. All rights reserved.
//

import XCTest

class FastlaneScreenshotsTestCaseDark: XCTestCase {

    var app: XCUIApplication?

    override func setUp() {
        app = XCUIApplication()

        guard let app = app else { return }
        app.launchArguments.append("UITestingDarkModeEnabled")
        setupSnapshot(app)
        app.launch()
    }

    override func tearDown() {
        app = nil
    }

}
