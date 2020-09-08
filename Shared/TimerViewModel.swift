//
//  TimerViewModel.swift
//  Pomodoro
//
//  Created by Sarah Lichter on 8/23/20.
//

import Foundation


class Counter: ObservableObject {
    @Published var countTo: Int = 15000
    @Published var remainingTimeString: String = ""
    
    var counter: Int
    var currentTime: Int
    
    init(counter: Int, countTo: Int) {
        self.counter = counter
        self.countTo = countTo
        self.currentTime = countTo - counter
    }

    func timeInMins() {
        let remainingSeconds = currentTime % 60
        let minutes = currentTime/60

        self.remainingTimeString = "\(minutes):\(remainingSeconds < 10 ? "0" : "")\(remainingSeconds)"
    }
    
    func decreaseTime() {
        if countTo > 0 {
            countTo -= 1
        }
    }
}
