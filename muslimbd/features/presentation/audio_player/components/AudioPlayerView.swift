//
//  AudioPlayerView.swift
//  muslimbd
//
//  Created by Al Faruk on 16/3/25.
//

import SwiftUI

struct AudioPlayerView: View {
    let track: TracksDtoItem
    let palyAudio: (TracksDtoItem) ->  Void
    
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack{
            
            AsyncImage(url: URL(string: (track.contentBaseUrl ?? "") + replaceSize(url: (track.imageUrl ?? ""), replaceWith: threeHundred))){ image in
                
                image.resizable().frame(width: width / 1.5, height: width / 1.5).clipShape(RoundedRectangle(cornerRadius: 15))
                
            }placeholder: {
                ProgressView().frame(width: width / 1.5, height: width / 1.5, alignment: .center)
            }
            
            Text(track.title ?? "").font(.system(size: 20)).foregroundColor(Color.gray)
            Text(track.artistName ?? "").foregroundColor(Color.grayLight)
            
            Spacer().frame(height: 20)
            
            HStack{
                VStack(alignment: .center){
                    Image(systemName: "play.fill").padding(10).foregroundColor(Color.primary).background(LinearGradient(gradient: Gradient(colors: [Color.gradientColor1, Color.gradientColor2]), startPoint: .top, endPoint: .bottom)).clipShape(Circle())
                    Text(Language.play)
                }
            }
            
        }.frame(maxWidth: .infinity).padding(20).background(Color.white).clipShape(.rect(bottomLeadingRadius: 20, bottomTrailingRadius: 20))
    }
}


#Preview {
    AudioPlayerView(track: TracksDtoItem(), palyAudio: {_ in})
}
