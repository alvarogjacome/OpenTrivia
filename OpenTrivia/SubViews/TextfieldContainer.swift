//
//  TextfieldContainer.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 12/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct TextfieldContainer: View {
    @Binding var textFieldOneText: String
    @Binding var textFieldTwoText: String

    let buttonAction: () -> Void

    var body: some View {
        VStack {
            VStack {
                CustomTextField(fieldText: self.$textFieldOneText, placeHolder: Strings.nickOne)

                LineDividerView(color: .black, opacity: 1)
                    .padding(.vertical)

                CustomTextField(fieldText: self.$textFieldTwoText, placeHolder: Strings.nickTwo)
            }
            .padding(.vertical)
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
            .background(Color(.black).opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.top, 25)
            .shadow(color: Color.black.opacity(0.5), radius: 10, x: 10, y: 10)

            Button(action: buttonAction) {
                Text("Start Game")
                    .foregroundColor(.primary)
                    .padding(.vertical)
                    .frame(width: UIScreen.screenSize.width - 100)

            }.background(
                LinearGradient(gradient: CustomGradient.ViceCity, startPoint: .leading, endPoint: .trailing)
            )
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .offset(y: -40)
            .padding(.bottom, -40)
            .shadow(radius: 15)
        }
    }
}
