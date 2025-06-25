//
//  GetSubCategoriesUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 5/1/25.
//

import Foundation
import Combine
import Resolver

class GetSubCategoriesUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(id: String) -> AnyPublisher<CategoryDto, Error> {
        apiRepo.getSubCategories(id: id).map({response in
            return response.copy(data: response.data?.filter({$0.isActive == true}).sorted(by: {$0.sequenceNo ?? 0 < $1.sequenceNo ?? 0}))
        }).eraseToAnyPublisher()
    }
}
