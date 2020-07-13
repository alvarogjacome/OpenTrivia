//
//  CustomTextField.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 12/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var fieldText: String

    let placeHolder: String

    var body: some View {
        HStack(spacing: 15) {
            SFSymbols.person
                .resizable()
                .frame(width: 18, height: 18)
                .foregroundColor(CustomColor.blueBell)

            TextField(placeHolder, text: self.$fieldText)

        }.padding(.vertical, 20)
    }
}
