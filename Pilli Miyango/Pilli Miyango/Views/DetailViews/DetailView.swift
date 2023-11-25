//
//  DetailView.swift
//  Pilli Miyango
//
//  Created by Osman Tufekci on 17.11.2023.
//

import SwiftUI

import SwiftUI

struct DetailView: View {
    
    @State var blockType: BlockTypes
    
    @State var drawDetailmodel: DrawDetailModel?
    @State var drawNumber: String
    
    var body: some View {
        if let model = drawDetailmodel {
                ScrollView {
                    VStack {
                        // Logo ve başlık
                        VStack {
                            Image(uiImage: blockType.logo)
                            Text("\(model.dateDetails) \(model.timeDetails) - Çekiliş Sonuçları")
                                .font(.headline)
                            Text("ÇEKİLİŞ NO : \(model.number)")
                                .fontWeight(.bold)
                        }
                        .padding(.horizontal)
                        // Çekiliş numaraları
                        
                        NumberInTheBall(blockType: blockType, drawNumbers: model.winningNumber ,jollyNumber: model.numberJolly?.first, superstarNumber: model.superstar?.first)
                            .padding(.horizontal)
                        
                        
                        if blockType == .MilliPiyango {
                            Divider()
                            MilliPiyangoDetailView(lotteryData: model)
                                .padding(.horizontal)
                            Divider()
                        }
                        else {
                            VStack {
                                HStack {
                                    Text("KATEGORİ")
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text("KAZANAN")
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text("İKRAMİYE")
                                        .fontWeight(.bold)
                                }
                                
                                .padding(.vertical, 4)
                                .font(.subheadline)
                                
                                Divider()
                                
                                if blockType == .SayisalLoto {

                                    ForEach(model.toLotteryResult(), id: \.category) { result in
                                        HStack {
                                            Text(result.category)
                                                .font(.system(.callout))
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                            Spacer()
                                            Text("\(result.winners)")
                                                .font(.system(.callout))
                                                .frame(maxWidth: 80)
                                            
                                            Spacer()
                                            Text(result.prize)
                                                .font(.system(.callout))
                                                .frame(maxWidth: .infinity, alignment: .trailing)
                                        }
                                    }
                                }
                                else if blockType == .SuperLoto || blockType == .OnNumara || blockType == .SansTopu {
                                    ForEach(model.tableResult, id: \.numbersMatched) { result in
                                        HStack {
                                            Text(result.numbersMatched ?? "")
                                                .font(.system(.callout))
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                            Spacer()
                                            Text(result.totalWinners ?? "")
                                                .font(.system(.callout))
                                                .frame(maxWidth: 80)
                                            
                                            Spacer()
                                            Text(result.prizeWinner ?? "")
                                                .font(.system(.callout))
                                                .frame(maxWidth: .infinity, alignment: .trailing)
                                        }
                                    }
                                }
                                Divider()
                            }
                            .padding()
                        }
                        if blockType != .MilliPiyango {
                            YoutubeViewContainer(blockType: blockType, number: drawNumber)
                                .padding(.horizontal, 8)
                        }
                    }
                }
                .task {
                    
                    switch blockType {
                    case .MilliPiyango:
                        drawDetailmodel = try? await HTTPClient().sendRequest(url: MilliPiyangoAPI.milliPiyango(drawNumber, year: Date().year).drawDetailsURL,
                                                                    responseModel: MilliPiyangoTableResult.self).get()
                    case .SayisalLoto:
                        drawDetailmodel = try? await HTTPClient().sendRequest(url: MilliPiyangoAPI.sayisalLoto(drawNumber, year: Date().year).drawDetailsURL,
                                                                    responseModel: SayisalTableResult.self).get()
                    case .SuperLoto:
                        drawDetailmodel = try? await HTTPClient().sendRequest(url: MilliPiyangoAPI.superLoto(drawNumber, year: Date().year).drawDetailsURL,
                                                                    responseModel: SuperLotoTableResult.self).get()
                    case .SansTopu:
                        drawDetailmodel = try? await HTTPClient().sendRequest(url: MilliPiyangoAPI.sansTopu(drawNumber, year: Date().year).drawDetailsURL,
                                                                    responseModel: SansTopuTableResult.self).get()
                    case .OnNumara:
                        drawDetailmodel = try? await HTTPClient().sendRequest(url: MilliPiyangoAPI.onNumara(drawNumber, year: Date().year).drawDetailsURL,
                                                                    responseModel: OnNumaraTableResult.self).get()
                    }
                    
                }
                .cornerRadius(10)
        }
        else if drawDetailmodel?.tableResult.isEmpty == true {
            ZStack {
                Image(uiImage: .talihKusu)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    
                Text("Henüz oynanmış bir oyun yok")
                    .frame(maxWidth: .infinity, maxHeight: 150)
                    .font(.custom("Roboto-Bold", size: 25.0))
                    .shadow(color: .orange, radius: 3)
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemBackground))
            .edgesIgnoringSafeArea(.all)
        }
        else {
            LoadingView()
                .task {
                    switch blockType {
                    case .MilliPiyango:
                        drawDetailmodel = try? await HTTPClient().sendRequest(url: MilliPiyangoAPI.milliPiyango(drawNumber, year: Date().year).drawDetailsURL,
                                                                              responseModel: MilliPiyangoTableResult.self).get()
                    case .SayisalLoto:
                        drawDetailmodel = try? await HTTPClient().sendRequest(url: MilliPiyangoAPI.sayisalLoto(drawNumber, year: Date().year).drawDetailsURL,
                                                                              responseModel: SayisalTableResult.self).get()
                    case .SuperLoto:
                        drawDetailmodel = try? await HTTPClient().sendRequest(url: MilliPiyangoAPI.superLoto(drawNumber, year: Date().year).drawDetailsURL,
                                                                              responseModel: SuperLotoTableResult.self).get()
                    case .SansTopu:
                        drawDetailmodel = try? await HTTPClient().sendRequest(url: MilliPiyangoAPI.sansTopu(drawNumber, year: Date().year).drawDetailsURL,
                                                                              responseModel: SansTopuTableResult.self).get()
                    case .OnNumara:
                        drawDetailmodel = try? await HTTPClient().sendRequest(url: MilliPiyangoAPI.onNumara(drawNumber, year: Date().year).drawDetailsURL,
                                                                              responseModel: OnNumaraTableResult.self).get()
                    }
                }
        }
    }
}

#Preview {
    DetailView(blockType: .MilliPiyango, drawNumber: "76")
}
