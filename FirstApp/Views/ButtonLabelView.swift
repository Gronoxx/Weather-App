//
//  ButtonLabelView.swift
//  FirstApp
//
//  Created by Gustavo  Dias Apolinário  on 27/10/24.
//

import SwiftUI

struct ButtonLabelView: View {
    
    var text: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
        Text(text)
            .frame(width: 280, height: 50)
            .foregroundStyle(textColor)
            .background(backgroundColor)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
    }
}
