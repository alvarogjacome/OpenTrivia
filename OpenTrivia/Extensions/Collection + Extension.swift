//
//  Collection + Extension.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 11/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import Foundation

extension Collection where Iterator.Element == String {
    func fromBase64() -> [String] {
        return self.compactMap { $0.fromBase64() }
    }
}
