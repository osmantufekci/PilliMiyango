//
//  PageControl.swift
//  Pilli Miyango
//
//  Created by Osman Tufekci on 24.11.2023.
//

import SwiftUI

struct PageControl: View {
    
    let numberOfPages: Int
    @Binding var currentPage: Int
    private let circleSize: CGFloat = 20
    private let circleSpacing: CGFloat = 4
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Circle()
                    .stroke(Color.gray, lineWidth: 1)
                    .frame(width: 14, height: 14)
                    .background(Circle().fill(Color.clear))
                    .overlay(
                        Circle()
                            .fill(index == currentPage ? BlockTypes.allCases[currentPage].color : Color.clear)
                            .frame(width: 6, height: 6)
                    )
                    .padding(circleSpacing / 2)
                    .animation(.easeOut(duration: 0.2), value: currentPage)
            }
        }
        
        .frame(maxWidth: .infinity, alignment: .center)
    }
}
