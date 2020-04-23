//
//  GMHostingController.swift
//  GoodMorning
//
//  Created by Thomas Legge on 23/04/20.
//  Copyright © 2020 Thomas Legge. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

/// #TODO: Seting status bar color
//class HostingController: UIHostingController<Entry> {
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
//}

class GMHostingController<Content> : UIHostingController<Content> where Content : View {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
}
