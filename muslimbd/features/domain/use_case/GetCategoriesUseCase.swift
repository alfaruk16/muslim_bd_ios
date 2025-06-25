//
//  GetCategoriesUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 9/12/24.
//

import Foundation
import Combine
import Resolver

class GetCategoriesUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke() -> AnyPublisher<CategoryDto, Error> {
        apiRepo.getCategories().map { response in
                        
            return response.copy(data: response.data?.filter({$0.isActive == true}).sorted(by: {$0.sequenceNo ?? 0 < $1.sequenceNo ?? 0}))
            
        }.eraseToAnyPublisher()
    }
}
