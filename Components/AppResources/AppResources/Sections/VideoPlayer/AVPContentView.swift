//
//  AVPContentView.swift
//  AppResources
//
//  Created by Asadbek Yoldoshev on 30/06/24.
//

import SwiftUI
import AVKit

struct AVPContentView: View {
    @StateObject var apiManager = HomeViewModel()
    @State private var selectedPlayer: AVPplayer?
    @State private var videoPlayerModel: VideoPlayerModel?
    
    var body: some View {
        NavigationView {
            VStack {
                VideoPlayerView(videoPlayerModel: .init(
                    videoURL: .init(string: apiManager.playerData?.appMedia.src ?? ""))
                ).environmentObject(apiManager)
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}
