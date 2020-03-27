//
//  DarkColorsGridScreenshots.swift
//  FastlaneScreenshots
//
//  Created by Pedro Vasconcelos on 27/03/2020.
//  Copyright © 2020 PMV Peter. All rights reserved.
//

import XCTest

class DarkColorsGridScreenshots: FastlaneScreenshotsTestCaseDark {

    func testColorsGrid() {
        XCUIApplication().navigationBars["System Colors"].buttons["square.grid.2x2.fill"].tap()
        snapshot("Dark2ColorsGrid")
    }

}
