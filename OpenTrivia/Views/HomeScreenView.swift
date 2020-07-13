//
//  HomeScreenView.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 11/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct HomeScreenView: View {
    @ObservedObject private var keyboard = KeyboardResponder()
    @ObservedObject var viewModel = HomeScreenViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                CustomColor.royalCurtsy
                    .edgesIgnoringSafeArea(.all)
                    .zIndex(-1)

                VStack(spacing: 50) {
                    Images.header
                        .padding(.bottom)
                    TextfieldContainer(textFieldOneText: $viewModel.playerOneName, textFieldTwoText: $viewModel.playerTwoName, buttonAction: {
                        self.hideKeyboard()
                        self.viewModel.startGame()
                    })
                }
                .padding(.bottom, keyboard.currentHeight)
                .animation(.spring())
                .padding(.horizontal)

                if viewModel.isLoading {
                    LoadingView()
                        .transition(AnyTransition.opacity.animation(.spring()))
                }

                NavigationLink(destination: QuestionScreenView(viewModel: QuestionScreenViewModel(with: viewModel.gameManager))
                    .navigationBarTitle("")
                    .navigationBarHidden(true), isActive: self.$viewModel.pushActive)
                {
                    EmptyView()
                }.hidden()

                if self.viewModel.isErrorShowing {
                    PopUpView(message: self.viewModel.errorMessage, action: self.viewModel.dismissError)
                        .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.3)))
                }
            }

            .onTapGesture {
                self.hideKeyboard()
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
