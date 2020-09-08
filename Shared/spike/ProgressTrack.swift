//
//  ProgressTrack.swift
//  Pomodoro
//
//  Created by Sarah Lichter on 8/23/20.
//

import SwiftUI

struct ProgressTrack: View {
    var body: some View {
        Circle()
            .fill(pomBlue)
            .frame(width: 250, height: 250)
            .overlay(Circle().stroke(pomBlue, lineWidth: 15))
    }
}

struct ProgressBar: View {
    var counter: Int
    var countTo: Int
    
    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 250, height: 250)
            .overlay(
                Circle().trim(from: 0, to: progress())
                    .stroke(
                        style: StrokeStyle(
                            lineWidth: 15,
                            lineCap: .square,
                            lineJoin: .round
                        )
                    ).foregroundColor(pomShadeBlue)
            ).animation(.easeInOut(duration: 0.2)
        )
    }
    
    func progress() -> CGFloat {
        return CGFloat(counter) / CGFloat(countTo)
    }
    
}

struct ProgressTrack_Previews: PreviewProvider {
    static var previews: some View {
        ProgressTrack()
    }
}
