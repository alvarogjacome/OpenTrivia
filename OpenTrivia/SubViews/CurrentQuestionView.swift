//
//  CurrentQuestionView.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 10/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct CurrentQuestionView: View {
    let questionNumber: Int
    let totalQuestions: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(String(format: Strings.questionNumber, questionNumber, totalQuestions))
                .font(.headline)
                .fontWeight(.light)
                .foregroundColor(Color(.secondaryLabel))

            RoundedRectangle(cornerRadius: 50)
                .fill(Color(.secondaryLabel))
                .opacity(0.3)
                .frame(height: 1)
        }
    }
}
