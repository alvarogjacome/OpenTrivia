//
//  GameManager.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 10/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

final class GameManager: ObservableObject {
    @Published private(set) var questions = [Question]()
    @Published private(set) var playerOneTurn: Bool = true
    @Published private(set) var game: Game
    @Published var gameEnded: Bool = false

    init(game: Game) {
        self.game = game
    }

    func getPlayers() -> [Player] {
        [game.playerOne, game.playerTwo]
    }

    func getTotalOfQuestions() -> Int {
        game.totalOfQuestions
    }

    func getQuestionNumber() -> Int {
        game.questionNumber
    }

    func getQuestion() -> Question {
        questions.first!
    }

    func checkAnswer(_ answer: String) -> Bool {
        let correct = answer == questions.first?.correctAnswer
        if correct {
            playerOneTurn ? game.updateScoreOfPlayerOne() : game.updateScoreOfPlayerTwo()
        }
        return correct
    }

    func nextQuestion() {
        if game.questionNumber == game.totalOfQuestions {
            gameEnded = true
        } else {
            game.updateQuestionNumber()
            playerOneTurn.toggle()
            questions.removeFirst()
        }
    }

    func getWinner() -> [Player] {
        let players = getPlayers().sorted()

        if players.first! == players.last! {
            return players
        } else {
            return [players.first!]
        }
    }

    func fetchNewTrivia(completionHandler: @escaping (Result<Trivia, CustomError>) -> Void) {
        NetworkManager.shared.fetch { [unowned self] (response: Result<Trivia, CustomError>) in
            switch response {
                case .failure(let error):
                    dump(error)
                    completionHandler(response)
                case .success(let game):
                    DispatchQueue.main.async {
                        self.game.updateTotalOfQuestions(game.results.count)
                        self.questions = game.results
                        completionHandler(response)
                    }
            }
        }
    }
}
