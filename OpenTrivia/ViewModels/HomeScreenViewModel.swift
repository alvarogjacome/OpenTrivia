//
//  HomeScreenViewModel.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 11/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

final class HomeScreenViewModel: ObservableObject {
    @ObservedObject private(set) var gameManager = GameManager(game: Game(playerOne: Player(name: "Player One"), playerTwo: Player(name: "Player Two")))

    @Published var playerOneName: String = "" {
        didSet {
            if playerOneName.count > characterLimit {
                playerOneName = String(playerOneName.prefix(characterLimit))
            }
        }
    }

    @Published var playerTwoName: String = "" {
        didSet {
            if playerTwoName.count > characterLimit {
                playerTwoName = String(playerTwoName.prefix(characterLimit))
            }
        }
    }

    @Published var pushActive = false
    @Published var isLoading = false
    @Published var isErrorShowing = false
    @Published var errorMessage = ""

    private let characterLimit = 10

    func startGame() {
        isLoading = true
        let playerOne = Player(name: playerOneName.isEmpty ? "Player One" : playerOneName)
        let playerTwo = Player(name: playerTwoName.isEmpty ? "Player Two" : playerTwoName)
        let game = Game(playerOne: playerOne, playerTwo: playerTwo)

        gameManager = GameManager(game: game)

        gameManager.fetchNewTrivia { [unowned self] response in
            DispatchQueue.main.async {
                self.isLoading = false
            }

            switch response {
                case .failure(let error):
                    dump(error)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.errorMessage = error.rawValue
                        self.isErrorShowing = true
                    }
                case .success:
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.pushActive = true
                    }
            }
        }
    }

    func dismissError() {
        isErrorShowing.toggle()
    }
}
