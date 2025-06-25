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

class AllParaViewModel: ObservableObject {
    @Injected private var getAllParaUseCase: GetAllParaUseCase
    
    
    private var cancelables = [AnyCancellable]()

    @Published var state: AllParaState = AllParaState()
    
    func initiate(category: CategoryDtoItem) {
        getAllPara(category: category)
    }
    
    private func getAllPara(category: CategoryDtoItem){
        getAllParaUseCase.invoke().receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, alQuran: response) ?? AllParaState()
            }).store(in: &cancelables)
    }
}
