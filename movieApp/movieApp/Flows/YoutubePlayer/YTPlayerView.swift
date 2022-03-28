//
//  YTPlayerView.swift
//  movieApp
//
//  Created by Cris Messias on 25/03/22.
//

import SwiftUI
import YouTubePlayerKit

struct YTPlayerView: View {
    
    init(urlString: String){ //overrider - modificando para receber string
        self.urlAddress = YouTubePlayer(stringLiteral: urlString)
    }
    
    let urlAddress: YouTubePlayer
    
    var body: some View {
        YouTubePlayerView(self.urlAddress) { state in
            switch state {
            case .idle:
                ProgressView()
            case .ready:
                EmptyView()
            case .error(let error):
                Text(verbatim: "YouTube player couldn't be loaded \(error.localizedDescription)")
            }
        }
    }
}

struct YTPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        YTPlayerView(urlString: "")
    }
}
