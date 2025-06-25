//
//  GetVideoContentsUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 2/1/25.
//

import Foundation
import Combine
import Resolver

class GetVideoContentsUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(id: String) -> AnyPublisher<VideoContentsDto, Error> {
        
        apiRepo.getVideoContents(id: id).map { response in
            
            let data = response.data?.filter({$0.isActive == true})
            
            return response.copy(data: data)
            
            
        }.eraseToAnyPublisher()
    }
}
