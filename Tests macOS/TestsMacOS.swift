//
//  Tests_macOS.swift
//  Tests macOS
//
//  Created by Sarah Lichter on 8/20/20.
//

import XCTest

class Tests_macOS: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        app.launch()
    }

    func testTapStartButtonStartsTimer() throws {
        var timerText = convertStaticTextElementToString("timerText")
        XCTAssertEqual(timerText, "Not Started")

        let startButton = app.buttons["Start"]
        startButton.tap()
        timerText = convertStaticTextElementToString("timerText")

        XCTAssertFalse(startButton.isEnabled)
        XCTAssertEqual(timerText, "STARTED")

    }

    func testTapPauseButtonPausesTimer() throws {
        let pauseButton = app.buttons["Pause"]
        let startButton = app.buttons["Start"]

        XCTAssertFalse(pauseButton.isEnabled)
        XCTAssertTrue(startButton.isEnabled)

        startButton.tap()

        XCTAssertTrue(pauseButton.isEnabled)
        XCTAssertFalse(startButton.isEnabled)

        pauseButton.tap()

        var timerText = convertStaticTextElementToString("timerText")

        XCTAssertFalse(pauseButton.isEnabled)
        XCTAssertTrue(startButton.isEnabled)

        XCTAssertEqual(timerText, "PAUSED")
    }

    func convertStaticTextElementToString(_ identifier: String) -> String {
        guard let stringText = app.staticTexts[identifier].value as? String else {
            return "No value found for \(identifier)"
        }
        return stringText
    }
}
