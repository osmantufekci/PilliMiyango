//
//  MilliPiyangoAPI.swift
//  Pilli Miyango
//
//  Created by Osman Tufekci on 13.11.2023.
//

import Foundation

enum VideosAPI {
    static let baseURL = "https://streaming.tecnomovie.it" /* api/tk//2023-11/0,12 */
    static let urlPrefix = "/api/tk/"
    
    func url(year: Int, month: Int) -> URL {
        return URL(string: VideosAPI.baseURL + VideosAPI.urlPrefix + "\(year)-\(month)" + "0,12" )!
    }
}

enum MilliPiyangoAPI {
    static let baseURL = "https://www.millipiyangoonline.com"
    static let urlSuffix = "/sisalsans/"
    
    case hepsi(_ number: String, year: String = Date().year)
    case milliPiyango(_ number: String, year: String = Date().year)
    case sayisalLoto(_ number: String, year: String = Date().year)
    case superLoto(_ number: String, year: String = Date().year)
    case sansTopu(_ number: String, year: String = Date().year)
    case onNumara(_ number: String, year: String = Date().year)
    case blockMilliPiyango
    case blockSayisalLoto
    case blockSuperLoto
    case blockSansTopu
    case blockOnNumara
    
    var url: URL? {
        switch self {
        case .hepsi(let searchNumber, let year):
            return URL(string: MilliPiyangoAPI.baseURL + MilliPiyangoAPI.urlSuffix + "result.all.\(searchNumber).\(year)")
        case .milliPiyango(let searchNumber, let year):
            return URL(string: MilliPiyangoAPI.baseURL + MilliPiyangoAPI.urlSuffix + "result.millypiyango.\(searchNumber).\(year).json")
        case .sayisalLoto(let searchNumber, let year):
            return URL(string: MilliPiyangoAPI.baseURL + MilliPiyangoAPI.urlSuffix + "result.sayisaloto.\(searchNumber).\(year).json")
        case .superLoto(let searchNumber, let year):
            return URL(string: MilliPiyangoAPI.baseURL + MilliPiyangoAPI.urlSuffix + "result.superloto.\(searchNumber).\(year).json")
        case .sansTopu(let searchNumber, let year):
            return URL(string: MilliPiyangoAPI.baseURL + MilliPiyangoAPI.urlSuffix + "result.sanstopu.\(searchNumber).\(year).json")
        case .onNumara(let searchNumber, let year):
            return URL(string: MilliPiyangoAPI.baseURL + MilliPiyangoAPI.urlSuffix + "result.onnumara.\(searchNumber).\(year).json")
        case .blockMilliPiyango:
            return URL(string: MilliPiyangoAPI.baseURL + MilliPiyangoAPI.urlSuffix + "drawsblock.millypiyango.json")
        case .blockSayisalLoto:
            return URL(string: MilliPiyangoAPI.baseURL + MilliPiyangoAPI.urlSuffix + "drawsblock.saysaloto.json")
        case .blockSuperLoto:
            return URL(string: MilliPiyangoAPI.baseURL + MilliPiyangoAPI.urlSuffix + "drawsblock.superloto.json")
        case .blockSansTopu:
            return URL(string: MilliPiyangoAPI.baseURL + MilliPiyangoAPI.urlSuffix + "drawsblock.sanstopu.json")
        case .blockOnNumara:
            return URL(string: MilliPiyangoAPI.baseURL + MilliPiyangoAPI.urlSuffix + "drawsblock.onnumara.json")
        }
    }
    
    var drawDetailsURL: URL? {
        switch self {
        case .milliPiyango(let number, let year):
            return URL(string: MilliPiyangoAPI.baseURL + MilliPiyangoAPI.urlSuffix + "drawdetails." + BlockTypes.MilliPiyango.urlSuffix + ".\(number).\(year).json")
        case .sayisalLoto(let number, let year):
            return URL(string: MilliPiyangoAPI.baseURL + MilliPiyangoAPI.urlSuffix + "drawdetails." + BlockTypes.SayisalLoto.urlSuffix + ".\(number).\(year).json")
        case .superLoto(let number, let year):
            return URL(string: MilliPiyangoAPI.baseURL + MilliPiyangoAPI.urlSuffix + "drawdetails." + BlockTypes.SuperLoto.urlSuffix + ".\(number).\(year).json")
        case .sansTopu(let number, let year):
            return URL(string: MilliPiyangoAPI.baseURL + MilliPiyangoAPI.urlSuffix + "drawdetails." + BlockTypes.SansTopu.urlSuffix + ".\(number).\(year).json")
        case .onNumara(let number, let year):
            return URL(string: MilliPiyangoAPI.baseURL + MilliPiyangoAPI.urlSuffix + "drawdetails." + BlockTypes.OnNumara.urlSuffix + ".\(number).\(year).json")
        default: return nil
        }
    }
    
    var searchURL: URL? {
        switch self {
        case .hepsi(let searchNumber, let year):
            return URL(string: MilliPiyangoAPI.baseURL + MilliPiyangoAPI.urlSuffix + "searchresult.all.\(searchNumber).\(year).json")
        case .milliPiyango(let searchNumber, let year):
            return URL(string: MilliPiyangoAPI.baseURL + MilliPiyangoAPI.urlSuffix + "searchresult.millipiyango.\(searchNumber).\(year).json")
        case .sayisalLoto(let searchNumber, let year):
            return URL(string: MilliPiyangoAPI.baseURL + MilliPiyangoAPI.urlSuffix + "searchresult.sayisaloto.\(searchNumber).\(year).json")
        case .superLoto(let searchNumber, let year):
            return URL(string: MilliPiyangoAPI.baseURL + MilliPiyangoAPI.urlSuffix + "searchresult.superloto.\(searchNumber).\(year).json")
        case .sansTopu(let searchNumber, let year):
            return URL(string: MilliPiyangoAPI.baseURL + MilliPiyangoAPI.urlSuffix + "searchresult.sanstopu.\(searchNumber).\(year).json")
        case .onNumara(let searchNumber, let year):
            return URL(string: MilliPiyangoAPI.baseURL + MilliPiyangoAPI.urlSuffix + "searchresult.onnumara.\(searchNumber).\(year).json")
        
        default: return url
        }
    }
}
