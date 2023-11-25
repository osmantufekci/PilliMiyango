//
//  Block.swift
//  Pilli Miyango
//
//  Created by Osman Tufekci on 13.11.2023.
//

import SwiftUI

struct LotteryView: View {
    
    @State var model: any BlockModels
    @State var blockType: BlockTypes
    
    var body: some View {
        VStack {
            
            VStack {
                Image(uiImage: blockType.logo)
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .background(blockType.color)
                    
                Text("BÜYÜK İKRAMİYE")
                    .foregroundStyle(blockType.color)
                    .font(.title3)
                    
                Text((model.jackpotTotal?.asCurrency(type: blockType)) ?? "")
                    .foregroundStyle(blockType.color)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            Divider()
            
            VStack {
                Text("SON ÇEKİLİŞ SONUCU")
                    .foregroundStyle(blockType.color)
                    .font(.title2)
                    .padding(.vertical, 4)
                Text("Çekiliş no: \(model.latestDrawNumber ?? 0) - \(model.latestDrawDate ?? "") - \(model.latestDrawTime ?? "")")
                    .font(.headline)
                    .padding(.vertical, 4)
                    .padding(.bottom, 8)
                if model is BlockMilliPiyango {
                    Text(model.winningSerie ?? "--")
                        .foregroundStyle(blockType.color)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(4)
                        .border(Color.black)
                }else{
                    
                    let numbers = blockType == .OnNumara ? model.onNumaraCombine() : model.latestDraw ?? model.latestDrawL1 ?? []
                    
                    NumberInTheBall(blockType: blockType, drawNumbers: numbers, jollyNumber: model.numberJolly?.first, superstarNumber: model.superstar?.first)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Divider()
            
            VStack {
                Text("SONRAKİ ÇEKİLİŞ'E KALAN")
                    .foregroundStyle(blockType.color)
                    .font(.title3)
                    .padding(.vertical,4)
                let date = EpochTimeConverter()
                    .asDateString(milliseconds: model.drawTimestamp)
                
                Text("Çekiliş no: \(model.nextDrawNumber ?? 0) - \(date!)")
                    .font(.headline)
                    .padding(4)
                
                let time = EpochTimeConverter().calculate(with: Double(model.drawTimestamp!))
                TimerView(timeRemaining: Int(time), blockType: blockType)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            
            HStack(spacing: 6) {
                if blockType != .MilliPiyango {
                    NavigationLink {
                        YoutubeViewContainer(blockType: blockType, number: "\(model.latestDrawNumber ?? -1)")
                    } label: {
                        Text("Çekiliş Videosunu İzle")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(blockType.color)
                            .tint(.white)
                            .cornerRadius(6)
                    }
                    .padding(.leading, 4)
                }
                NavigationLink {
                    DetailView(blockType: blockType, drawNumber: "\(model.latestDrawNumber ?? -1)")
                } label: {
                    Text("Detay")
                        .padding()
                        .font(.headline)
                        .fontWeight(.semibold)
                        .background(blockType.color)
                        .foregroundStyle(.white)
                        .cornerRadius(6)
                }
                .padding(.trailing, 4)
                
            }
            .padding(.bottom)
            .frame(maxWidth: .infinity)
        }
        .cornerRadius(0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .shadow(radius: 5)
        
    }
    
}

#Preview {
    MainView()
        .environmentObject(ModelProvider())
}
