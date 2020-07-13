//
//  QuestionScreenViewModel.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 10/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

final class QuestionScreenViewModel: ObservableObject {
    @ObservedObject private var gameManager: GameManager
    @Published private(set) var timeRemaining: CGFloat = 15

    private(set) var start: Bool = false
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()

    init(with gameManager: GameManager) {
        self.gameManager = gameManager
    }

    func getGameEnded() -> Binding<Bool> {
        $gameManager.gameEnded
    }

    func getCurrentQuestionNumber() -> Int {
        gameManager.getQuestionNumber()
    }

    func getTotalQuestionsNumber() -> Int {
        gameManager.getTotalOfQuestions()
    }

    func getQuestion() -> Question {
        return gameManager.getQuestion()
    }

    func nextQuestion() {
        gameManager.nextQuestion()
        resetTimer()
    }

    func checkAnswer(_ answer: String) -> Bool {
        stopTimer()
        return gameManager.checkAnswer(answer)
    }

    func getPlayers() -> [Player] {
        gameManager.getPlayers()
    }

    func getCurrentPlayer() -> Player {
        let players = gameManager.getPlayers()
        return gameManager.playerOneTurn ? players.first! : players.last!
    }

    func updateTimeRemaining() {
        guard timeRemaining > 0.00, start else {
            return
        }
        timeRemaining -= 0.01
    }

    func stopTimer() {
        start = false
    }

    func resetTimer() {
        timeRemaining = 15
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.start = true
        }
    }

    func getResultView() -> ResultScreenView {
        ResultScreenView(viewModel: ResultScreenViewModel(gameManager: gameManager))
    }
}
