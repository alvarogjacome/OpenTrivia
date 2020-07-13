//
//  String + Extension.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 11/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import Foundation

extension String {
    func fromBase64() -> String {
        guard let decodedData = Data(base64Encoded: self) else { return self}
        return String(data: decodedData, encoding: .utf8)!
    }
}
