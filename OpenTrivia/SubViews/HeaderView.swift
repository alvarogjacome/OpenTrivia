//
//  HeaderView.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 10/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    let timeRemaining: CGFloat
    let currentPlayer: Player

    var body: some View {
        VStack(spacing: 5) {
            Text(currentPlayer.name)
                .font(.title)
                .fontWeight(.thin)
                .foregroundColor(Color.primary)

            ZStack {
                LinearGradient(gradient: CustomGradient.ViceCity, startPoint: .leading, endPoint: .trailing)
                    .frame(width: timeRemaining * ((UIScreen.screenWidth - 50) / 15), height: (UIScreen.screenWidth / 15) - 10)
                    .clipShape(RoundedRectangle(cornerRadius: 100))
                    .frame(width: UIScreen.screenWidth - 50, height: (UIScreen.screenWidth / 15) - 10, alignment: .leading)
                    .frame(width: UIScreen.screenWidth - 40, height: UIScreen.screenWidth / 15)
                    .background(RoundedRectangle(cornerRadius: 100)
                        .stroke(lineWidth: 2)
                        .fill(Color(.secondaryLabel))
                        .opacity(0.2))
                    .animation(.spring())

                HStack(alignment: .center, spacing: 10) {
                    Text(String(format: Strings.timeRemaining, Int(ceil(self.timeRemaining))))
                    Spacer()
                    SFSymbols.clock
                        .resizable()
                        .frame(width: (UIScreen.screenWidth / 15) - 14, height: (UIScreen.screenWidth / 15) - 14)
                }
                .font(.caption)
                .foregroundColor(Color(.secondaryLabel))
                .padding()
                .frame(width: UIScreen.screenWidth - 50, alignment: .leading)
            }
        }
    }
}
