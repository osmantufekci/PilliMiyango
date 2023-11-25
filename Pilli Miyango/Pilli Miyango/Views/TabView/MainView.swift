//
//  TabView.swift
//  Pilli Miyango
//
//  Created by Osman Tufekci on 16.11.2023.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var modelProvider: ModelProvider
    @State var models: [BlockModels]?
    
    var body: some View {
        TabView {
            Group {
                
                NavigationStack {
                    if let models = models, !models.isEmpty {
                        ContentView(models: models)
                    }else{
                        LoadingView()
                    }
                }
                .tabItem {
                    Label("Oyunlar", systemImage: "checklist")
                }
                
                NavigationStack {
                    if let models = models, !models.isEmpty {
                        ListView(models: models)
                            
                    }
                    else {
                        LoadingView()
                    }
                }
                .tabItem {
                    Label("Tümü", systemImage: "list.clipboard")
                }
            }
            .cornerRadius(10)
        }
        .padding(.horizontal, 4)
        .onAppear() {
            loadData()
        }
    }
    
    func loadData() {
        Task {
            // Your async/await code here to load data
            // For example, fetch data and then:
            models = await modelProvider.models()
        }
    }

}

#Preview {
    MainView()
        .environmentObject(ModelProvider())
}


