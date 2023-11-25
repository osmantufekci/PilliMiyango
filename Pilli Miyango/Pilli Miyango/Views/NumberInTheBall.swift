//
//  NumberInTheBall.swift
//  Pilli Miyango
//
//  Created by Osman Tufekci on 14.11.2023.
//

import SwiftUI

struct NumberInTheBall: View {
    
    let blockType: BlockTypes
    
    var drawNumbers: [Int] = [0,1,2,3,4,5,6,7,8,10,11,12,13,14,15,16,17,18,19,20,21,22]
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 8)
    
    let jollyNumber: Int?
    let superstarNumber: Int?
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 5) {
            ForEach(drawNumbers, id: \.self) { n in
                Circle()
                    .fill(blockType.color)
                    .frame(width: 30, height: 30)
                    .overlay(
                        Text("\(n)")
                            .fontWeight(.medium)
                            .foregroundStyle(.white)
                    )
            }
            
            if let jollyNumber {
                Circle()
                    .fill(Color.joker)
                    .frame(width: 30, height: 30)
                    .overlay(
                        Text("\(jollyNumber)")
                            .fontWeight(.medium)
                            .foregroundStyle(.white)
                    )
            }
            if let superstarNumber {
                Circle()
                    .fill(Color.superstar)
                    .frame(width: 30, height: 30)
                    .overlay(
                        Text("\(superstarNumber)")
                            .fontWeight(.medium)
                            .foregroundStyle(.black)
                    )
            }
        }
    }
}


//#Preview {
//    NumberInTheBall(blockType: .SuperLoto, jollyNumber: nil, superstarNumber: nil)
//}


#Preview {
    MainView()
        .environmentObject(ModelProvider())
}
