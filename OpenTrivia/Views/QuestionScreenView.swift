//
//  ContentView.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 08/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct QuestionScreenView: View {
    @ObservedObject var viewModel: QuestionScreenViewModel
    @State private var selected = ""
    @State private var showPopUp = false
    @State private var correctAnswer = false

    var body: some View {
        ZStack {
            CustomColor.royalCurtsy
                .edgesIgnoringSafeArea(.all)
                .zIndex(-1)

            VStack(spacing: 20) {
                PlayersStatusView(players: viewModel.getPlayers())
                HeaderView(timeRemaining: self.viewModel.timeRemaining, currentPlayer: viewModel.getCurrentPlayer())
                CurrentQuestionView(questionNumber: viewModel.getCurrentQuestionNumber(), totalQuestions: viewModel.getTotalQuestionsNumber())

                GeometryReader { geometry in
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 10) {
                            QuestionView(question: self.viewModel.getQuestion())
                            Spacer()

                            ForEach(self.viewModel.getQuestion().answers, id: \.self) {
                                AnswerCellView(selected: self.$selected, answer: $0)
                                    .animation(.spring())
                            }
                            CustomButtonView(action: self.checkAnswer, text: Strings.check, textColor: .primary, horizontalPadding: 50, verticalPadding: 20)
                        }
                        .frame(width: geometry.size.width)
                        .frame(minHeight: geometry.size.height)
                    }.id(self.viewModel.getCurrentQuestionNumber())
                }
            }
            .padding(.top)
            .padding(.horizontal, 20)
            .disabled(showPopUp)

            if self.$showPopUp.wrappedValue {
                PopUpView(message: String(format: Strings.answer, self.correctAnswer ? Strings.correct : Strings.incorrect),
                          action: self.nextQuestion)
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.3)))
            }

            NavigationLink(destination: self.viewModel.getResultView()
                .navigationBarTitle("")
                .navigationBarHidden(true), isActive: self.viewModel.getGameEnded())
            {
                EmptyView()
            }.hidden()

                .onReceive(self.viewModel.timer, perform: { _ in
                    self.viewModel.updateTimeRemaining()
                    if self.viewModel.timeRemaining <= 0 {
                        self.checkAnswer()
                    }
            })
        }
        .onAppear {
            self.viewModel.resetTimer()
        }
        .navigationBarBackButtonHidden(true)
    }

    private func checkAnswer() {
        self.correctAnswer = self.viewModel.checkAnswer(self.selected)
        self.showPopUp = true
    }

    private func nextQuestion() {
        self.showPopUp = false
        self.viewModel.nextQuestion()
    }
}
