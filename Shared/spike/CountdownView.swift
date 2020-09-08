//
//  CountdownView.swift
//  Pomodoro
//
//  Created by Sarah Lichter on 8/23/20.
//

import SwiftUI

var timer = Timer.publish(every: 1, on: .main, in: .common)

struct CountdownView: View {
    @State var counter: Int = 0
    var countTo: Int = 1500
    
    @State var timerInProgress = false
    @State private var task: String = ""
    
    var body: some View {
        VStack {
            ZStack {
                ProgressTrack()
                ProgressBar(counter: counter, countTo: countTo)
//                get rid of the clock view? or make it a setting?
//                ClockView(counter: counter, countTo: countTo)
            }
            VStack(alignment: .center) {
//                circle should become the button
                Button("Start") {
                    startTimer()
                }
                .modifier(PrimaryButtonModifier())
                .disabled(timerInProgress)
                
                HStack {
                    Spacer()
                    TextField("What are you focusing on?", text: $task)
                        .foregroundColor(Color.white)
                        .padding(.horizontal)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.black)
                        
                        )
//                        .multilineTextAlignment(.center)
//                        .background(Color.green)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .font(.largeTitle)
                    Spacer()
                    
                    TextField("Placeholder Text", text: $task)
                         .foregroundColor(.white)
                         .padding(10)
                         .background(
                             RoundedRectangle(cornerRadius: 10)
                                 .foregroundColor(Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.5))

                                 // Add the outline

                                 .background(RoundedRectangle(cornerRadius: 8)

                                     .stroke(Color.gray, lineWidth: 2)))

                         .padding()
                }
                Text(task)
            }
        }.onReceive(timer, perform: { timer in
            if self.counter < self.countTo {
                self.counter += 1
            }
        })
    }
    
    func startTimer() {
        timer.connect()
        timerInProgress = !timerInProgress
    }
    
    func pauseTimer() {
//        capture counter and countTo
        timer.connect().cancel()
        timerInProgress = !timerInProgress
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView()
    }
}
