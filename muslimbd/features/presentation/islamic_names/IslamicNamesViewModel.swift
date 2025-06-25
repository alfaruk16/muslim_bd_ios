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

class IslamicNamesViewModel: ObservableObject {
    @Injected private var getIslamicName: GetIslamicNameByGenderUseCase
    
    private var cancelables = [AnyCancellable]()

    @Published var state: IslamicNamesState = IslamicNamesState()
    
    func initiate(category: CategoryDtoItem) {
        checkTab(index: category.selectedTab)
        getIslamicNameMale()
        getIslamicNameFemale()
    }
    
    func checkTab(index: Int?){
        state = state.copy(selectedTab: index ?? 0)
    }
    
    private func getIslamicNameMale(){
        getIslamicName.invoke(gender: "male").receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, male: response) ?? IslamicNamesState()
            }).store(in: &cancelables)
    }
    
    private func getIslamicNameFemale(){
        getIslamicName.invoke(gender: "female").receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, female: response) ?? IslamicNamesState()
            }).store(in: &cancelables)
    }
    
    func tabChanged(index: Int){
        state = state.copy(selectedTab: index)
        if(index == 0 && state.male.data == nil){
            getIslamicNameMale()
        }else if (state.female.data == nil){
            getIslamicNameFemale()
        }
    }
}
