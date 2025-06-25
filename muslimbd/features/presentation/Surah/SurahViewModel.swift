//
//  CategoryViewModel.swift
//  muslimbd
//
//  Created by Al Faruk on 12/1/25.
//

import Foundation
import Combine
import Resolver
import UIKit

class SurahViewModel: ObservableObject {
    @Injected private var getAlQuranUseCase: GetAlQuranUseCase
    @Injected private var getSurahUseCase: GetSurahUseCase
    
    
    private var cancelables = [AnyCancellable]()

    @Published var state: SurahState = SurahState()
    
    func initiate(category: CategoryDtoItem, surahItem: AlQuranDtoItem) {
        state = state.copy(surahItem: surahItem)
        getAlQuran(category: category)
        getSurah(surah: surahItem)
    }
    
    private func getAlQuran(category: CategoryDtoItem){
        getAlQuranUseCase.invoke().receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                
                let popular = [1, 2, 18, 36, 67, 108, 109, 112, 113, 114]
                var data = response.data
                if(category.id == AppConstants.jonoprioSuraId){
                    data = data?.filter({popular.contains($0.sequenceNo ?? 0)}) ?? []
                }
                                
                self?.state = self?.state.copy(isLoading: false, alQuran: response.copy(data: data)) ?? SurahState()
                
            }).store(in: &cancelables)
    }
    
    func getSurah(surah: AlQuranDtoItem) {
        state = state.copy(isLoading: false, surah: SurahDto())
        
        getSurahUseCase.invoke(id: surah.id ?? "").receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {_ in}, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(surah: response) ?? SurahState()
            }).store(in: &cancelables)
    }
    
    func next(play: (String) -> Void){
        if(state.surahItem.sequenceNo ?? 0 < 114 && state.alQuran.data != nil){
            for item in 0...((state.alQuran.data?.count ?? 0) - 2) {
                if(state.surahItem.sequenceNo == state.alQuran.data?[item].sequenceNo){
                    state = state.copy(surahItem: state.alQuran.data?[item + 1])
                    play((state.surahItem.contentBaseUrl ?? "") + (state.surahItem.contentUrl ?? ""))
                    break
                }
            }
            
        }
    }
    
    func prev(play: (String) -> Void){
        if(state.surahItem.sequenceNo ?? 0 > 1 && state.alQuran.data != nil){
            for item in 1...((state.alQuran.data?.count ?? 0) - 1) {
                if(state.surahItem.sequenceNo == state.alQuran.data?[item].sequenceNo){
                    state = state.copy(surahItem: state.alQuran.data?[item - 1])
                    play((state.surahItem.contentBaseUrl ?? "") + (state.surahItem.contentUrl ?? ""))
                    break
                }
            }
            
        }
    }
}
