//
//  VideoTracks.swift
//  muslimbd
//
//  Created by Al Faruk on 4/3/25.
//

import SwiftUI

struct VideoTracks: View {
    let category: CategoryDtoItem
    let tracks: TracksDto
    let onTap: (TracksDtoItem) -> Void
    
    let width = UIScreen.main.bounds.width / 1.5
    
    var body: some View {
        VStack{
            ForwardButton(category: category)
            
            ScrollView (.horizontal){
                LazyHStack{
                    ForEach(tracks.data ?? [], id: \.id){ (track: TracksDtoItem) in
                        
                        VStack(alignment: .leading){
                            ZStack{
                                AsyncImage(url: URL(string: (track.contentBaseUrl ?? "") + replaceSize(url: track.imageUrl ?? "", replaceWith: fourHundred))){ image in
                                    image.resizable()
                                        .frame(width: width, height: width * 9 / 16)
                                        .clipShape(.rect(topLeadingRadius: 10, topTrailingRadius: 10))
                                        .shadow(radius: 2)
                                } placeholder: {
                                    ProgressView()
                                }
                                
                                ZStack(alignment: Alignment.center) {
                                    
                                    Image(systemName: "play.circle")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(Color.primary)
                                    
                                }
                                
                            }.frame(width: width, height: width * 9 / 16)
                            
                            Text(track.title ?? "").font(.system(size: 16)).foregroundStyle(Color.gray).lineLimit(1).padding(.horizontal, 10)
                            
                            Spacer().frame(height: 2)
                            
                            Text(track.artistName ?? "").foregroundStyle(Color.grayLight).lineLimit(1).padding(.horizontal, 10).font(.system(size: 14))
                            Spacer().frame(height: 10)
                            
                        }.frame(width: width)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .clipped()
                            .shadow(radius: 2)
                            .padding(2)
                            .onTapGesture(perform: {
                                onTap(track)
                            })
                    }
                }.padding(.horizontal, 10)
            }
        }
    }
}

#Preview {
    VideoTracks(category: CategoryDtoItem(), tracks: TracksDto(data: [TracksDtoItem()]), onTap: {_ in })
}
