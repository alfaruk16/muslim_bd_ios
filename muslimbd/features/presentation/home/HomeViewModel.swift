//
//  HomeViewModel.swift
//  muslimbd
//
//  Created by Al Faruk on 24/11/24.
//

import Foundation
import Combine
import Resolver
import UIKit

class HomeViewModel: ObservableObject {
    @Injected private var getCategoriesUseCase: GetCategoriesUseCase
    @Injected private var getContentsUseCase: GetContentsUseCase
    @Injected private var getPrayerTimesUseCase: GetPrayerTimesMonthlyUseCase
    @Injected private var getTracksUseCase: GetTracksByTypeUseCase
    @Injected private var getPrayerTimesByCityUseCase: GetPrayerTimesByCityUseCase
    @Injected private var getTrackBilboardUseCase: GetTrackBillboardUseCase
    @Injected private var getCategoryContentsUseCase: GetCategoryContentsUseCase
    @Injected private var getImageContentsUseCase: GetImageContentsUseCase
    @Injected private var getAllahNamesUseCase: GetAllahNamesUseCase
    @Injected private var getSubscriptionUseCase: GetSubscriptionUseCase
    @Injected private var getPromotionUseCase: GetPromotionsUseCase
    @Injected private var getScholarUseCase: GetScholarUseCase
    @Injected private var getArtistUseCase: GetArtistUseCase
    
    private var cancelables = [AnyCancellable]()
    
    @Published var state: HomeState = HomeState()
    
    init(cancelables: [AnyCancellable] = [AnyCancellable]()) {
        self.cancelables = cancelables
        getCategories()
        getCities()
        getPrayerTimes()
        getDailyDuas()
        getDuas()
        getHadith()
        getZakat()
        getAllahNames()
        getTrackBillboard()
        getImageContents()
        getPanchaStomvo()
        getAyaat()
        getDorudOSalam()
        getHazz()
        getContents()
        getWallpaperContents()
        getKalima()
        getPromotions()
        getScholar()
        getArtist()
        getHistoricalPlace()
        getIslamicEvent()
        getIslamicBook()
        getNobiRasulerJiboni()
        getAmaderSahabi()
        getMeccaMadina()
        getGolpo()
        getRasulerJibon()
        getIslamicDibosh()
        getTracks()
        getVideoTracks()
    }
    
