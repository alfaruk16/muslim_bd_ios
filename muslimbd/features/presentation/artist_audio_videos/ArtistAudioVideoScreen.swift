//
//  HomeScreen.swift
//  muslimbd
//
//  Created by Al Faruk on 24/11/24.
//

import SwiftUI
import AVKit

struct ArtistAudioVideoScreen: View {
    let category: CategoryDtoItem
    let artist: ArtistDtoItem
    
    @StateObject var viewmodel = ArtistAudioVideoViewModel()
    @State private var isVideoPlayer = false
    @Environment(\.dismiss) var dismiss
    @State var selectedTab = 0
    
    var body: some View {
        let state = viewmodel.state
        
        NavigationStack {
            ZStack {
                Color.backgroundColor.edgesIgnoringSafeArea(.all)
                ScrollView {
                    LazyVStack{
                        
                        Spacer().frame(height:15)
                        
                        ArtistView(artist: state.currentArtist)
                        
                        Spacer().frame(height: 15)
                        
                        AudioVideoTab(selectedTab: $selectedTab, tabChanged: { index in
                            viewmodel.tabChanged(index: index)
                        })
                        
                        if(selectedTab == 0){
                            if(state.tracks.data != nil){
                                ArtistAudios(tracks: state.tracks, showCount: state.showCount, showMore: {
                                    viewmodel.showMore()
                                }, onTap: { item in
                                    
                                })
                            }
                        }else {
                            if(state.videoTracks.data != nil){
                                ArtistVideos(tracks: state.tracks, showCount: state.showCountVideo, showMore: {
                                    viewmodel.showMore()
                                }, onTap: { item in
                                    viewmodel.videoSelected(track: item)
                                    isVideoPlayer = true
                                })
                            }
                        }
                        
                        if(state.artistList.data  != nil){
                            Artists(artistList: state.artistList, currentArtistId: state.currentArtistId, onTap: { artist in
                                viewmodel.artistSelected(artist: artist)
                            })
                        }
                
                        
                        Spacer().frame(height: 10)
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
            selectedTab = category.selectedTab ?? 0
            viewmodel.initiate(artist: artist)
        })
    }
}

#Preview {
    HomeScreen()
}
