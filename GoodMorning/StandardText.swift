//
//  StandardText.swift
//  GoodMorning
//
//  Created by Thomas Legge on 22/04/20.
//  Copyright © 2020 Thomas Legge. All rights reserved.
//

import SwiftUI

struct StandardText: View {
    var textString = "Next"
    
    var body: some View {
        Text(textString)
            .font(.system(size: 21, weight: Font.Weight.semibold, design: Font.Design.rounded))
            .foregroundColor(Color("Text"))
    }
}
struct StandardText_Previews: PreviewProvider {
    static var previews: some View {
        StandardText()
    }
}
