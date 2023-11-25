//
//  LotteryListView.swift
//  Pilli Miyango
//
//  Created by Osman Tufekci on 14.11.2023.
//

import SwiftUI

struct LotteryListView: View {
    
    var blockType: BlockTypes
    var model: any BlockModels
    
    var body: some View {
        VStack {
            HStack {
                Image(uiImage: blockType.logo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                VStack(alignment: .trailing) {
                    Text("Çekiliş No: \(model.latestDrawNumber!)")
                        .font(.custom("Roboto", size: 17.0))
                        .fontWeight(.medium)
                    
                    Text("\(model.latestDrawDate ?? "") - \(model.latestDrawTime ?? "")")
                        .font(.custom("Roboto", size: 17.0))
                        .fontWeight(.medium)
                }
                .padding(.horizontal)
            }
            VStack {
                if model is BlockMilliPiyango {
                    
                    Text(model.winningSerie ?? "--")
                        .foregroundStyle(blockType.color)
                        .font(.title)
                        .fontWeight(.bold)
                        .border(Color.black)
                }
                else if model is BlockOnNumara {
                    NumberInTheBall(blockType: blockType, drawNumbers: model.latestDrawL1 ?? [], jollyNumber: nil, superstarNumber: nil)
                    NumberInTheBall(blockType: blockType, drawNumbers: model.latestDrawL2 ?? [], jollyNumber: nil, superstarNumber: nil)
                    NumberInTheBall(blockType: blockType, drawNumbers: model.latestDrawL3 ?? [], jollyNumber: nil, superstarNumber: nil)
                }
                else{
                    VStack {
                        NumberInTheBall(blockType: blockType, drawNumbers: model.latestDraw ?? [], jollyNumber: model.numberJolly?.first, superstarNumber: model.superstar?.first)
                    }
                    .padding(.vertical, 8)
                }
            }
            .padding(.top)
        }
        .background(blockType.color.opacity(0.2))
        .cornerRadius(8)
    }
}

#Preview {
//    LotteryListView(blockType: .SayisalLoto, model: HTTPClient().getMockData(from: "BlockSayisalLotoResult", modelType: BlockSayisalLoto.self)!)
    
    MainView()
        .environmentObject(ModelProvider())
}
