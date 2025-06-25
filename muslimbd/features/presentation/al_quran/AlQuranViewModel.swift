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

class AlQuranViewModel: ObservableObject {
    @Injected private var getAlQuranUseCase: GetAlQuranUseCase
    
    
    private var cancelables = [AnyCancellable]()

    @Published var state: AlQuranState = AlQuranState()
    
    func initiate(category: CategoryDtoItem) {
        getAlQuran(category: category)
    }
    
    private func getAlQuran(category: CategoryDtoItem){
        getAlQuranUseCase.invoke().receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                
                let popular = [1, 2, 18, 36, 67, 108, 109, 112, 113, 114]
                var data = response.data
                if(category.id == AppConstants.jonoprioSuraId){
                    data = data?.filter({popular.contains($0.sequenceNo ?? 0)}) ?? []
                }
                
                self?.state = self?.state.copy(isLoading: false, alQuran: response.copy(data: data)) ?? AlQuranState()
            }).store(in: &cancelables)
    }
}
