//
//  EntryView.swift
//  GoodMorning
//
//  Created by Thomas Legge on 23/04/20.
//  Copyright © 2020 Thomas Legge. All rights reserved.
//

import SwiftUI

struct EntryView: View {
    @State var showWelcome: Bool
    
    func togglePage() {
        showWelcome.toggle()
    }
    
    var body: some View {
        ZStack {
            if showWelcome {
                WelcomeView(togglePage: togglePage)
            } else {
                GoodMorningHome(togglePage: togglePage)
            }
        }
    }
}

//struct EntryView_Previews: PreviewProvider {
//    static var previews: some View {
//        EntryView()
//    }
//}
