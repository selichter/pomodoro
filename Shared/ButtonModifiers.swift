//
//  ButtonModifiers.swift
//  Pomodoro
//
//  Created by Sarah Lichter on 8/23/20.
//

import SwiftUI

struct PrimaryButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(pomBlue)
            .background(pomGray)
            .cornerRadius(5.0)
            .padding()
    }
}

