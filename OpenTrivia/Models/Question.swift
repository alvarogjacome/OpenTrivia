//
//  Question.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 10/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import Foundation

struct Question: Codable {
    let question: String
    let category: String
    let difficulty: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    let answers: [String]

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.question = try container.decode(String.self, forKey: .question).fromBase64()
        self.category = try container.decode(String.self, forKey: .category).fromBase64()
        self.difficulty = try container.decode(String.self, forKey: .difficulty).fromBase64()
        self.correctAnswer = try container.decode(String.self, forKey: .correctAnswer).fromBase64()
        self.incorrectAnswers = try container.decode([String].self, forKey: .incorrectAnswers).fromBase64()

        self.answers = (incorrectAnswers + [correctAnswer]).shuffled()
    }

    init(question: String, category: String, difficulty: String, correctAnswer: String, incorrectAnswers: [String]) {
        self.question = question
        self.category = category
        self.difficulty = difficulty
        self.correctAnswer = correctAnswer
        self.incorrectAnswers = incorrectAnswers
        self.answers = (incorrectAnswers + [correctAnswer]).shuffled()
    }
}
