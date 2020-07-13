//
//  Constants.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 13/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

enum SFSymbols {
    static let clock = Image(systemName: "clock.fill")
    static let person = Image(systemName: "person.crop.circle")
    static let check = Image(systemName: "checkmark.circle.fill")
}

enum Images {
    static let header = Image("header")
}

enum Strings {
    static let questionNumber = "Question %d/%d"
    static let timeRemaining = "%ds"
    static let points = "%d points"
    static let continu = "Continue"
    static let nickOne = "Nickname player one"
    static let nickTwo = "Nickname player two"
    static let tie = "It's a tie!"
    static let wins = "%@ wins!"
    static let backToHome = "Back to home"
    static let check = "Check"
    static let correct = "Correct"
    static let incorrect = "Incorrect"
    static let answer = "%@ answer"
}
