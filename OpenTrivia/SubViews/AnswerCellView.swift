//
//  AnswerCellView.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 10/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct AnswerCellView: View {
    @Binding var selected: String
    let answer: String

    var body: some View {
        Button(action: {
            self.selected = self.answer

        }) {
            HStack {
                Text(answer)
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(.primary)

                Spacer()

                if self.selected == answer {
                    SFSymbols.check
                    .resizable()
                        .background(Color.primary
                            .frame(width: 22, height: 22)
                            .cornerRadius(50))
                        .foregroundColor(Color.blue)
                        .frame(width: 25, height: 25)

                } else {
                    Circle()
                        .stroke(lineWidth: 3)
                        .fill(CustomColor.estateBlue)
                        .frame(width: 25, height: 25)
                }
            }
            .foregroundColor(.black)
        }
        .padding(10)
        .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(lineWidth: 3)
            .foregroundColor(CustomColor.estateBlue)
        )
        .padding(.horizontal, 10)
    }
}
