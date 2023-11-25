//
//  ModelHelper.swift
//  Pilli Miyango
//
//  Created by Osman Tufekci on 16.11.2023.
//

import SwiftUI

class ModelProvider: ObservableObject {
    
    func model(by type: BlockTypes) async -> BlockModels? {
        switch type {
        case .MilliPiyango:
            return try? await HTTPClient().sendRequest(url: MilliPiyangoAPI.blockMilliPiyango.url, responseModel: BlockMilliPiyango.self).get()
        case .SayisalLoto:
            return try? await HTTPClient().sendRequest(url: MilliPiyangoAPI.blockSayisalLoto.url, responseModel: BlockSayisalLoto.self).get()
        case .SuperLoto:
            return try? await HTTPClient().sendRequest(url: MilliPiyangoAPI.blockSuperLoto.url, responseModel: BlockSuperLoto.self).get()
        case .SansTopu:
            return try? await HTTPClient().sendRequest(url: MilliPiyangoAPI.blockSansTopu.url, responseModel: BlockSansTopu.self).get()
        case .OnNumara:
            return try? await HTTPClient().sendRequest(url: MilliPiyangoAPI.blockOnNumara.url, responseModel: BlockOnNumara.self).get()
        }
    }
    
    func model(type: BlockTypes) async -> DrawDetailModel? {
        switch type {
        case .MilliPiyango:
            return try? await HTTPClient().sendRequest(url: MilliPiyangoAPI.blockMilliPiyango.url, responseModel: MilliPiyangoTableResult.self).get()
        case .SayisalLoto:
            return try? await HTTPClient().sendRequest(url: MilliPiyangoAPI.blockSayisalLoto.url, responseModel: SayisalTableResult.self).get()
        case .SuperLoto:
            return try? await HTTPClient().sendRequest(url: MilliPiyangoAPI.blockSuperLoto.url, responseModel: SuperLotoTableResult.self).get()
        case .SansTopu:
            return try? await HTTPClient().sendRequest(url: MilliPiyangoAPI.blockSansTopu.url, responseModel: SansTopuTableResult.self).get()
        case .OnNumara:
            return try? await HTTPClient().sendRequest(url: MilliPiyangoAPI.blockOnNumara.url, responseModel: OnNumaraTableResult.self).get()
        }
    }
    
    func models() async -> [BlockModels] {
        var array = [BlockModels]()
        for type in BlockTypes.allCases {
            if let model = await model(by: type) {
                array.append(model)
            }
        }
        return array
    }
    
    var blockModels: [any BlockModels] = [
        HTTPClient().getMockData(from: "BlockMilliPiyangoResult", modelType: BlockMilliPiyango.self)!,
        HTTPClient().getMockData(from: "BlockSayisalLotoResult", modelType: BlockSayisalLoto.self)!,
        HTTPClient().getMockData(from: "BlockSuperLotoResult", modelType: BlockSuperLoto.self)!,
        HTTPClient().getMockData(from: "BlockSansTopuResult", modelType: BlockSansTopu.self)!,
        HTTPClient().getMockData(from: "BlockOnNumaraResult", modelType: BlockOnNumara.self)!
    ]
}
