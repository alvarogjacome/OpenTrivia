//
//  Game.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 11/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import Foundation

struct Game {
    private(set) var playerOne: Player
    private(set) var playerTwo: Player
    private(set) var questionNumber: Int = 1
    private(set) var totalOfQuestions: Int = 0

    mutating func updateScoreOfPlayerOne() {
        playerOne.updateScore()
    }

    mutating func updateScoreOfPlayerTwo() {
        playerTwo.updateScore()
    }

    mutating func updateTotalOfQuestions(_ number: Int) {
        totalOfQuestions = number
    }

    mutating func updateQuestionNumber() {
        questionNumber += 1
    }
}
