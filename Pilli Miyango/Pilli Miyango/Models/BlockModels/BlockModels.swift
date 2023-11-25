//
//  BlockMilliPiyango.swift
//  Pilli Miyango
//
//  Created by Osman Tufekci on 14.11.2023.
//

import Foundation

protocol BlockModels {
    var id: String? { get }
    var latestDrawNumber: Int? { get }
    var latestDrawDate: String? { get }
    var latestDrawTime: String? { get }
    var jackpotTotal: String? { get }
    var nextDrawNumber: Int? { get }
    var drawTimestamp: Int? { get }
    var currentDate: String? { get }
    var winningSerie: String? { get }
    var latestDrawL1: [Int]? { get }
    var latestDrawL2: [Int]? { get }
    var latestDrawL3: [Int]? { get }
    var latestDraw: [Int]? { get }
    var numberJolly: [Int]? { get }
    var superstar: [Int]? { get }
    
    func onNumaraCombine() -> [Int]
}

extension BlockModels {
    var winningSerie: String? { get{ return "aaa" } }
    var latestDrawL1: [Int]? { get{ return nil} }
    var latestDrawL2: [Int]? { get{ return nil} }
    var latestDrawL3: [Int]? { get{ return nil} }
    var latestDraw: [Int]? { get{ return nil} }
    var numberJolly: [Int]? { get { return nil} }
    var superstar: [Int]? { get { return nil} }
    func onNumaraCombine() -> [Int] { return [] }
}

struct BlockMilliPiyango: BlockModels, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case latestDrawNumber = "latestDrawNumber"
        case latestDrawDate = "latestDrawDate"
        case latestDrawTime = "latestDrawTime"
        case jackpotTotal = "jackpotTotal"
        case nextDrawNumber = "nextDrawNumber"
        case drawTimestamp = "drawTimestamp"
        case currentDate = "currentDate"
        case winningSerie = "winning_serie"
    }
    
    let id: String?
    let latestDrawNumber: Int?
    let latestDrawDate: String?
    let latestDrawTime: String?
    let jackpotTotal: String?
    let winningSerie: String?
    let nextDrawNumber: Int?
    let drawTimestamp: Int?
    let currentDate: String?
}

struct BlockSayisalLoto: BlockModels, Decodable {
    
    
    let id: String?
    let jackpotTotal: String?
    let latestDraw: [Int]?
    let latestDrawNumber: Int?
    let latestDrawDate: String?
    let latestDrawTime: String?
    let nextDrawNumber: Int?
    let numberJolly: [Int]?
    let superstar: [Int]?
    let currentDate: String?
    let drawTimestamp: Int?
    
}

struct BlockSuperLoto: BlockModels, Decodable {
    let id: String?
    let jackpotTotal: String?
    let latestDraw: [Int]?
    let latestDrawNumber: Int?
    let latestDrawDate: String?
    let latestDrawTime: String?
    let nextDrawNumber: Int?
    let currentDate: String?
    let drawTimestamp: Int?
    
}

struct BlockSansTopu: BlockModels, Decodable {
    let id: String?
    let jackpotTotal: String?
    let latestDraw: [Int]?
    let latestDrawNumber: Int?
    let latestDrawDate: String?
    let latestDrawTime: String?
    let nextDrawNumber: Int?
    let numberJolly: [Int]?
    let currentDate: String?
    let drawTimestamp: Int?
    
}

struct BlockOnNumara: BlockModels, Decodable {
    let id: String?
    let jackpotTotal: String?
    let latestDrawL1: [Int]?
    let latestDrawL2: [Int]?
    let latestDrawL3: [Int]?
    let latestDrawNumber: Int?
    let latestDrawDate: String?
    let latestDrawTime: String?
    let nextDrawNumber: Int?
    let drawTimestamp: Int?
    let currentDate: String?
    
    func onNumaraCombine() -> [Int] {
        var array = latestDrawL1 ?? []
        array.append(contentsOf: latestDrawL2 ?? [])
        array.append(contentsOf: latestDrawL3 ?? [])
        return array
    }
}
