//
//  MilliPiyangoDetailView.swift
//  Pilli Miyango
//
//  Created by Osman Tufekci on 18.11.2023.
//

import SwiftUI

struct MilliPiyangoDetailView: View {
    
    @State var lotteryData: DrawDetailModel
    
    var body: some View {
        VStack {
            // First category
            Section(header: Text(lotteryData.firstCategoryName)
                .font(.headline)
                .foregroundColor(BlockTypes.MilliPiyango.color)
                .cornerRadius(8)) {
                    ForEach(lotteryData.firstCategoryWinning, id: \.self) { number in
                        Text(number)
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(8)
                    }
                }
            
            // Second category
            Section(header: Text(lotteryData.secondCategoryName)
                .font(.headline)
                .foregroundColor(BlockTypes.MilliPiyango.color)
            ) {
                ForEach(lotteryData.secondCategoryWinning, id: \.self) { number in
                    Text(number)
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(8)
                }
            }
            
            // Other categories
            ForEach(lotteryData.categories, id: \.idCategory) { category in
                Section(header: Text(category.category)
                    .font(.headline)
                    .foregroundColor(BlockTypes.MilliPiyango.color)
                ) {
                    ForEach(category.winningSeries, id: \.self) { number in
                        Text(number)
                            .fontWeight(.medium)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color.pink.opacity(0.5))
                            .cornerRadius(8)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .listStyle(.inset)
    }
}

#Preview {
    MilliPiyangoDetailView(lotteryData:  HTTPClient().getMockData(from: BlockTypes.MilliPiyango.mockDataDrawDetailFileName, modelType: MilliPiyangoTableResult.self)!)
}
