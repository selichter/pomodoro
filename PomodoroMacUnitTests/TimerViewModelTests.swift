//
//  TimerViewModelTests.swift
//  PomodoroMacUnitTests
//
//  Created by Sarah Lichter on 8/23/20.
//

import XCTest
@testable import Pomodoro

class TimerViewModelTests: XCTestCase {

    func testCounterSetsCurrentTime() {
        let thisCounter = Counter(counter: 1, countTo: 120)
        XCTAssertEqual(thisCounter.currentTime, 119)
    }
    
    func testTimeInMinsReturnsTimeString() {
        let thisCounter = Counter(counter: 1, countTo: 120)
        XCTAssertEqual(thisCounter.timeInMins(), "1:59")
    }
    
    func testTimeInMinsReturnsTimeStringWithZeroInSecondPlace() {
        let thisCounter = Counter(counter: 1, countTo: 65)
        XCTAssertEqual(thisCounter.timeInMins(), "1:04")
    }
    
    
}

