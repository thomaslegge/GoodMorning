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
    @State var next: Bool = false
    @State var inputFocus = false
    
    @State private var nameInput: String = ""
    @State private var cityInput: String = ""
    
    /// Saves user inputs to userdefaults #TODO: Refactor as well as loading
    func saveUserData() {
        let userSave: UserData = UserData()
        
        userSave.name = nameInput
        userSave.city = cityInput
        
        let jsonEncoder = JSONEncoder()
        if let savedData = try? jsonEncoder.encode(userSave) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "userData")
        } else {
            print("Failed to save userData.")
        }
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func endFocus() {
        self.inputFocus = false
        self.hideKeyboard()
    }
    
    func nextPage() {
        //self.pageState = .infoEntry
        withAnimation {
            
            pageNumber += 1
            
            if pageNumber > 3 {
                pageNumber = 3
            }
            
            if pageNumber < 1 {
                pageNumber = 1
            }
            
            print("Page Number: \(pageNumber)")
        }
    }
    
    var body: some View {
        ZStack {
            
            Color("Background").edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    self.endFocus()
            }
            
            ZStack {
                
                Color("Background").edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        self.endFocus()
                }
                
                VStack {
                    
                    if pageNumber == 1 {
                        VStack {
                            HStack {
                                HeroText()
                                
                                Spacer()
                            }
                            .padding(.top, 30)
                            .padding(.leading, 25)
                            .onTapGesture {
                                self.pageNumber = 1
                            }
                            
                            Spacer()
                            
                            HStack {
                                NeumorphicButton(onPress: nextPage)
                            }
                            .offset( x: 0, y: -20)
                        }
                    }
                    
                    if pageNumber == 2 {
                        VStack(spacing: 24) {
                            HStack {
                                HeroText(heroString: "Tell us about yourself", heroWidth: 300, heroHeight: 130)
                                
                                Spacer()
                            }
                            .padding(.top, 30)
                            .padding(.leading, 25)
                            
                            Spacer()
                            
                            NeumorphicTextField(textInput: $nameInput, textFill: "Your Name?")
                                .onTapGesture {
                                    self.inputFocus = true
                            }
                            
                            NeumorphicTextField(textInput: $cityInput, textFill: "Where are you waking up?")
                                .onTapGesture {
                                    self.inputFocus = true
                            }
                            
                            NeumorphicButton(onPress: {self.nextPage(); self.saveUserData()})
                            
                        }
                        .offset( x: 0, y: -20)
                    }
                    
                    if pageNumber == 3 {
                        StandardText(textString: "Hello")
                            .onTapGesture {
                                self.pageNumber = 1
                        }
                    }
                    //
                    Spacer()
                    //
                    BaseLogo()
                    //
                }
            }
            .offset(y: inputFocus ? -325 : 0)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(pageNumber: 2)
    }
}
