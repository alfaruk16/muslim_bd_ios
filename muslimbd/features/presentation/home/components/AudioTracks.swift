//
//  AudioTracks.swift
//  muslimbd
//
//  Created by Al Faruk on 13/3/25.
//

import SwiftUI

struct AudioTracks: View {
    let category: CategoryDtoItem
    let tracks: TracksDto
    let onTap: (TracksDtoItem) -> Void
    
    let width = UIScreen.main.bounds.width / 2.5
    
    var body: some View {
        VStack{
            ForwardButton(category: category)
            
            ScrollView (.horizontal){
                LazyHStack{
                    ForEach(tracks.data ?? [], id: \.id){ (item: TracksDtoItem) in
                        
                        NavigationLink(destination: AudioPlayerScreen(category: CategoryDtoItem(name: AppConstants.gajalAudio, icon: .audio), track: item), label: {
                            
                        VStack(alignment: .leading){
                                
                                AsyncImage(url: URL(string: (item.contentBaseUrl ?? "") + replaceSize(url: (item.imageUrl ?? ""), replaceWith: hundredNinetyTwo))){ image in
                                    
                                    image.resizable().frame(width: width, height: width).clipShape(.rect(topLeadingRadius: 10, topTrailingRadius: 10))
                                    
                                }placeholder: {
                                    ProgressView().frame(width: width, height: width, alignment: .center)
                                }
                                
                                Spacer().frame(height: 10)
                                HStack{
                                    Text(item.title ?? "").foregroundColor(Color.gray).lineLimit(1).font(.system(size: 14))
                                    Spacer()
                                    Text(String(item.playCount ?? 0) + " Plays").foregroundColor(Color.grayLight).font(.system(size: 12)).lineLimit(1)
                                }.padding(.horizontal, 10)
                            Text(item.artistName ?? "").foregroundColor(Color.grayLight).font(.system(size: 12)).lineLimit(1).padding(.horizontal, 10)

                                
                            }.padding(.bottom, 10).background(Color.backgroundDark)
                            .frame(width: width).clipShape(RoundedRectangle(cornerRadius: 10))
                            
                        })
                        
                    }
                }.padding(.horizontal, 10)
            }
        }
    }
}

#Preview {
    AudioTracks(category: CategoryDtoItem(), tracks: TracksDto(data: [TracksDtoItem()]), onTap: {_ in })
}
