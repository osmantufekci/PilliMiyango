//
//  MilliPiyangoModel.swift
//  Pilli Miyango
//
//  Created by Osman Tufekci on 13.11.2023.
//

import Foundation

struct MilliPiyangoModel: Decodable {
    let id: String?
    let lotteryName: String?
    let drawnNr: Int?
    let drawYear: Int?
    let drawDate: String?
    let drawTime: String?
    let drawNumbers: [Int]?
    let drawNumbersOnNumaraL1: [Int?]?
    let drawNumbersOnNumaraL2: [Int?]?
    let drawNumbersOnNumaraL3: [Int?]?
    let numberJolly: [Int?]?
    let superstar: [Int?]?
    let status: String?
    let drawDateTime: String?
    let currentDate: String?
    let jackpot: String?
    let nextDrawDate: String?
    let drawTimestamp: Int?
    let amortiNumber1: String?
    let amortiNumber2: String?
}
