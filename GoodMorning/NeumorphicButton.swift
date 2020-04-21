//
//  NeumorphicButton.swift
//  GoodMorning
//
//  Created by Thomas Legge on 22/04/20.
//  Copyright © 2020 Thomas Legge. All rights reserved.
//

import SwiftUI

struct NeumorphicButton: View {
    @State var isPressed = false
    
    var onPress: () -> Void
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 12, style: .continuous)
            .frame(width: 316, height: 58)
            .foregroundColor(Color("Background"))
            .shadow(color: self.isPressed ? Color("Background") : Color(.white), radius: 3, x: -4, y: -4)
            .shadow(color: self.isPressed ? Color("Background") : Color("DarkShadow"), radius: 3, x: 4, y: 4)
            .overlay(
                ZStack {
                    Text("Next")
                        .font(.system(size: 21, weight: Font.Weight.semibold, design: Font.Design.rounded))
                        .foregroundColor(Color("Text"))
                    
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color("Background"), lineWidth: 4)
                        .shadow(color: self.isPressed ? Color("DarkShadow") : Color("Background"), radius: 3, x: 5, y: 5)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 15)
                    )
                        .shadow(color: self.isPressed ? Color(.white) : Color("Background"), radius: 2, x: -2, y: -2)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 15)
                    )
            })
            .animation(.easeInOut(duration: 0.16))
            .onTapGesture {
                self.isPressed = true
                self.onPress()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    self.isPressed = false
                }
        }
    }
}

struct NeumorphicButton_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphicButton(onPress: {})
    }
}
