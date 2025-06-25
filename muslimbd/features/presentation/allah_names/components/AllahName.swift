//
//  AllahName.swift
//  muslimbd
//
//  Created by Al Faruk on 16/1/25.
//

import SwiftUI

struct AllahName: View {
    let name: AllahNamesDtoItem
    @StateObject var audioPlayer: AudioPlayer

    var body: some View {
        HStack{
            ZStack {
                Image(.allahNameSequence).resizable().frame(width: 36, height: 36)
                Text(String(name.sequenceNo ?? 0)).foregroundStyle(Color.primary)
            }
            Spacer().frame(width: 10)
            Text(name.name ?? "").font(.system(size: 20)).lineLimit(1).foregroundStyle(Color.gray)
            Spacer().frame(width: 10)
            Text("( " + (name.arabic ?? "") + " )").font(.system(size: 20)).lineLimit(1).foregroundStyle(Color.primary)

            Spacer()
            Image(systemName: audioPlayer.currentUrl == (name.contentBaseUrl ?? "") + (name.contentUrl ?? "") ? "pause.fill" : "play.fill").resizable().frame(width: 16, height: 16).foregroundStyle(Color.primary).onTapGesture {
                audioPlayer.play(url: (name.contentBaseUrl ?? "") + (name.contentUrl ?? ""))
            }
        }.padding(15).background(Color.backgroundDark).cornerRadius(8).padding(.horizontal, 10)
    }
}
