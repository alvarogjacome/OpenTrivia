//
//  LineDividerView.swift
//  Trivia
//
//  Created by Álvaro Gutiérrez Jácome on 10/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct LineDividerView: View {
    let color: Color
    let opacity: Double
    var body: some View {
        RoundedRectangle(cornerRadius: 50)
            .fill(LinearGradient(gradient: CustomGradient.ViceCity, startPoint: .leading, endPoint: .trailing))
            .opacity(opacity)
            .frame(height: 2)
    }
}
