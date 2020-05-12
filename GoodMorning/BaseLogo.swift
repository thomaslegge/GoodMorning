//
//  BaseLogo.swift
//  GoodMorning
//
//  Created by Thomas Legge on 22/04/20.
//  Copyright © 2020 Thomas Legge. All rights reserved.
//

import SwiftUI

struct BaseLogo: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Gradient-1"), Color("Gradient-2")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .frame(width: 50, height: 50)
                .mask(
                    Image(systemName: "bubble.right.fill")
                        .font(.system(size: 48))
                        .offset(y: 10)
            )
            
            Image(systemName: "bed.double.fill")
                .font(.system(size: 24))
                .foregroundColor(Color("Background"))
                .offset(y: -3)
        }
        .onTapGesture {
            UIApplication.shared.open(URL(string: "https://github.com/thomaslegge/GoodMorning")!)
        }
    }
}

struct BaseLogo_Previews: PreviewProvider {
    static var previews: some View {
        BaseLogo()
    }
}
