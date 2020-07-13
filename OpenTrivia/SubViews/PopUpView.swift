//
//  PopUpView.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 11/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct PopUpView: View {
    let message: String
    let action: () -> Void
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.7)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 10) {
                Text(self.message)
                    .font(.title)
                    .fontWeight(.thin)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.7)
                    .padding()

                CustomButtonView(action: self.action, text: Strings.continu, textColor: .primary, horizontalPadding: 40, verticalPadding: 20)
            }
            .padding(20)
            .background(Color(.black)
                .opacity(0.9))
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .shadow(color: CustomColor.hotMagenta.opacity(0.5), radius: 10, x: -2, y: -2)
            .shadow(color: CustomColor.blueBell.opacity(0.5), radius: 10, x: 2, y: 2)
        }
    }
}
