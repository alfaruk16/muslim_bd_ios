//
//  HomeScreen.swift
//  muslimbd
//
//  Created by Al Faruk on 24/11/24.
//

import SwiftUI
import AVKit

struct ArtistScreen: View {
    let category: CategoryDtoItem
    
    @StateObject var viewmodel = ArtistViewModel()
    @State private var isVideoPlayer = false
    @Environment(\.dismiss) var dismiss
    let width = UIScreen.main.bounds.width
    
    
    var body: some View {
        let state = viewmodel.state
        
        NavigationStack {
            ZStack {
                Color.backgroundColor.edgesIgnoringSafeArea(.all)
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                        ForEach(state.artist.data ?? [], id: \.id) { (item: ArtistDtoItem) in
                            NavigationLink(destination: ArtistAudioVideoScreen(category: CategoryDtoItem(name: AppConstants.gajalArtist, icon: .artist, selectedTab: 0), artist: item), label: {
                                
                                VStack{
                                    AsyncImage(url: URL(string: (item.contentBaseUrl ?? "") + replaceSize(url: (item.imageUrl ?? ""), replaceWith: hundredNinetyTwo))){ image in
                                        image.resizable().frame(width: width / 3, height: width / 3).clipShape(Circle())
                                    }placeholder:{
                                        ProgressView().frame(width: width / 3, height: width / 3, alignment: .center)
                                    }
                                    
                                    Text(item.name ?? "").foregroundColor(Color.gray).font(.system(size: 14)).lineLimit(1)
                                    
                                    Text(String(item.totalTrack ?? 0) + " " + AppConstants.gajalArtist).font(.system(size: 12)).foregroundColor(Color.grayLight).lineLimit(1)
                                    
                                }.padding(10).frame(maxWidth: .infinity).background(Color.backgroundDark).clipShape(RoundedRectangle(cornerRadius: 15))
                                
                            })
                            
                        }
                    }.padding(10)
                }
            }.background(Color.backgroundColor).navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .principal) {
                        AppBar(title: category.name ?? "", icon: category.icon, image: (category.contentBaseURL ?? "") + (category.imageURL ?? ""), dismiss: { dismiss() })
                    }
                }.navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    ArtistScreen(category: CategoryDtoItem())
}
