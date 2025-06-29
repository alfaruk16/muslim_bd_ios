//
//  VideoPlayer.swift
//  muslimbd
//
//  Created by Al Faruk on 4/3/25.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    let track: TracksDtoItem
    let onBack: () -> Void
    
    var body: some View {
        CustomVideoPlayerView(onBack : onBack, player: AVPlayer(url: URL(string: (track.contentBaseUrl ?? "") + (track.streamUrl ?? "").replacingOccurrences(of: "\\", with: "/"))!))
    }
}

struct CustomVideoPlayerView: View {
    let onBack: () -> Void
    
    @State var player: AVPlayer
    @State var isplaying = false
    @State var showcontrols = false
    @State var value : Float = 0
    
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        
        VStack{
            
            ZStack{
                
                VideoPlayer(player: $player)
                
                if self.showcontrols{
                    Controls(onBack: onBack, player: self.$player, isplaying: self.$isplaying, pannel: self.$showcontrols,value: self.$value)
                }
                
            }
            .frame(width: width, height: width / 16 * 9)
            .onTapGesture {
                self.showcontrols = true
            }
            Spacer()
        }
        .onAppear {
            self.player.play()
            self.isplaying = true
        }.onDisappear(perform: {
            player.pause()
        })
    }
}


struct Controls : View {
    let onBack: () -> Void
    
    @Binding var player : AVPlayer
    @Binding var isplaying : Bool
    @Binding var pannel : Bool
    @Binding var value : Float
    
    var body : some View{
        
        VStack(alignment: .leading){
            
            Image(systemName: "chevron.down").foregroundColor(Color.white)
                .onTapGesture {
                onBack()
            }
            
            Spacer()
            
            HStack{
                
                Button(action: {
                    
                    self.player.seek(to: CMTime(seconds: self.getSeconds() - 10, preferredTimescale: 1))
                    
                }) {
                    
                    Image(systemName: "backward.fill")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(20)
                }
                
                Spacer()
                
                Button(action: {
                    
                    if self.isplaying{
                        
                        self.player.pause()
                        self.isplaying = false
                    }
                    else{
                        
                        self.player.play()
                        self.isplaying = true
                    }
                    
                }) {
                    
                    Image(systemName: self.isplaying ? "pause.fill" : "play.fill")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(20)
                }
                
                Spacer()
                
                Button(action: {
                    
                    self.player.seek(to: CMTime(seconds: self.getSeconds() + 10, preferredTimescale: 1))
                    
                }) {
                    
                    Image(systemName: "forward.fill")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(20)
                }
            }
            
            Spacer()
            
            CustomProgressBar(value: self.$value, player: self.$player, isplaying: self.$isplaying)
            
        }.padding()
            .background(Color.black.opacity(0.4))
            .onTapGesture {
                
                self.pannel = false
            }
            .onAppear {
                
                self.player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 1), queue: .main) { (_) in
                    
                    self.value = self.getSliderValue()
                    
                    if self.value == 1.0{
                        
                        self.isplaying = false
                    }
                }
            }
        
        
    }
    
    func getSliderValue()->Float{
        
        return Float(self.player.currentTime().seconds / (self.player.currentItem?.duration.seconds)!)
    }
    
    func getSeconds()->Double{
        
        return Double(Double(self.value) * (self.player.currentItem?.duration.seconds)!)
    }
}


struct CustomProgressBar : UIViewRepresentable {
    
    
    func makeCoordinator() -> CustomProgressBar.Coordinator {
        
        return CustomProgressBar.Coordinator(parent1: self)
    }
    
    
    @Binding var value : Float
    @Binding var player : AVPlayer
    @Binding var isplaying : Bool
    
    func makeUIView(context: UIViewRepresentableContext<CustomProgressBar>) -> UISlider {
        
        let slider = UISlider()
        slider.minimumTrackTintColor = .red
        slider.maximumTrackTintColor = .gray
        slider.thumbTintColor = .red
        slider.setThumbImage(UIImage(named: "thumb"), for: .normal)
        slider.value = value
        slider.addTarget(context.coordinator, action: #selector(context.coordinator.changed(slider:)), for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: UIViewRepresentableContext<CustomProgressBar>) {
        
        uiView.value = value
    }
    
    class Coordinator : NSObject{
        
        var parent : CustomProgressBar
        
        init(parent1 : CustomProgressBar) {
            
            parent = parent1
        }
        
        @objc func changed(slider : UISlider){
            
            if slider.isTracking{
                
                parent.player.pause()
                
                let sec = Double(slider.value * Float((parent.player.currentItem?.duration.seconds)!))
                
                parent.player.seek(to: CMTime(seconds: sec, preferredTimescale: 1))
            }
            else{
                
                let sec = Double(slider.value * Float((parent.player.currentItem?.duration.seconds)!))
                
                parent.player.seek(to: CMTime(seconds: sec, preferredTimescale: 1))
                
                if parent.isplaying{
                    
                    parent.player.play()
                }
            }
        }
    }
}


class Host : UIHostingController<ContentView>{
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .lightContent
    }
}


struct VideoPlayer : UIViewControllerRepresentable {
    
    @Binding var player : AVPlayer
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<VideoPlayer>) -> AVPlayerViewController {
        
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
//        controller.videoGravity = .resize
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<VideoPlayer>) {
        
        
    }
}


#Preview {
    VideoPlayerView(track: TracksDtoItem(), onBack: {})
}
