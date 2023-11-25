//
//  ListView.swift
//  Pilli Miyango
//
//  Created by Osman Tufekci on 16.11.2023.
//

import SwiftUI

struct ListView: View {
    
    var models: [any BlockModels]
    
    var body: some View {
        ScrollView {
            ForEach(Array(BlockTypes.allCases.enumerated()), id: \.offset) { id, type in
                LotteryListView(blockType: type, model: models[id])
            }
            .scrollIndicators(.never)
        }
        .shadow(radius: 10)
        .padding()
    }
}

#Preview{
    MainView()
        .environmentObject(ModelProvider())
}
