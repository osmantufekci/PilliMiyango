//
//  Youtube.swift
//  Pilli Miyango
//
//  Created by Osman Tufekci on 17.11.2023.
//

import Foundation

//Örnek url: - https://www.millipiyangoonline.com/sisalsans/getyoutubeid.sayisalloto.137.2023.json
struct YoutubeModel: Decodable {
    var conc: String? = "137"
    var date: String? = "2023-11-15 21:30:00"
    var year: String? = "2023"
    var yt: String? = "x9akTrUS5GY"
    var ytFinal: String? = "T0H-6gWFp9E"
    var game: String? = "sayisalloto"
    
}
