//
//  HomeScreen.swift
//  muslimbd
//
//  Created by Al Faruk on 24/11/24.
//

import SwiftUI
import AVKit

struct AudioArtistScreen: View {
    let category: CategoryDtoItem
    
    @StateObject var viewmodel = AudioArtistViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        let state = viewmodel.state
        
        NavigationStack {
            ZStack {
                Color.backgroundColor.edgesIgnoringSafeArea(.all)
                ScrollView {
                    LazyVStack{
                        
                        if(state.trackBillboard.data != nil){
                            BillboardBanners(banners: state.trackBillboard, onTap: { item in
                                
                            })
                        }
                        
                        Spacer().frame(height: 20)
                        
                        if(state.tracks.data != nil){
                            ArtistAudios(tracks: state.tracks, showCount: state.showCount, showMore: {
                                viewmodel.showMore()
                            }, onTap: { item in
                                
                            })
                        }
                        
                        Spacer().frame(height: 10)
                        
                        if(state.albums.data != nil){
                            
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
            
        }
    }
}

#Preview {
    HomeScreen()
}
