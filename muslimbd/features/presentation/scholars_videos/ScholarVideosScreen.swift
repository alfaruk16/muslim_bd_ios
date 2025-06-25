//
//  HomeScreen.swift
//  muslimbd
//
//  Created by Al Faruk on 24/11/24.
//

import SwiftUI
import AVKit

struct ScholarVideosScreen: View {
    let category: CategoryDtoItem
    let artist: ArtistDtoItem
    
    @StateObject var viewmodel = ScholarVideosViewModel()
    @State private var isVideoPlayer = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        let state = viewmodel.state
        
        NavigationStack {
            ZStack {
                Color.backgroundColor.edgesIgnoringSafeArea(.all)
                ScrollView {
                    LazyVStack{
                        
                        Spacer().frame(height: 15)
                        
                        ArtistView(artist: state.currentArtist)
                        
                        Spacer().frame(height: 15)
                        
                        if(state.tracks.data != nil){
                            ArtistVideos(tracks: state.tracks, showCount: state.showCount, showMore: {
                                viewmodel.showMore()
                            }, onTap: { item in
                                viewmodel.videoSelected(track: item)
                                isVideoPlayer = true
                            })
                        }
                        Spacer().frame(height: 15)
                        
                        if(state.artistList.data != nil){
                            ScholarArtists(artistList: state.artistList, currentArtistId: state.currentArtistId){ item in
                                viewmodel.artistSelected(artist: item)
                            }
                        }
                    }
                }
            }.background(Color.backgroundColor).navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .principal) {
                        AppBar(title: category.name ?? "", icon: category.icon, image: (category.contentBaseURL ?? "") + (category.imageURL ?? ""), dismiss: { dismiss() })
                    }
                }.navigationBarBackButtonHidden(true)
                .fullScreenCover(isPresented: $isVideoPlayer, content: {
                    VideoPlayerView(track: state.currentTrack, onBack: {
                        isVideoPlayer = false
                    })
                    .statusBar(hidden: false)
                })
        }.onAppear(perform: {
            viewmodel.initiate(artist: artist)
        })
    }
}

#Preview {
    HomeScreen()
}
