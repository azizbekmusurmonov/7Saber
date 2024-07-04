//
//  VideoPlayerView.swift
//  AppResources
//
//  Created by Asadbek Yoldoshev on 30/06/24.
//

import SwiftUI
import AVKit
import Core

struct VideoPlayerView: View {
    @ObservedObject var videoPlayerModel: VideoPlayerModel
    @EnvironmentObject var apiManager: HomeViewModel
    @State private var selectedPlayer: AVPplayer?

    var body: some View {
        VStack {
            if let player = videoPlayerModel.player {
                VideoPlayer(player: player) {
//                    Text(title)
//                        .font(.system(size: 80))
//                        .fontWeight(.thin)
//                        .foregroundColor(.white)
                }
                .onDisappear {
                    player.pause()
                }
//                .frame(maxHeight: .infinity)
                .ignoresSafeArea()
            } else {
                iOSSpinner()
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

