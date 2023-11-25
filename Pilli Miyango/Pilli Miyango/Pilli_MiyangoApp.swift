//
//  Pilli_MiyangoApp.swift
//  Pilli Miyango
//
//  Created by Osman Tufekci on 13.11.2023.
//

import SwiftUI

@main
struct Pilli_MiyangoApp: App {
    var modelProvider = ModelProvider()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(modelProvider)
        }
    }
}
