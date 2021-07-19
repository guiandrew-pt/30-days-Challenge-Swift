//
//  ContentView.swift
//  MissonDay1
//
//  Created by Guilherme Andre on 01/07/2021.
//
//

import SwiftUI

struct ContentView: View {
    @State private var showDetails = false

    var body: some View {
        VStack(alignment: .leading) {
            Button("Show details") {
                showDetails.toggle()
            }

            if showDetails {
                Text("Day one 1, is finished!")
                        .font(.largeTitle)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
