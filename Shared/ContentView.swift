//
//  ContentView.swift
//  Shared
//
//  Created by Sarah Lichter on 8/20/20.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            TimerView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(width: 750, height: 500)
            .background(Color(#colorLiteral(red: 0.3568627451, green: 0.5568627451, blue: 0.7803921569, alpha: 1)))
    }
}
