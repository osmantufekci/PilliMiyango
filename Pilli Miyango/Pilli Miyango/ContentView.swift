//
//  ContentView.swift
//  Pilli Miyango
//
//  Created by Osman Tufekci on 13.11.2023.
//

import SwiftUI

struct ContentView: View {

    var models: [any BlockModels]!
    var drawDetailModels: [any DrawDetailModel]!
    @State var selectedTabIndex = 0
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                TabView(selection: $selectedTabIndex) {
                    ForEach(Array(BlockTypes.allCases.enumerated()), id: \.offset) { id, type in
                        LotteryView(model: models[id], blockType: type)
                            .frame(width: geometry.size.width*0.97)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                PageControl(numberOfPages: 5, currentPage: $selectedTabIndex)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    MainView()
        .environmentObject(ModelProvider())
}