    func getTracks(){
        getTracksUseCase.invoke(type: AppConstants.typeAudio, take: 50).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(tracks: response) ?? HomeState()
            })
            .store(in: &cancelables)
    }
    
    func getVideoTracks(){
        getTracksUseCase.invoke(type: AppConstants.typeVideo, take: 50).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(videoTracks: response) ?? HomeState()
            })
            .store(in: &cancelables)
    }
    
    func getCategories(){
        getCategoriesUseCase.invoke().receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(categories: response) ?? HomeState()
            })
            .store(in: &cancelables)
    }
    
    func toggleShowMore(){
        state = state.copy(isShowMore: !state.isShowMore)
    }
    
    func getCities(){
        getPrayerTimesByCityUseCase.invoke().receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, cityPrayerTimes: response) ?? HomeState()
            }).store(in: &cancelables)
    }
    
    func getPrayerTimes() {
        getPrayerTimesUseCase.invoke().receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                
                self?.state = self?.state.copy(isLoading: false, prayerTimes: response) ?? HomeState()
                self?.preparePrayerTimes()
                
            }).store(in: &cancelables)
    }
    
    func preparePrayerTimes() {
        do {
            let now = Date()
            let dateMonth = now.day + "-" + now.month
            
            if(todaysPrayerTime(dateMonth: dateMonth)){
                var startDay = 0
                
                for date in 0..<(state.prayerTimes.data?.count ?? 0){
                    let today = state.prayerTimes.data?[date].date_month?.split(separator: "-")
                    if(today?[0] ?? "" == now.day && now.month.uppercased().starts(with: today?[1].uppercased() ?? "")){
                        startDay = date
                        break
                    }
                }
                
                for day in startDay...(startDay + 2){
                    let prayerTime = state.prayerTimes.data?[day]
                    let cityTime = state.city
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                    let timeFormatter = DateFormatter()
                    timeFormatter.dateFormat = "hh:mm a"
                    
                    let fazr = dateFormatter.date(from: Date().date + " " + (prayerTime?.fazr ?? ""))?.addingTimeInterval(cityTime.fazr ?? 0 * 60)
                    let sunrise = dateFormatter.date(from: Date().date + " " + (prayerTime?.sunrise ?? ""))?.addingTimeInterval(cityTime.sunrise ?? 0 * 60)
                    let juhr = dateFormatter.date(from: Date().date + " " + (prayerTime?.juhr ?? ""))?.addingTimeInterval(cityTime.johr ?? 0 * 60)
                    let asr = dateFormatter.date(from: Date().date + " " + (prayerTime?.asr ?? ""))?.addingTimeInterval(cityTime.asr ?? 0 * 60)
                    let magrib = dateFormatter.date(from: Date().date + " " + (prayerTime?.magrib ?? ""))?.addingTimeInterval(cityTime.magrib ?? 0 * 60)
                    let isha = dateFormatter.date(from: Date().date + " " + (prayerTime?.isha ?? ""))?.addingTimeInterval(cityTime.isha ?? 0 * 60)
                    let sehri = dateFormatter.date(from: Date().date + " " + (prayerTime?.sehri ?? ""))?.addingTimeInterval(cityTime.seheri ?? 0 * 60)
                    
                    if(day == startDay){
                        let times = [Prayer(nowTime: nowTime(start: fazr, end: sunrise), prayerName: Language.fajr, time: timeFormatter.string(from: fazr ?? Date()), image: .prayerTime1, nextPrayerName: Language.dhuhr, nextPrayerTime: timeFormatter.string(from: juhr ?? Date()), sehri: timeFormatter.string(from: sehri ?? Date()), iftar: timeFormatter.string(from: magrib ?? Date())),
                                     Prayer(nowTime: nowTime(start: juhr, end: asr), prayerName: Language.dhuhr, time: timeFormatter.string(from: juhr ?? Date()), image: .prayerTime2, nextPrayerName: Language.asr, nextPrayerTime: timeFormatter.string(from: asr ?? Date()), sehri: timeFormatter.string(from: sehri ?? Date()), iftar: timeFormatter.string(from: magrib ?? Date())),
                                     Prayer(nowTime: nowTime(start: asr, end: magrib), prayerName: Language.asr, time: timeFormatter.string(from: asr ?? Date()), image: .prayerTime3, nextPrayerName: Language.maghrib, nextPrayerTime: timeFormatter.string(from: magrib ?? Date()), sehri: timeFormatter.string(from: sehri ?? Date()), iftar: timeFormatter.string(from: magrib ?? Date())),
                                     Prayer(nowTime: nowTime(start: magrib, end: isha), prayerName: Language.maghrib, time: timeFormatter.string(from: magrib ?? Date()), image: .prayerTime4, nextPrayerName: Language.maghrib, nextPrayerTime: timeFormatter.string(from: isha ?? Date()), sehri: timeFormatter.string(from: sehri ?? Date()), iftar: timeFormatter.string(from: magrib ?? Date())),
                                     Prayer(nowTime: nowTime(start: isha, end: dateFormatter.date(from: Date().date + " :23:59:59")), prayerName: Language.isha, time: timeFormatter.string(from: isha ?? Date()), image: .prayerTime5, nextPrayerName: Language.fajr, nextPrayerTime: timeFormatter.string(from: fazr ?? Date()), sehri: timeFormatter.string(from: sehri ?? Date()), iftar: timeFormatter.string(from: magrib ?? Date()))
                        ]
                        
                        var current = Prayer(nowTime: nowTime(start: fazr, end: sunrise), prayerName: Language.fajr, time: timeFormatter.string(from: fazr ?? Date()), image: .prayerTime1, nextPrayerName: Language.dhuhr, nextPrayerTime: timeFormatter.string(from: juhr ?? Date()), sehri: timeFormatter.string(from: sehri ?? Date()), iftar: timeFormatter.string(from: magrib ?? Date()))
                        
                        for prayer in times {
                            if(!prayer.nowTime.isEmpty){
                                current = prayer
                            }
                        }
                        
                        self.state = self.state.copy(currentPrayer: current, prayerTime: times)
                        
                    }
                }
            }
            
        } catch {
            print("Error \(error)")
        }
    }
    
    func todaysPrayerTime(dateMonth: String) -> Bool {
        for prayer in state.prayerTimes.data ?? [] {
            if(dateMonth.lowercased().starts(with: prayer.date_month?.lowercased() ?? "")){
                return true
            }
        }
        return false
    }
    
    func nowTime(start: Date?, end: Date?) -> String {
        if(Date() > start ?? Date() && Date() < end ?? Date()) {
            return "এখনকার ওয়াক্ত"
        }
        return ""
    }
    
    func getMeccaMadina(){
        getCategoryContentsUseCase.invoke(id: AppConstants.meccaMadinaId).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, meccaMadina: response) ?? HomeState()
            })
            .store(in: &cancelables)
    }
    
    func getArtist(){
        getArtistUseCase.invoke().receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                
                let list = (response.data ?? []).map { item in
                    item.copy(imageUrl: replaceSize(url: item.imageUrl ?? "", replaceWith: hundredNinetyTwo))
                }.shuffled()
                
                self?.state = self?.state.copy(isLoading: false, artistList: response.copy(data: list)) ?? HomeState()
            })
            .store(in: &cancelables)
    }
    
    func getScholar(){
        getScholarUseCase.invoke().receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false,  scholars: response.copy(data: response.data?.shuffled())) ?? HomeState()
            })
            .store(in: &cancelables)
    }
    
    func getPromotions(){
        getPromotionUseCase.invoke().receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false,  promotions: response.copy(data: response.data?.filter({$0.isActive == true}))) ?? HomeState()
            })
            .store(in: &cancelables)
    }
    
    func getHazz(){
        getCategoryContentsUseCase.invoke(id: AppConstants.hajjId).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false,  hazz: response) ?? HomeState()
            })
            .store(in: &cancelables)
    }
    
    func getKalima(){
        getCategoryContentsUseCase.invoke(id: AppConstants.kalimaId).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, kalima: response.data?[response.data?.indices.randomElement() ?? 0]) ?? HomeState()
            })
            .store(in: &cancelables)
    }
    
    func getHistoricalPlace(){
        getCategoryContentsUseCase.invoke(id: AppConstants.historicalPlaceId).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, historicalPlace: response.data?[response.data?.indices.randomElement() ?? 0]) ?? HomeState()
            })
            .store(in: &cancelables)
    }
    
    func getIslamicEvent(){
        getCategoryContentsUseCase.invoke(id: AppConstants.islamicEventId).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, islamicEvent: response.data?[response.data?.indices.randomElement() ?? 0]) ?? HomeState()
            })
            .store(in: &cancelables)
    }
    
    func getIslamicBook(){
        getCategoryContentsUseCase.invoke(id: AppConstants.islamicBookId).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, islamicBook: response.data?[response.data?.indices.randomElement() ?? 0]) ?? HomeState()
            })
            .store(in: &cancelables)
    }
    
    func getNobiRasulerJiboni(){
        getCategoryContentsUseCase.invoke(id: AppConstants.nobiRasulerJiboniId).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, nobiRasulerJiboni: response.data?[response.data?.indices.randomElement() ?? 0]) ?? HomeState()
            })
            .store(in: &cancelables)
    }
    
    func getAmaderSahabi(){
        getCategoryContentsUseCase.invoke(id: AppConstants.amaderSahabiId).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, amaderSahabi: response.data?[response.data?.indices.randomElement() ?? 0]) ?? HomeState()
            })
            .store(in: &cancelables)
    }
    
    func getGolpo(){
        getCategoryContentsUseCase.invoke(id: AppConstants.golpoId).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, golpo: response.data?[response.data?.indices.randomElement() ?? 0]) ?? HomeState()
            })
            .store(in: &cancelables)
    }
    
    func getRasulerJibon(){
        getCategoryContentsUseCase.invoke(id: AppConstants.rasulerJibonId).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, rasulerJiboni: response.data?[response.data?.indices.randomElement() ?? 0]) ?? HomeState()
            })
            .store(in: &cancelables)
    }
    
    func getIslamicDibosh(){
        getCategoryContentsUseCase.invoke(id: AppConstants.islamicDiboshId).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, islamicDibosh: response.data?[response.data?.indices.randomElement() ?? 0]) ?? HomeState()
            })
            .store(in: &cancelables)
    }
    
    func getDailyDuas(){
        getCategoryContentsUseCase.invoke(id: AppConstants.dailyDuaId).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                let data = response.data?.filter({$0.textInArabic != nil && $0.text != nil}).shuffled()
                self?.state = self?.state.copy(isLoading: false, dailyDuas: response.copy(data: data)) ?? HomeState()
                
                if((Int(Date().day) ?? 0) % 2 == 0 && data != nil && self?.state.textBillBoard.id == nil){
                    self?.state = self?.state.copy(textBillBoard: data?[(data?.indices.randomElement()) ?? 0] ?? TextContentDtoItem()) ?? HomeState()
                }
            })
            .store(in: &cancelables)
    }
    
    func getHadith(){
        getCategoryContentsUseCase.invoke(id: AppConstants.hadithId).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                let data = response.data?.filter({$0.text != nil}).shuffled()
                self?.state = self?.state.copy(isLoading: false, hadith: response.copy(data: data)) ?? HomeState()
                
                if((Int(Date().day) ?? 0) % 2 == 0 && data != nil && self?.state.textBillBoard.id == nil){
                    self?.state = self?.state.copy(textBillBoard: data?[(data?.indices.randomElement()) ?? 0] ?? TextContentDtoItem()) ?? HomeState()
                }
            })
            .store(in: &cancelables)
    }
    
    func getDuas(){
        getCategoryContentsUseCase.invoke(id: AppConstants.duaId).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                let data = response.data?.filter({$0.textInArabic != nil && $0.text != nil}).shuffled()
                self?.state = self?.state.copy(isLoading: false, duas: response.copy(data: data)) ?? HomeState()
            })
            .store(in: &cancelables)
    }
    
    func getDorudOSalam(){
        getCategoryContentsUseCase.invoke(id: AppConstants.dorudId).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                let data = response.data?.filter({$0.textInArabic != nil && $0.text != nil}).shuffled()
                self?.state = self?.state.copy(isLoading: false, dorud: response.copy(data: data)) ?? HomeState()
            })
            .store(in: &cancelables)
    }
    
    func getZakat(){
        getCategoryContentsUseCase.invoke(id: AppConstants.zakatId).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                let data = response.data?.filter({$0.textInArabic != nil && $0.text != nil}).shuffled()
                self?.state = self?.state.copy(isLoading: false, zakat: response.copy(data: data)) ?? HomeState()
            })
            .store(in: &cancelables)
    }
    
    func getAyaat(){
        getCategoryContentsUseCase.invoke(id: AppConstants.dailyDuaId).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, dailyDuas: response.copy(data: response.data?.shuffled())) ?? HomeState()
            })
            .store(in: &cancelables)
    }
    
    func getAllahNames(){
        getAllahNamesUseCase.invoke().receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, allahNames: response) ?? HomeState()
            })
            .store(in: &cancelables)
    }
    
    func getImageContents(){
        getImageContentsUseCase.invoke(id: AppConstants.imageCategoryId).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, imageContents: response.copy(data: response.data?.shuffled())) ?? HomeState()
            })
            .store(in: &cancelables)
    }
    
    func getWallpaperContents(){
        getImageContentsUseCase.invoke(id: AppConstants.wallPaperId).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, wallPapers: response.copy(data: response.data?.shuffled())) ?? HomeState()
            })
            .store(in: &cancelables)
    }
    
    func getPanchaStomvo(){
        getImageContentsUseCase.invoke(id: AppConstants.panchaStomvoId).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, panchaStomvo: response) ?? HomeState()
            })
            .store(in: &cancelables)
    }
    
    func getTrackBillboard(){
        getTrackBilboardUseCase.invoke().receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                let data = response.data?.filter({$0.contentType == AppConstants.shortPlay}).shuffled()
                if(!(data?.isEmpty ?? false)){
                    self?.state = self?.state.copy(isLoading: false, billBoard: data?[data?.indices.randomElement() ?? 0]) ?? HomeState()
                }
            })
            .store(in: &cancelables)
    }
    
    func getContents(){
        getContentsUseCase.invoke().receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                for data in response.data ?? [] {
                    if(data.patchId == AppConstants.podcastPatchId){
                        if(!(data.items?.isEmpty ?? false)){
                            self?.state = self?.state.copy(isLoading: false, podcast: data.items?[0].copy(contentUrl: data.contentBaseUrl)) ?? HomeState()
                        }
                    }
                }
            })
            .store(in: &cancelables)
    }
    
    func videoSelected(track: TracksDtoItem){
        state = state.copy(currentTrack: track)
    }
}

