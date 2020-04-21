//
//  ContentView.swift
//  GoodMorning
//
//  Created by Thomas Legge on 22/04/20.
//  Copyright © 2020 Thomas Legge. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    
    @State var pageNumber = 1
    var prevPageNumber = 1
    
    @State var next: Bool = false
    
    func nextPage() {
        //self.pageState = .infoEntry
        withAnimation {
            
            pageNumber += 1
            
            if pageNumber > 2 {
                pageNumber = 2
            }
            
            if pageNumber < 1 {
                pageNumber = 1
            }
                        
            print(pageNumber)
        }
    }
    
    var body: some View {
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    HeroText()
                    
                    Spacer()
                }
                .padding(.top, 30)
                .padding(.leading, 25)

                .onTapGesture {
                    self.nextPage()
                }
                
                Spacer()
                
                if pageNumber == 1 {
                    HStack {
                        NeumorphicButton(onPress: nextPage)
                    }
                    .offset( x: 0, y: -20)
                    .transition(.move(edge: .leading))
                    .transition(AnyTransition.asymmetric(
                        insertion: .move(edge: .trailing),
                        removal: .move(edge: .leading)))
                }
                
                if pageNumber == 2 {
                    
                    NeumorphicTextField()
                    .offset( x: 0, y: -20)
                        .transition(AnyTransition.asymmetric(
                            insertion: .move(edge: .leading),
                        removal: .move(edge: .trailing)))
                }
                
                BaseLogo()
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
