//
//  PlayerStatusView.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 10/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct PlayerStatusView: View {
    let playerName: String
    let playerScore: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(playerName)
                    .font(.caption)
                    .foregroundColor(.primary)
                    .opacity(0.6)
                Spacer()
                Text(String(format: Strings.points, playerScore))
                    .font(.caption)
                    .foregroundColor(.primary)
                    .opacity(0.6)
            }
            LineDividerView(color: Color(.systemGray3), opacity: 0.3)
        }
    }
}

struct PlayerStatusResultView: View {
    let playerName: String
    let playerScore: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(playerName)
                    .font(.title)
                    .fontWeight(.thin)
                    .foregroundColor(.primary)
                Spacer()
                Text(String(format: Strings.points, playerScore))
                    .font(.title)
                    .fontWeight(.thin)

                    .foregroundColor(.primary)
            }
            LineDividerView(color: .primary, opacity: 1)
        }
    }
}
