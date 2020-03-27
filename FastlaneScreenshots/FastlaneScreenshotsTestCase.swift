//
//  FastlaneScreenshotsTestCase.swift
//  FastlaneScreenshots
//
//  Created by Pedro Vasconcelos on 26/03/2020.
//  Copyright © 2020 PMV Peter. All rights reserved.
//

import XCTest

class FastlaneScreenshotsTestCase: XCTestCase {

    var app: XCUIApplication?

    override func setUp() {
        app = XCUIApplication()

        guard let app = app else { return }
        setupSnapshot(app)
        app.launch()
    }

    override func tearDown() {
        app = nil
    }

}
