//
//  ContentDtoData.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct ContentDtoData : Codable {
    internal init(about: String? = nil, contentBaseUrl: String? = nil, items: [ContentDtoItem]? = nil, order: Int? = nil, patchId: String? = nil, patchImageUrl: String? = nil, patchName: String? = nil, patchViewType: String? = nil) {
        self.about = about
        self.contentBaseUrl = contentBaseUrl
        self.items = items
        self.order = order
        self.patchId = patchId
        self.patchImageUrl = patchImageUrl
        self.patchName = patchName
        self.patchViewType = patchViewType
    }
    
    let about: String?
    let contentBaseUrl: String?
    let items: [ContentDtoItem]?
    let order: Int?
    let patchId: String?
    let patchImageUrl: String?
    let patchName: String?
    let patchViewType: String?
}
