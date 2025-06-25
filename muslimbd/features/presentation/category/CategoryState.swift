//
//  CategoryState.swift
//  muslimbd
//
//  Created by Al Faruk on 12/1/25.
//

struct CategoryState {
    internal init(isLoading: Bool = true, categoryContents: CategoryContentsDto = CategoryContentsDto(), imageContents: ImageContentsDto = ImageContentsDto(), currentBook: TextContentDtoItem = TextContentDtoItem(), currentContent: TextContentDtoItem = TextContentDtoItem(), arabicFontSize: Int = 24, textFontSize: Int = 20, selectedTab: Int = -1, malePrayer: CategoryContentsDto = CategoryContentsDto(), femalePrayer: CategoryContentsDto = CategoryContentsDto(), currentTrack: TracksDtoItem = TracksDtoItem(), videoType: String = "") {
        self.isLoading = isLoading
        self.categoryContents = categoryContents
        self.imageContents = imageContents
        self.currentBook = currentBook
        self.currentContent = currentContent
        self.arabicFontSize = arabicFontSize
        self.textFontSize = textFontSize
        self.selectedTab = selectedTab
        self.malePrayer = malePrayer
        self.femalePrayer = femalePrayer
        self.currentTrack = currentTrack
        self.videoType = videoType
    }
    
    let isLoading: Bool
    let categoryContents: CategoryContentsDto
    let imageContents: ImageContentsDto
    let currentBook: TextContentDtoItem
    let currentContent: TextContentDtoItem
    let arabicFontSize: Int
    let textFontSize: Int
    let selectedTab: Int
    let malePrayer: CategoryContentsDto
    let femalePrayer: CategoryContentsDto
    let currentTrack: TracksDtoItem
    let videoType: String
}

extension CategoryState {
    func copy(isLoading: Bool? = nil,
                  categoryContents: CategoryContentsDto? = nil,
                  imageContents: ImageContentsDto? = nil,
                  currentBook: TextContentDtoItem? = nil,
                  currentContent: TextContentDtoItem? = nil,
                  arabicFontSize: Int? = nil,
                  textFontSize: Int? = nil,
                  selectedTab: Int? = nil,
                  malePrayer: CategoryContentsDto? = nil,
                  femalePrayer: CategoryContentsDto? = nil,
                  currentTrack: TracksDtoItem? = nil,
                  videoType: String? = nil) -> CategoryState {
        return CategoryState(
            isLoading: isLoading ?? self.isLoading,
            categoryContents: categoryContents ?? self.categoryContents,
            imageContents: imageContents ?? self.imageContents,
            currentBook: currentBook ?? self.currentBook,
            currentContent: currentContent ?? self.currentContent,
            arabicFontSize: arabicFontSize ?? self.arabicFontSize,
            textFontSize: textFontSize ?? self.textFontSize,
            selectedTab: selectedTab ?? self.selectedTab,
            malePrayer: malePrayer ?? self.malePrayer,
            femalePrayer: femalePrayer ?? self.femalePrayer,
            currentTrack: currentTrack ?? self.currentTrack,
            videoType: videoType ?? self.videoType
        )
    }
}


