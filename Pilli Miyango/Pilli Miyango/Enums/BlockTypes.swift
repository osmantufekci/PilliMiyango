//
//  BlockTypes.swift
//  Pilli Miyango
//
//  Created by Osman Tufekci on 14.11.2023.
//

import SwiftUI

enum BlockTypes: CaseIterable {
    
    case MilliPiyango
    case SayisalLoto
    case SuperLoto
    case SansTopu
    case OnNumara
    
    var color: Color {
        switch self {
        case .MilliPiyango:
            return .milliPiyango
        case .SayisalLoto:
            return .sayisalLoto
        case .SuperLoto:
            return .superLoto
        case .SansTopu:
            return .sansTopu
        case .OnNumara:
            return .onNumara
        }
    }
    
    var logo: UIImage {
        switch self {
        case .MilliPiyango:
            return .milliPiyango
        case .SayisalLoto:
            return .sayisalLoto
        case .SuperLoto:
            return .superLoto
        case .SansTopu:
            return .sansTopu
        case .OnNumara:
            return .onNumara
        }
    }
    
    var urlSuffix: String {
        switch self {
        case .MilliPiyango:
            return "millypiyango"
        case .SayisalLoto:
            return "sayisaloto"
        case .SuperLoto:
            return "superloto"
        case .SansTopu:
            return "sanstopu"
        case .OnNumara:
            return "onnumara"
        }
    }
    
    var mockDataFileName: String {
        switch self {
        case .MilliPiyango:
            return "BlockMilliPiyangoResult"
        case .SayisalLoto:
            return "BlockSayisalLotoResult"
        case .SuperLoto:
            return "BlockSuperLotoResult"
        case .SansTopu:
            return "BlockSansTopuResult"
        case .OnNumara:
            return "BlockOnNumaraResult"
        }
    }
    
    var mockDataDrawDetailFileName: String {
        switch self {
        case .MilliPiyango:
            return "DrawDetailMilliPiyangoResult"
        case .SayisalLoto:
            return "DrawDetailSayisalResult"
        case .SuperLoto:
            return "DrawDetailSuperLotoResult"
        case .SansTopu:
            return "DrawDetailSansTopuResult"
        case .OnNumara:
            return "DrawDetailOnNumaraResult"
        }
    }
    
    var title: String {
        switch self {
        case .MilliPiyango:
            return "Milli Piyango"
        case .SayisalLoto:
            return "Sayısal Loto"
        case .SuperLoto:
            return "Süper Loto"
        case .SansTopu:
            return "Şans Topu"
        case .OnNumara:
            return "On Numara"
        }
    }
    
}
