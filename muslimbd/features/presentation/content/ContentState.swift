//
//  ContentState.swift
//  muslimbd
//
//  Created by Al Faruk on 13/1/25.
//

import Foundation

struct ContentState {
    internal init(isLoading: Bool = false, category: CategoryDtoItem = CategoryDtoItem(), content: TextContentDto = TextContentDto(), arabicFontSize: Int = 24, textFontSize: Int = 20) {
        self.isLoading = isLoading
        self.category = category
        self.content = content
        self.arabicFontSize = arabicFontSize
        self.textFontSize = textFontSize
    }
    
    let isLoading: Bool
    let category: CategoryDtoItem
    let content: TextContentDto
    let arabicFontSize: Int
    let textFontSize: Int
}

extension ContentState {
    func copy(isLoading: Bool? = nil, category: CategoryDtoItem? = nil, content: TextContentDto? = nil, arabicFontSize: Int? = nil, textFontSize: Int? = nil) -> ContentState {
        return ContentState(
            isLoading: isLoading ?? self.isLoading,
            category: category ?? self.category,
            content: content ?? self.content,
            arabicFontSize: arabicFontSize ?? self.arabicFontSize,
            textFontSize: textFontSize ?? self.textFontSize
        )
    }
}
