//
//  Player.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 11/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import Foundation

struct Player: Identifiable, Comparable, Equatable {
    let id = UUID()
    let name: String
    private(set) var score: Int = 0

    mutating func updateScore() {
        score += 1
    }

    static func < (lhs: Player, rhs: Player) -> Bool {
        lhs.score > rhs.score
    }

    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.score == rhs.score
    }
}
