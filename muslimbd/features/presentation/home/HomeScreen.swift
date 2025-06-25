//
//  HomeScreen.swift
//  muslimbd
//
//  Created by Al Faruk on 24/11/24.
//

import SwiftUI
import AVKit

struct HomeScreen: View {
    
    @StateObject var viewmodel = HomeViewModel()
    @State private var isVideoPlayer = false
    
    let imageWidth = UIScreen.main.bounds.width / 2.5
    let wallPaperHeight = UIScreen.main.bounds.width / 2
    
    var body: some View {
        let state = viewmodel.state
        
        NavigationStack {
            ZStack {
                Color.backgroundColor.edgesIgnoringSafeArea(.all)
                ScrollView {
                    LazyVStack{
                        Spacer().frame(height: 10)
                        
                        HomeBanners(banners: state.banners, prayer: state.currentPrayer, location: state.city.placeName ?? "")
                        
                        if(state.categories.data != nil){
                            CategoriesView(categories: state.categories, isShowMore: state.isShowMore)
                        }
                        
                        if(state.categories.data != nil){
                            ShowMoreButton(isShowMore: state.isShowMore, showMore: {
                                viewmodel.toggleShowMore()
                            })
                        }
                        
                        if(state.tracks.data != nil){
                            AudioTracks(category: CategoryDtoItem(name: AppConstants.gajalAudio, id: AppConstants.artistAudioId, icon: .audio), tracks: state.tracks, onTap: { track in
                                
                            })
                        }
                        
                        if(state.artistList.data != nil){
                            ArtistsWithMore(category: CategoryDtoItem(name: AppConstants.gajalArtist, icon: .artist),artistList: state.artistList)
                        }
                        
                        if(state.scholars.data != nil){
                            Scholars(scholars: state.scholars)
                        }
                        
                        if(state.videoTracks.data != nil){
                            VideoTracks(category: CategoryDtoItem(name: AppConstants.gajalVideo, id: AppConstants.artistVideoId, icon: .video), tracks: state.videoTracks, onTap: { track in
                                viewmodel.videoSelected(track: track)
                                isVideoPlayer = true
                            })
                        }
                        
                        
                        if(state.categories.data != nil){
                            PrayerLearnig(category: CategoryDtoItem(name: AppConstants.prayerLearning, id: AppConstants.prayerLearningId, icon: .prayerLearning))
                        }
                        
                        if(state.panchaStomvo.data != nil){
                            ImageContents(category: CategoryDtoItem(name: AppConstants.panchaStomvo, id: AppConstants.panchaStomvoId, icon: .pillar), contents: state.panchaStomvo, width: imageWidth, height: imageWidth)
                        }
                        
                        if(state.kalima.id != nil){
                            Kalima(category: CategoryDtoItem(name: AppConstants.kalima, id: AppConstants.kalimaId, icon: .kalima), image: .kalimaBanner, content: state.kalima)
                        }
                        
                        if(state.dorud.data != nil){
                            TextContents(category: CategoryDtoItem(name: AppConstants.dorud, isPremium: true, id: AppConstants.dorudId, icon: .dorud), contents: state.dorud, color: Color.textGradientColor)
                        }
                        
                        Quran(category: CategoryDtoItem(name: AppConstants.quran, id: AppConstants.alQuranId, icon: .alQuran), image: .alQuranHome)
                        
                        
                        if(state.duas.data != nil){
                            TextContents(category: CategoryDtoItem(name: AppConstants.dua, isPremium: true, id: AppConstants.duaId, icon: .dua), contents: state.duas, color: Color.textGradientColor2)
                        }
                        
                        Para(category: CategoryDtoItem(name: AppConstants.para, id: AppConstants.paraId, icon: .alQuran), image: .paraBanner)
                        
                        if(state.dailyDuas.data != nil){
                            TextContents(category: CategoryDtoItem(name: AppConstants.dailyDua, isPremium: true, id: AppConstants.dailyDuaId, icon: .dailyDua), contents: state.dailyDuas, color: Color.textGradientColor)
                        }
                        
                        if(state.islamicDibosh.id != nil){
                            Content(category: CategoryDtoItem(name: AppConstants.islamicDibosh, id: AppConstants.islamicDiboshId, icon: .islamicDiboshIcon), image: .islamicDibosh, content: state.islamicDibosh)
                        }
                        
                        if(state.hadith.data != nil){
                            TextContents(category: CategoryDtoItem(name: AppConstants.hadith, isPremium: true, id: AppConstants.hadithId, icon: .hadith), contents: state.hadith, color: Color.textGradientColor2)
                        }
                        
                        Quran(category: CategoryDtoItem(name: AppConstants.jonoprioSura, id: AppConstants.jonoprioSuraId, icon: .alQuran), image: .jonoprioSuraBanner)
                        
                        
                        if(state.hazz.data != nil){
                            TextContents(category: CategoryDtoItem(name: AppConstants.hazz, id: AppConstants.hajjId, icon: .mecca), contents: state.hazz, color: Color.textGradientColor)
                        }
                        
                        if(state.zakat.data != nil){
                            TextContents(category: CategoryDtoItem(name: AppConstants.zakat, id: AppConstants.zakatId, icon: .zakat), contents: state.zakat, color: Color.textGradientColor2)
                        }
                        
                        if(state.islamicEvent.id != nil){
                            Content(category: CategoryDtoItem(name: AppConstants.islamicEvent, id: AppConstants.islamicEventId, icon: .islamicEvent), image: .islamicEventBanner, content: state.islamicEvent)
                        }
                        
                        if(state.tasbeeh.data != nil){
                            TextContents(category: CategoryDtoItem(name: AppConstants.tasbeeh, id: AppConstants.tasbeehId, icon: .tasbih), contents: state.tasbeeh, color: Color.textGradientColor)
                        }
                        
                        if(state.allahNames.data != nil){
                            AllahNames(category: CategoryDtoItem(name: AppConstants.allah99Names, id: AppConstants.allahNamesId, icon: .allah), allahNames: state.allahNames)
                        }
                        
                        if(state.nobiRasulerJiboni.id != nil){
                            Content(category: CategoryDtoItem(name: AppConstants.nobiRasulerJiboni, id: AppConstants.nobiRasulerJiboniId, icon: .jiboniIcon), image: .nobiRasulerJiboni, content: state.nobiRasulerJiboni)
                        }
                        
                        if(state.ayaat.data != nil){
                            TextContents(category: CategoryDtoItem(name: AppConstants.ayaat, id: AppConstants.ayatId, icon: .ayaat), contents: state.ayaat, color: Color.textGradientColor)
                        }
                        
                        if(state.historicalPlace.id != nil){
                            Content(category: CategoryDtoItem(name: AppConstants.historicalPlace, id: AppConstants.historicalPlaceId, icon: .historicalPlace), image: .historicalPlaceBanner, content: state.historicalPlace)
                        }
                        
                        if(state.imageContents.data != nil){
                            ImageContents(category: CategoryDtoItem(name: AppConstants.islamicCoats, isPremium: true, id: AppConstants.imageCategoryId, icon: .inspiration), contents: state.imageContents, width: imageWidth, height: imageWidth)
                        }
                        
                        IslamicNames(category: CategoryDtoItem(name: AppConstants.islamicName, id: AppConstants.islamicNameId, icon: .islamicNames))
                        
                        if(state.wallPapers.data != nil){
                            ImageContents(category: CategoryDtoItem(name: AppConstants.wallPaper, isPremium: true, id: AppConstants.wallPaperId, icon: .wallPaper), contents: state.wallPapers, width: imageWidth, height: wallPaperHeight)
                        }
                        
                        if(state.islamicBook.id != nil){
                            Content(category: CategoryDtoItem(name: AppConstants.islamicBook, id: AppConstants.islamicBookId, icon: .islamicBook), image: .islamicBookBanner, content: state.islamicBook)
                        }
                        
                        if(state.amaderSahabi.id != nil){
                            Content(category: CategoryDtoItem(name: AppConstants.amaderSahabi, id: AppConstants.amaderSahabiId, icon: .amaderSahabiIcon), image: .amaderSahabiBanner, content: state.amaderSahabi)
                        }
                        
                        if(state.golpo.id != nil){
                            Content(category: CategoryDtoItem(name: AppConstants.golpo, id: AppConstants.golpoId, icon: .golpoIcon), image: .golpo, content: state.golpo)
                        }
                        
                        if(state.rasulerJiboni.id != nil){
                            Content(category: CategoryDtoItem(name: AppConstants.rasulerJibon, id: AppConstants.rasulerJibonId, icon: .golpoIcon), image: .rasulerJiboni, content: state.rasulerJiboni)
                        }
                        
                        Spacer().frame(height: 10)
                    }
                }
            }.background(Color.backgroundColor).navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .principal) {
                        AppBar(title: "MuslimBD", icon: .logo, isBack: false, dismiss: {})
                    }
                }.fullScreenCover(isPresented: $isVideoPlayer, content: {
                    VideoPlayerView(track: state.currentTrack, onBack: {
                        isVideoPlayer = false
                    })
                    .statusBar(hidden: false)
                })
        }
    }
}

#Preview {
    HomeScreen()
}
