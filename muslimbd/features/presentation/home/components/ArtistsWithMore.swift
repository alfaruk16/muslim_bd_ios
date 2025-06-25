//
//  Artists.swift
//  muslimbd
//
//  Created by Al Faruk on 12/3/25.
//

import SwiftUI

struct ArtistsWithMore: View {
    let category: CategoryDtoItem
    let artistList: ArtistDto
    
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack{
            
            HStack {
                if(category.icon != nil){
                    Image(category.icon ?? .logo).resizable().frame(width: 24, height: 24)
                }else{
                    AsyncImage(url: URL(string: (category.contentBaseURL ?? "") + (category.imageURL ?? ""))){ image in
                        image.resizable().frame(width: 24, height: 24)
                    }placeholder: {}
                }
                Spacer().frame(width: 8)
                Text(category.name ?? "").font(.system(size: 18)).fontWeight(.medium).foregroundColor(Color.gray)
                Spacer()
                NavigationLink(destination: {
                    ArtistScreen(category: category)
                }, label: {
                    Image(systemName: "chevron.right").frame(width: 30, height: 30).background(Color.greenLight).clipShape(Circle()).foregroundStyle(.black)
                })
                
            }.padding(.horizontal, 10).padding(.top, 10)
            
            
            ScrollView(.horizontal){
                HStack{
                    ForEach(artistList.data ?? [], id: \.id){ item in
                        NavigationLink(destination: ArtistAudioVideoScreen(category: CategoryDtoItem(name: AppConstants.gajalArtist, icon: .artist, selectedTab: 0), artist: item), label: {
                            
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
                        })
                        
                    }
                }.padding(.horizontal, 10)
            }
        }
    }
}
