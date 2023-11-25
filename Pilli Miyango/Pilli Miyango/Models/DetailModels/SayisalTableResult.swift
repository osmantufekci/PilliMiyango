//
//  TableResult.swift
//  Pilli Miyango
//
//  Created by Osman Tufekci on 17.11.2023.
//

import Foundation

protocol DrawDetailModel {
    var number: String { get }
    var winningNumber: [Int] { get }
    var dateDetails: String { get }
    var timeDetails: String { get }
    var firstCategoryName: String { get }
    var firstCategoryWinning: [String] { get }
    var secondCategoryName: String { get }
    var secondCategoryWinning: [String] { get }
    var categories: [Category] { get }
    var reportURL: String { get }
    var winningNumberL1: [Int]? { get }
    var winningNumberL2: [Int]? { get }
    var winningNumberL3: [Int]? { get }
    var numberJolly: [Int]? { get }
    var superstar: [Int]? { get }
    var jackpot: String? { get }
    var tableResult: [TableResultElement] { get }
    var tableResultSuperstar: [TableResultElement]? { get }
    
    func toLotteryResult() -> [LotteryResult]
}

extension DrawDetailModel {
    var winningNumber: [Int] { return [] }
    var firstCategoryName: String { return "" }
    var firstCategoryWinning: [String] { return [] }
    var secondCategoryName: String { return "" }
    var secondCategoryWinning: [String] { return [] }
    var categories: [Category] { return [] }
    var reportURL: String { return "" }
    var winningNumberL1: [Int]? { return nil }
    var winningNumberL2: [Int]? { return nil }
    var winningNumberL3: [Int]? { return nil }
    var numberJolly: [Int]? { return nil }
    var superstar: [Int]? { return nil }
    var tableResult: [TableResultElement] { return [] }
    var tableResultSuperstar: [TableResultElement]? { return nil }
    var jackpot: String? { return nil }
    func toLotteryResult() -> [LotteryResult] {[]}
}

struct SayisalTableResult: Decodable, DrawDetailModel {

    let number: String
    let dateDetails: String
    let timeDetails: String
    let winningNumber: [Int]
    let numberJolly: [Int]?
    let superstar: [Int]?
    let tableResult: [TableResultElement]
    let tableResultSuperstar: [TableResultElement]?
    let winningNumberL1: [Int]?
    let winningNumberL2: [Int]?
    let winningNumberL3: [Int]?
    let jackpot: String?
    
    func toLotteryResult() -> [LotteryResult] {
        
        var array = [LotteryResult]()
        
        for result in self.tableResult {
            if let numbersMatched = result.numbersMatched,
               let totalWinners = result.totalWinners,
               let prizeWinner = result.prizeWinner {
                array.append(LotteryResult(category: numbersMatched, winners: totalWinners, prize: "\(prizeWinner)" + " ₺"))
            }
        }
        
        return array
    }
}

struct OnNumaraTableResult: Decodable, DrawDetailModel {
    let number: String
    let dateDetails: String
    let timeDetails: String
    let winningNumber: [Int]
    let numberJolly: [Int]?
    let superstar: [Int]?
    let tableResult: [TableResultElement]
    let winningNumberL1: [Int]?
    let winningNumberL2: [Int]?
    let winningNumberL3: [Int]?
    let jackpot: String?
}

struct SansTopuTableResult: Decodable, DrawDetailModel {
    let number: String
    let dateDetails: String
    let timeDetails: String
    let winningNumber: [Int]
    let numberJolly: [Int]?
    let superstar: [Int]?
    let tableResult: [TableResultElement]
    let winningNumberL1: [Int]?
    let winningNumberL2: [Int]?
    let winningNumberL3: [Int]?
    let jackpot: String?
}

struct SuperLotoTableResult: Decodable, DrawDetailModel {
    let number: String
    let dateDetails: String
    let timeDetails: String
    let winningNumber: [Int]
    let numberJolly: [Int]?
    let superstar: [Int]?
    let tableResult: [TableResultElement]
    let winningNumberL1: [Int]?
    let winningNumberL2: [Int]?
    let winningNumberL3: [Int]?
    let jackpot: String?
}

struct MilliPiyangoTableResult: Decodable, DrawDetailModel {
    let number: String
    let dateDetails: String
    let timeDetails: String
    let firstCategoryName: String
    let firstCategoryWinning: [String]
    let secondCategoryName: String
    let secondCategoryWinning: [String]
    let categories: [Category]
    let reportURL: String
}


// MARK: - Category
struct Category: Decodable {
    var category: String = ""
    var idCategory: String = ""
    var numberExtract: String = ""
    var totalExtraction: String = ""
    var categoryType: String = ""
    var winningSeries: [String] = []
}


// MARK: - TableResultElement
struct TableResultElement: Decodable, Identifiable {
    let id: String = UUID().uuidString
    let numbersMatched: String?
    let totalWinners: String?
    let prizeWinner: String?
    let prizeFound: String?
    
    enum CodingKeys: String, CodingKey {
        case numbersMatched
        case totalWinners
        case prizeWinner
        case prizeFound
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.numbersMatched = try container.decodeIfPresent(String.self, forKey: .numbersMatched)
        self.totalWinners = try container.decodeIfPresent(String.self, forKey: .totalWinners)
        self.prizeWinner = try container.decodeIfPresent(String.self, forKey: .prizeWinner)
        self.prizeFound = try container.decodeIfPresent(String.self, forKey: .prizeFound)
    }
}

struct LotteryResult {
    var category: String
    var winners: String
    var prize: String
}
