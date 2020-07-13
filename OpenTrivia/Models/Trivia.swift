//
//  Game.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 10/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import Foundation

struct Trivia: Codable {
    let responseCode: Int
    let results: [Question]
}
