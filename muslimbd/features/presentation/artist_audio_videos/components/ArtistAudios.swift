//
//  ArtistAudios.swift
//  muslimbd
//
//  Created by Al Faruk on 13/3/25.
//

import SwiftUI

struct ArtistAudios: View {
    let tracks: TracksDto
    let showCount: Int
    let showMore: () -> Void
    let onTap: (TracksDtoItem) -> Void
    
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        ScrollView (){
            LazyVStack{
            
                ForEach(Array(tracks.data?[0..<min(showCount, tracks.data?.count ?? 0)] ?? []), id: \.id){ (track: TracksDtoItem) in
                    
                    let min = String((Int(track.duration ?? "0") ?? 0) / 60)
                    let sec = String((Int(track.duration ?? "0") ?? 0) % 60)
                    
                    
                    NavigationLink(destination: AudioPlayerScreen(category: CategoryDtoItem(name: AppConstants.gajalAudio, icon: .audio), track: track), label: {
                        
                        HStack {
                            
                            AsyncImage(url: URL(string: (track.contentBaseUrl ?? "") + replaceSize(url: track.imageUrl ?? "", replaceWith: seventyTwo))){ image in
                                image.resizable()
                                    .frame(width: 60, height: 60)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            } placeholder: {}
                            
                            
                            VStack(alignment: .leading){
                                
                                Text(track.title ?? "").font(.system(size: 14)).foregroundStyle(Color.gray).lineLimit(1).padding(.horizontal, 10).padding(.bottom, 2)
                                
                                Spacer().frame(height: 2)
                                
                                Text(track.artistName ?? "").foregroundStyle(Color.grayLight)
                                    .lineLimit(1).padding(.horizontal, 10).font(.system(size: 12)).padding(.bottom, 1)
                                
                                Text(String(track.playCount ?? 0) + " Plays").foregroundStyle(Color.grayLight)
                                    .lineLimit(1).padding(.horizontal, 10).font(.system(size: 12))
                            }
                            
                            
                            Spacer()
                            
                            Text(min + ":" + sec).foregroundStyle(Color.grayLight)
                                .lineLimit(1).padding(.horizontal, 10).font(.system(size: 12))
                            
                            Image(systemName: "play.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color.primary)
                            
                        }.padding(10).background(Color.backgroundDark)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .clipped()

                    })
                    
                }.padding(.horizontal, 10)
                
                if(tracks.data?.count ?? 0 > 5){
                    ShowMoreButton(isShowMore: tracks.totalRecords == nil || showCount < (tracks.totalRecords ?? 0), showMore: {
                        showMore()
                    })
                }
            }
        }
        
    }
}

#Preview {
    ArtistAudios(tracks: TracksDto(data: [TracksDtoItem(artistName: "Artist", duration: "125", title: "Title")]), showCount: 5, showMore: {}, onTap: {_ in})
}
