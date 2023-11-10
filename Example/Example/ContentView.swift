//
//  ContentView.swift
//  Example
//
//  Created by Kristóf Kálai on 10/11/2023.
//

import SwiftUI
import RatioHorizonalStack

struct ContentView: View {
    var body: some View {
        RatioHorizonalStack(ratio: .equal, spacing: 15, occupySpacingFrom: .middle) {
            Color.red
                .frame(height: 50)
        } trailing: {
            Color.blue
                .frame(height: 50)
        }
    }
}

#Preview {
    ContentView()
}
