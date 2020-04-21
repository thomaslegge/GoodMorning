//
//  ContentView.swift
//  GoodMorning
//
//  Created by Thomas Legge on 22/04/20.
//  Copyright © 2020 Thomas Legge. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Hello,")
                    .font(.system(size: 48, weight: Font.Weight.bold, design: Font.Design.rounded))
                
                Spacer()
            }
            .padding(.top, 30)
            .padding(.leading, 25)
            
            Spacer()
            
            NeumorphicButton()
            
            Image(systemName: "bubble.right.fill")
            .font(.system(size: 48, weight: Font.Weight.bold, design: Font.Design.rounded))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

struct NeumorphicButton: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .frame(width: 316, height: 58)
        }
        .onTapGesture {
            print("Pressed Neumorphic Button")
        }
    }
}
