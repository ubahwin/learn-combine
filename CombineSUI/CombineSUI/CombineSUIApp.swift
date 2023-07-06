//
//  CombineSUIApp.swift
//  CombineSUI
//
//  Created by Иван Вдовин on 15.06.2023.
//

import SwiftUI

@main
struct CombineSUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(chlenVM: ChlenViewModel())
        }
    }
}
