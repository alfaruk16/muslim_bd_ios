//
//  AuioPlayer.swift
//  muslimbd
//
//  Created by Al Faruk on 24/2/25.
//

import Foundation
import AVFoundation

class AudioPlayer : ObservableObject {
    var player: AVPlayer?
    @Published var currentUrl: String = ""

    func play(url: String){
        if let path = URL(string: url) {
            
            if(!currentUrl.isEmpty && currentUrl == path.absoluteString){
                pause()
            } else {
                self.player = nil
                self.currentUrl = path.absoluteString
                self.player = AVPlayer(url: path)
                self.player?.play()
                
                NotificationCenter.default.addObserver(self, selector: #selector(self.finish), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
            }


        }
    }
    
    func pause(){
        player?.pause()
        currentUrl = ""
    }
    
    @objc func finish(){
        currentUrl = ""
    }
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }

}

