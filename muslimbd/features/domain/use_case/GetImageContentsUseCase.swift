//
//  GetImageContentsUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 5/1/25.
//

import Foundation
import Combine
import Resolver

class GetImageContentsUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(id: String) -> AnyPublisher<ImageContentsDto, Error> {
        
        apiRepo.getImageContents(id: id).map({response in
            return response.copy(data: response.data?.filter({$0.isActive == true}).reversed())
        }).eraseToAnyPublisher()
    }
}
