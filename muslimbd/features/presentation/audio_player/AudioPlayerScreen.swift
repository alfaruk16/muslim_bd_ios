//
//  HomeScreen.swift
//  muslimbd
//
//  Created by Al Faruk on 24/11/24.
//

import SwiftUI
import AVKit

struct AudioPlayerScreen: View {
    let category: CategoryDtoItem
    let track: TracksDtoItem
    
    @StateObject var viewmodel = AudioPlayerViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        let state = viewmodel.state
        
        NavigationStack {
            ZStack {
                Color.backgroundColor.edgesIgnoringSafeArea(.all)
                ScrollView {
                    LazyVStack{
                        
                        AudioPlayerView(track: state.track, palyAudio: { track in
                            
                        })
                        Spacer().frame(height: 10)
                    }
                }
            }.background(Color.backgroundColor).navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .principal) {
                        AppBar(title: category.name ?? "", icon: category.icon, image: (category.contentBaseURL ?? "") + (category.imageURL ?? ""), dismiss: { dismiss() })
                    }
                }.navigationBarBackButtonHidden(true)
                
        }.onAppear(perform: {
            viewmodel.initiate(track: track)
        })
    }
}

#Preview {
    HomeScreen()
}
