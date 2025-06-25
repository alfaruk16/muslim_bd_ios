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

class ParaViewModel: ObservableObject {
    @Injected private var getAllParaUseCase: GetAllParaUseCase
    @Injected private var getParaUseCase: GetParaUseCase
    
    
    private var cancelables = [AnyCancellable]()

    @Published var state: ParaState = ParaState()
    
    func initiate(category: CategoryDtoItem, surah: AllParaDtoItem) {
        getAlQuran()
        getSurah(surah: surah)
    }
    
    private func getAlQuran(){
        getAllParaUseCase.invoke().receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, alQuran: response) ?? ParaState()
            }).store(in: &cancelables)
    }
    
    func getSurah(surah: AllParaDtoItem) {
        state = state.copy(isLoading: false, surah: ParaDto())
        
        getParaUseCase.invoke(id: surah.id ?? "").receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {_ in}, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(surah: response) ?? ParaState()
            }).store(in: &cancelables)
    }
}
