//
//  LoadingView.swift
//  Pilli Miyango
//
//  Created by Osman Tufekci on 19.11.2023.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            LottiePlusView(name: "Balls")
            Text("Yükleniyor")
                .font(.title2)
                .fontWeight(.medium)
        }
    }
}

#Preview {
    LoadingView()
}
