//
//  View + Extension.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 12/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
