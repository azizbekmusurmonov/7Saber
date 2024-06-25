//
//  AvpView.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import SwiftUI
import AVKit
import Core

struct VideoPlayerView: View {
    @ObservedObject var videoPlayerModel: VideoPlayerModel
    @EnvironmentObject var apiManager: APIManager
    @State private var selectedPlayer: AVPplayer?

    var body: some View {
        VStack {
            if let player = videoPlayerModel.player {
                VideoPlayer(player: player) {
                    Text(title)
                        .font(.system(size: 80))
                        .fontWeight(.thin)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 500)
                }
                .onDisappear {
                    player.pause()
                }
                .frame(maxHeight: .infinity)
                .ignoresSafeArea()
            } else {
                ProgressView("Loading...")
                    .progressViewStyle(.circular)
            }
        }
    }
    
    var title: String {
        switch DataStorage.shared.language {
        case .uz: return apiManager.playerData?.titleUz ?? ""
        case .ru: return apiManager.playerData?.titleRu ?? ""
        case .en: return apiManager.playerData?.titleEn ?? ""
        }
    }
}
