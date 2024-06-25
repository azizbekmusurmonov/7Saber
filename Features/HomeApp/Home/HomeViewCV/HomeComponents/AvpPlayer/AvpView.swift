//
//  AvpView.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    @ObservedObject var videoPlayerModel: VideoPlayerModel
    @State private var selectedPlayer: AVPplayer?

    var body: some View {
        VStack {
            if let player = videoPlayerModel.player {
                VideoPlayer(player: player) {
                    Text("TIME TO WIN")
                        .font(.system(size: 93))
                        .fontWeight(.thin)
                        .foregroundColor(.white)
                        .frame(width: 195, height: 354)
                }
                .onDisappear {
                    player.pause()
                }
                .frame(height: 901)
                .frame(maxHeight: .infinity)
                .ignoresSafeArea()
            } else {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }
    }
}






import SwiftUI
import AVKit

struct AVPContentView: View {
    @StateObject var apiManager = APIManager()
    @State private var selectedPlayer: AVPplayer?
    @State private var videoPlayerModel: VideoPlayerModel?

    var body: some View {
        NavigationView {
            VStack {
                if let videoPlayerModel = videoPlayerModel {
                    VideoPlayerView(videoPlayerModel: videoPlayerModel)
                } else {
                    if apiManager.isLoading {
                        ProgressView("Loading...")
                    } else if let error = apiManager.error {
                        Text("Error: \(error.localizedDescription)")
                    
                    } else {
                        Text("Select a video...")
                    }
                }

                List(apiManager.players) { player in
                    Button(action: {
                        if let videoURLString = player.appMedia.src, !videoURLString.isEmpty {
                            if let videoURL = URL(string: videoURLString) {
                                self.videoPlayerModel = VideoPlayerModel(videoURL: videoURL)
                                self.selectedPlayer = player // Update selected player
                            } else {
                                print("Invalid video URL: \(videoURLString)")
                            }
                        } else {
                            print("No video URL available for player")
                        }
                    }) {
                        Text(player.titleEn)
                    }
                }
                .onAppear {
                    // Auto-play the first video on initial load
                    if self.selectedPlayer == nil, let firstPlayer = self.apiManager.players.first,
                       let videoURLString = firstPlayer.appMedia.src, !videoURLString.isEmpty,
                       let videoURL = URL(string: videoURLString) {
                        self.videoPlayerModel = VideoPlayerModel(videoURL: videoURL)
                        self.selectedPlayer = firstPlayer
                    }
                }
            }
            .navigationTitle("Video List")
        }
    }
}




