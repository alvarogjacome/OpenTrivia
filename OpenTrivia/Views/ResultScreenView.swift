//
//  ResultScreenView.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 12/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct ResultScreenView: View {
    @ObservedObject var viewModel: ResultScreenViewModel
    @State private var isAnimating = false

    var body: some View {
        ZStack(alignment: .center) {
            CustomColor.royalCurtsy
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .center, spacing: 20) {
                PlayersStatusResultView(players: viewModel.getPlayers())
                Spacer()

                Text(viewModel.getWinnerResultTitle())
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primary)
                    .frame(width: 150)
                    .background(
                        Circle()
                            .stroke(LinearGradient(gradient: CustomGradient.ViceCity, startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 6)
                            .rotationEffect(Angle(degrees: self.isAnimating ? 360 : 0.0))
                            .animation(Animation.linear(duration: 1)
                                .repeatForever(autoreverses: false))
                            .frame(width: 200, height: 200)
                            .shadow(color: CustomColor.blueBell, radius: 10)
                            .shadow(color: CustomColor.hotMagenta, radius: 5)
                            .shadow(color: .black, radius: 20)
                    )

                Spacer()
                CustomButtonView(action: viewModel.backHome, text: Strings.backToHome, textColor: .primary, horizontalPadding: 70, verticalPadding: 20)
            }
            .padding()
        }

        .onAppear {
            self.isAnimating = true
        }
    }
}
