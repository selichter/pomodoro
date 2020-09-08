//
//  ClockView.swift
//  Pomodoro
//
//  Created by Sarah Lichter on 8/23/20.
//

import SwiftUI

struct ClockView: View {
    var counter: Int
    var countTo: Int
    
    var body: some View {
        VStack {
            Text(counterToMins())
        }
    }
    
    func counterToMins() -> String {
        let currentTime = countTo - counter
        let seconds = currentTime % 60
        let minutes = Int(currentTime/60)
        
        return("\(minutes):\(seconds < 10 ? "0" : "")\(seconds)")
    }
    

}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView(counter: 0, countTo: 120)
    }
}
