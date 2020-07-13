//
//  LoadingView.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 11/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    @State private var shouldAnimate = false

    var body: some View {
        ZStack {
            Color.black
                .opacity(0.7)
                .edgesIgnoringSafeArea(.all)

            HStack(alignment: .center, spacing: shouldAnimate ? 30 : 10) {
                BigColumn(shouldAnimate: $shouldAnimate)
                LittleColumn(shouldAnimate: $shouldAnimate)
                BigColumn(shouldAnimate: $shouldAnimate)
                LittleColumn(shouldAnimate: $shouldAnimate)
                BigColumn(shouldAnimate: $shouldAnimate)
            }
            .frame(width: shouldAnimate ? 160 : 110)
            .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true))
            .onAppear {
                self.shouldAnimate = true
            }
        }
    }
}

private struct BigColumn: View {
    @Binding var shouldAnimate: Bool

    var body: some View {
        VStack(spacing: 20) {
            Circle()
                .fill(LinearGradient(gradient: CustomGradient.ViceCity, startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 15, height: 15)
                .scaleEffect(shouldAnimate ? 2 : 1)
        }
        .shadow(color: .black, radius: 5)
    }
}

private struct LittleColumn: View {
    @Binding var shouldAnimate: Bool

    var body: some View {
        VStack(spacing: 20) {
            Circle()
                .fill(LinearGradient(gradient: CustomGradient.ViceCity, startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 15, height: 15)
                .scaleEffect(shouldAnimate ? 1 : 2)
        }
        .shadow(color: .black, radius: 5)
    }
}
