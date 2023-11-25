//
//  YoutubeViewContainer.swift
//  Pilli Miyango
//
//  Created by Osman Tufekci on 17.11.2023.
//

import SwiftUI

struct YoutubeViewContainer: View {
    
    var blockType: BlockTypes
    
    @State var model: YoutubeModel?
    var number: String
    
    var body: some View {
        
        VStack {
            if let model = model {
                YouTubeView(videoID: model.yt ?? "")
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12)
            }
        }
        .task {
            let sayisalLotoException = blockType == .SayisalLoto ? "sayisalloto" : blockType.urlSuffix
            let url = URL(string: "https://www.millipiyangoonline.com/sisalsans/getyoutubeid.\(sayisalLotoException).\(number).\(Date().year).json")!
            model = try? await HTTPClient().sendRequest(url: url, responseModel: YoutubeModel.self).get() 
            
        }
        .navigationTitle(blockType.title)
        .toolbarBackground(blockType.color, for: .navigationBar)
        
    }
}

#Preview{
    YoutubeViewContainer(blockType: .MilliPiyango, model: YoutubeModel(), number: "132")
}
