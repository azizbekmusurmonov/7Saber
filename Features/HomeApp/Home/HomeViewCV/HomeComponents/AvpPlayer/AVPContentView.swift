//
//  AVPContentView.swift
//  Home
//
//  Created by Ismatillokhon on 25/06/24.
//


import SwiftUI
import AVKit

struct AVPContentView: View {
    @StateObject var apiManager = APIManager()
    @State private var selectedPlayer: AVPplayer?
    @State private var videoPlayerModel: VideoPlayerModel?
    
    var body: some View {
        NavigationView {
            VStack {
//                if let videoPlayerModel = videoPlayerModel {
                    VideoPlayerView(videoPlayerModel: .init(
                        videoURL: .init(string: apiManager.playerData?.appMedia.src ?? ""))
                    ).environmentObject(apiManager)
                    .edgesIgnoringSafeArea(.all)
//                } else {
//                    if apiManager.isLoading {
//                        ProgressView("Loading...")
//                    } else if let error = apiManager.error {
//                        Text("Error: \(error.localizedDescription)")
//                        
//                    } else {
//                        Text("Select a video...")
//                    }
//                }
                
//                Button(action: {
//                    if let videoURLString = .appMedia.src, !videoURLString.isEmpty {
//                        if let videoURL = URL(string: videoURLString) {
//                            self.videoPlayerModel = VideoPlayerModel(videoURL: videoURL)
//                        } else {
//                            print("Invalid video URL: \(videoURLString)")
//                        }
//                    } else {
//                        print("No video URL available for player")
//                    }
//                }) {
//                    Text(player.titleEn)
//                }
//                .onAppear {
//                    // Auto-play the first video on initial load
//                    if self.selectedPlayer == nil, let firstPlayer = self.apiManager.players.first,
//                       let videoURLString = firstPlayer.appMedia.src, !videoURLString.isEmpty,
//                       let videoURL = URL(string: videoURLString) {
//                        self.videoPlayerModel = VideoPlayerModel(videoURL: videoURL)
//                        self.selectedPlayer = firstPlayer
//                    }
//                }
            }.frame(height: 800)
            .navigationTitle("Video List")
        }
    }
}





