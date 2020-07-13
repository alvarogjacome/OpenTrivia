//
//  ResultScreenViewModel.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 12/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

final class ResultScreenViewModel: ObservableObject {
    @ObservedObject private var gameManager: GameManager

    init(gameManager: GameManager) {
        self.gameManager = gameManager
    }

    func getPlayers() -> [Player] {
        gameManager.getPlayers()
    }

    func getWinnerResultTitle() -> String {
        let winner = gameManager.getWinner()

        if winner.count > 1 {
            return Strings.tie
        } else {
            return String(format: Strings.wins, winner.first!.name)
        }
    }

    func backHome() {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene

        if let windowScenedelegate = scene?.delegate as? SceneDelegate {
            let window = UIWindow(windowScene: scene!)
            window.rootViewController = UIHostingController(rootView: HomeScreenView())
            windowScenedelegate.window = window
            window.makeKeyAndVisible()
        }
    }
}
