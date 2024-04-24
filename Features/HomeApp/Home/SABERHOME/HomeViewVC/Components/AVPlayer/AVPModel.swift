//
//  AVPModel.swift
//  SABERHOME
//
//  Created by islombek on 15/04/24.
//


import SwiftUI
import AVKit


class VideoPlayerModel {
     var player: AVQueuePlayer?

    init(videoName: String) {
        self.player = AVQueuePlayer()

        if let url = Bundle.main.url(forResource: videoName, withExtension: "mp4") {
            let asset = AVAsset(url: url)
            let playerItem = AVPlayerItem(asset: asset)
            self.player?.replaceCurrentItem(with: playerItem)
            self.player?.play()
            
            NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying(_:)), name: .AVPlayerItemDidPlayToEndTime, object: playerItem)
        } else {
            fatalError("Video file not found")
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc  func playerDidFinishPlaying(_ notification: Notification) {
        if let playerItem = notification.object as? AVPlayerItem {
            playerItem.seek(to: .zero, completionHandler: nil)
            player?.play()
        }
    }

    func getPlayer() -> AVQueuePlayer {
        return player ?? AVQueuePlayer()
    }
}
