//
//  Artists.swift
//  muslimbd
//
//  Created by Al Faruk on 13/3/25.
//

import SwiftUI

struct Artists: View {
    let artistList: ArtistDto
    let currentArtistId: String
    let onTap: (ArtistDtoItem) -> Void
    
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack{
            
            HStack {
                Text(AppConstants.gajalArtist).font(.system(size: 18)).fontWeight(.medium).foregroundColor(Color.gray)
                Spacer()
            }.padding(.horizontal, 10).padding(.top, 10)
            
            
            ScrollView(.horizontal){
                HStack{
                    ForEach(artistList.data ?? [], id: \.id){ item in
                        if(item.id != currentArtistId){
                            
                            VStack{
                                
                                AsyncImage(url: URL(string: (item.contentBaseUrl ?? "") + replaceSize(url: (item.imageUrl ?? ""), replaceWith: hundredNinetyTwo))){ image in
                                    
                                    image.resizable().frame(width: width / 3, height: width / 3 - 10).clipShape(Circle())
                                    
                                }placeholder: {
                                    ProgressView().frame(width: width / 3, height: width / 3 - 10, alignment: .center)
                                }
                                
                                Spacer().frame(height: 10)
                                Text(item.name ?? "").foregroundColor(Color.gray).lineLimit(1).font(.system(size: 14))
                                Text(String(item.totalTrack ?? 0) + " " + Language.gajal).foregroundColor(Color.grayLight).font(.system(size: 12)).lineLimit(1)
                                
                            }.padding(.vertical, 10).padding(.horizontal, 15).background(Color.backgroundDark).frame(width: width / 2.5).clipShape(RoundedRectangle(cornerRadius: 10))
                                .onTapGesture(perform: {
                                    onTap(item)
                                })
                            
                        }
                    }
                }.padding(.horizontal, 10)
            }
        }
    }
}

