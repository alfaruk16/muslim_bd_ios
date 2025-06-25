//
//  ArtistVideos.swift
//  muslimbd
//
//  Created by Al Faruk on 6/3/25.
//

import SwiftUI

struct ArtistVideos: View {
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
                    
                    HStack {
                        ZStack{
                            AsyncImage(url: URL(string: (track.contentBaseUrl ?? "") + replaceSize(url: track.imageUrl ?? "", replaceWith: fourHundred))){ image in
                                image.resizable()
                                    .frame(width: width / 2, height: width * 9 / 32)
                                    .clipShape(.rect(topLeadingRadius: 10, bottomLeadingRadius: 10))
                                    .shadow(radius: 2)
                            } placeholder: {}
                            
                            ZStack(alignment: Alignment.center) {
                                
                                Image(systemName: "play.circle")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(Color.primary)
                                
                            }
                            
                        }.frame(width: width / 2, height: width * 9 / 32)
                        
                        VStack(alignment: .leading){
                            
                            Text(track.title ?? "").font(.system(size: 14)).foregroundStyle(Color.gray).lineLimit(1).padding(.horizontal, 10).padding(.bottom, 2)
                            
                            Spacer().frame(height: 2)
                            
                            Text(track.artistName ?? "").foregroundStyle(Color.grayLight)
                                .lineLimit(1).padding(.horizontal, 10).font(.system(size: 12)).padding(.bottom, 1)
                            
                            Text(min + ":" + sec).foregroundStyle(Color.grayLight)
                                .lineLimit(1).padding(.horizontal, 10).font(.system(size: 12)).padding(.bottom, 1)
                            
                            Text(String(track.playCount ?? 0) + " Views").foregroundStyle(Color.grayLight)
                                .lineLimit(1).padding(.horizontal, 10).font(.system(size: 12))
                        }
                        
                        Spacer()
                        
                    }.background(Color.backgroundDark)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .clipped()
                        .onTapGesture(perform: {
                            onTap(track)
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
