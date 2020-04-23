//
//  NeumorphicTextField.swift
//  GoodMorning
//
//  Created by Thomas Legge on 22/04/20.
//  Copyright © 2020 Thomas Legge. All rights reserved.
//

import SwiftUI

struct NeumorphicTextField: View {
    @Binding var textInput: String
    var onTapField: () -> Void
    var onLoseFocus: () -> Void
    var textFill = "Hello"
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12, style: .continuous)
            .frame(width: 316, height: 58)
            .foregroundColor(Color("Background"))
            .shadow(color: Color(.white), radius: 3, x: -4, y: -4)
            .shadow(color: Color("DarkShadow"), radius: 3, x: 4, y: 4)
            .overlay(
                ZStack {
                    TextField(textFill, text:$textInput, onEditingChanged: { focus in
                        focus ? self.onTapField() : self.onLoseFocus()
                    }) {
                        print("commit")
                    }
                    .multilineTextAlignment(.center)
                    .font(.system(size: 21, weight: Font.Weight.semibold, design: Font.Design.rounded))
                    .foregroundColor(Color("Text"))
                    
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color("Background"), lineWidth: 4)
                        .shadow(color: Color("DarkShadow"), radius: 3, x: 5, y: 5)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 15)
                    )
                        .shadow(color: Color(.white), radius: 2, x: -2, y: -2)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 15)
                    )
            })
    }
}
