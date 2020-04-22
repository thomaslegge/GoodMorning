//
//  GoodMorningHome.swift
//  GoodMorning
//
//  Created by Thomas Legge on 22/04/20.
//  Copyright © 2020 Thomas Legge. All rights reserved.
//

import SwiftUI

struct GoodMorningHome: View {
    var body: some View {
        ZStack {

            Color("Background").edgesIgnoringSafeArea(.all)

            VStack {

                    VStack {
                        HStack {
                            VStack {
                                HeroText(heroString: "Good Morning,", heroWidth: 330, heroHeight: 60)
                                    .offset(x: -10)
                                HeroText(heroString: "Thomas", heroWidth: 330, heroHeight: 60)
                                    .offset(x: -10)
                                HStack {
                                    StandardText(textString: "Today in Auckland.")
                                    Spacer()
                                }
                            }
                            
                            Spacer()
                        }
                        .padding(.top, 30)
                        .padding(.leading, 25)
                        
                        Spacer()
                        
                        HStack {
                            
                            VStack(spacing: 24) {
                                
                                NeumorphicButton(frameHeight: 94, labelText: "", onPress: {})
                                    .overlay(
                                        HStack {
                                            
                                            Spacer()
                                            
                                            Image(systemName: "cloud.sun.rain.fill")
                                            .font(.system(size: 42, weight: Font.Weight.semibold, design: Font.Design.rounded))
                                            .foregroundColor(Color("Text"))
                                            
                                            Spacer()
                                            
                                            VStack {
                                                StandardText(textString: "16° - 20°")
                                                StandardText(textString: "Feels Like: 19°")
                                            }
                                            
                                            Spacer()
                                        }
                                )
                                
                                VStack {
                                    StandardText(textString: "Overcast Clouds")
                                    StandardText(textString: "Moderate chance of rain")
                                    StandardText(textString: "Bring a light jacket")
                                }
                                
                                NeumorphicButton(onPress: {})
                                NeumorphicButton(onPress: {})
                                NeumorphicButton(onPress: {})
                            }
                        }
                        .offset( x: 0, y: -20)
                    }
                
                
                Spacer()
                
                BaseLogo()
                
            }
        }
    }
}

struct GoodMorningHome_Previews: PreviewProvider {
    static var previews: some View {
        GoodMorningHome()
    }
}
