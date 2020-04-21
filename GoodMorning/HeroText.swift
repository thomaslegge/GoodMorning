//
//  HeroText.swift
//  GoodMorning
//
//  Created by Thomas Legge on 22/04/20.
//  Copyright © 2020 Thomas Legge. All rights reserved.
//

import SwiftUI

struct HeroText: View {
    var heroString = "Hello,"
    var heroWidth = 130
    var heroHeight = 58
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Gradient-1"), Color("Gradient-2")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .frame(width: CGFloat(heroWidth), height: CGFloat(heroHeight), alignment: .leading)
                .mask(
                    Text(heroString)
                        .font(.system(size: 48, weight: Font.Weight.bold, design: .rounded))
            )
        }
    }
}

struct HeroText_Previews: PreviewProvider {
    static var previews: some View {
        HeroText()
    }
}
