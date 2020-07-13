//
//  PlayersStatusView.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 10/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct PlayersStatusView: View {
    let players: [Player]

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(players) { player in
                PlayerStatusView(playerName: player.name, playerScore: player.score)
            }
        }
    }
}

struct PlayersStatusResultView: View {
    let players: [Player]

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(players) { player in
                PlayerStatusResultView(playerName: player.name, playerScore: player.score)
            }
        }
    }
}
