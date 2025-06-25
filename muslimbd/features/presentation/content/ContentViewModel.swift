//
//  ContentViewModel.swift
//  muslimbd
//
//  Created by Al Faruk on 13/1/25.
//

import Foundation
import Resolver
import Combine
import UIKit

class ContentViewModel: ObservableObject {
    @Injected private var getTextContentUseCase: GetTextContentUseCase
    
    private var cancelable = [AnyCancellable]()
    @Published var state: ContentState = ContentState()
    
    func initiate(category: CategoryDtoItem, content: TextContentDtoItem){
        if (category.id != AppConstants.imageCategoryId && category.id != AppConstants.panchaStomvoId && category.category != AppConstants.wallPaperId) {
            getContent(id: content.id ?? "")
        }
        state = state.copy(category: category, content: TextContentDto(data: content))
    }
    
    private func getContent(id: String) {
        getTextContentUseCase.invoke(id: id).receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                
                self?.state = self?.state.copy(isLoading: false, content: response) ?? ContentState()
                
                let content = self?.state.content.data
                if(self?.state.category.contentBaseURL?.isEmpty == nil){
                    
                    self?.state = self?.state.copy(category: CategoryDtoItem(name: content?.categoryName,imageURL: content?.imageUrl, contentBaseURL: content?.contentBaseUrl, id: content?.category)) ?? ContentState()

                }
                
            }).store(in: &cancelable)
    }
}
