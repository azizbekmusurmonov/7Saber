//
//  AVPlayer.swift
//  SABERHOME
//
//  Created by islombek on 29/03/24.
//


import SwiftUI
import AVKit


struct VideoPlayerView: View {
    let videoPlayerModel: VideoPlayerModel

    init(videoName: String) {
        self.videoPlayerModel = VideoPlayerModel(videoName: videoName)
    }

    var body: some View {
        VideoPlayer(player: videoPlayerModel.getPlayer()) {
            VStack(alignment: .leading, spacing: 0) {
                Text("TIME TO WIN")
                    .font(.system(size: 93))
                    .fontWeight(.thin)
                    .foregroundColor(.white)
                    .frame(width: 195, height: 354)
            }
            .padding(.top, 370)
            .padding(.leading, -170)
        }
        .frame(height: 901)
        .frame(maxHeight: .infinity)
        .ignoresSafeArea()
    }
}


