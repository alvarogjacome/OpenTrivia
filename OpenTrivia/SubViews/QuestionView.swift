//
//  QuestionView.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 10/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct QuestionView: View {
    let question: Question

    var body: some View {
        Text(self.question.question)
            .font(.title)
            .fontWeight(.light)
            .minimumScaleFactor(0.8)
            .foregroundColor(Color.primary)
            .multilineTextAlignment(.leading)
    }
}
