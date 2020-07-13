//
//  CustomButtonView.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 12/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct CustomButtonView: View {
    let action: () -> Void
    let text: String
    let textColor: Color
    let horizontalPadding: CGFloat
    let verticalPadding: CGFloat

    var body: some View {
        Button(action: self.action) {
            Text(self.text)
                .fontWeight(.medium)
                .minimumScaleFactor(0.8)
                .foregroundColor(self.textColor)
                .padding(.vertical, verticalPadding)
                .padding(.horizontal, horizontalPadding)
        }
        .background(LinearGradient(gradient: CustomGradient.ViceCity, startPoint: .leading, endPoint: .trailing))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding()
    }
}
