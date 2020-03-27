//
//  ColorDetailScreenshots.swift
//  FastlaneScreenshots
//
//  Created by Pedro Vasconcelos on 27/03/2020.
//  Copyright © 2020 PMV Peter. All rights reserved.
//

import XCTest

class ColorDetailScreenshots: FastlaneScreenshotsTestCase {

    func testColorDetail() {
        XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["systemRed"]/*[[".cells.staticTexts[\"systemRed\"]",".staticTexts[\"systemRed\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        snapshot("3ColorDetail")
    }

}

