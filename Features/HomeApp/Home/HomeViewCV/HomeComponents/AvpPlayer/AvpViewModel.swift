//
//  AvpViewModel.swift
//  Home
//
//  Created by islombek on 25/06/24.
//

import Foundation
import AVKit

class VideoPlayerModel: ObservableObject {
    @Published var player: AVPlayer?

    init(videoURL: URL?) {
        guard let videoURL  else { return }
        let asset = AVAsset(url: videoURL)
        let playerItem = AVPlayerItem(asset: asset)
        self.player = AVPlayer(playerItem: playerItem)
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying(_:)), name: .AVPlayerItemDidPlayToEndTime, object: playerItem)
        self.player?.pause()
        self.player?.play()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func playerDidFinishPlaying(_ notification: Notification) {
        guard let playerItem = notification.object as? AVPlayerItem else { return }
        playerItem.seek(to: .zero, completionHandler: nil)
        player?.play()
    }
}

