//
//  TimerView.swift
//  Pomodoro
//
//  Created by Sarah Lichter on 8/20/20.
//

import SwiftUI

struct TimerView: View {
    @State var timerText = "Not Started"
    @State var timerInProgress = false
    
    @ObservedObject var counter = Counter(counter: 1, countTo: 1500)
    
    let timer = Timer.publish(every: 1, on: .main, in: .common)
    
    
    
    var body: some View {
        ZStack {
            
            VStack {
                Text("\(counter.remainingTimeString)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    
                Text(timerText)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .bold()
                    .accessibility(identifier: "timerText")
                    .foregroundColor(.white)
                    .padding()
                
                HStack(alignment: .center) {
                    Button("Start") {
                        timer.connect()
                        timerText = "STARTED"
                        timerInProgress = !timerInProgress
                    }
                    .modifier(PrimaryButtonModifier())
                    .disabled(timerInProgress)
                    
                    Button("Pause") {
                        timer.connect().cancel()
                        timerText = "PAUSED"
                        timerInProgress = !timerInProgress
                    }
                    .modifier(PrimaryButtonModifier())
                    .disabled(!timerInProgress)
                }
            }

        }.onReceive(timer) { time in
            self.counter.decreaseTime()
//            if self.counter.countTo > 0 {
//                self.counter.countTo -= 1
//            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
