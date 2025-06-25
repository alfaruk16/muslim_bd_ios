//
//  GetTextContentUseCase.swift
//  muslimbd
//
//  Created by Al Faruk on 5/1/25.
//

import Foundation
import Combine
import Resolver

class GetTextContentUseCase {
    @Injected private var apiRepo: ApiRepo
    
    func invoke(id: String) -> AnyPublisher<TextContentDto, Error> {
        apiRepo.getTextContent(id: id).eraseToAnyPublisher()
    }
}
