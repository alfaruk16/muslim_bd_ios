//
//  ArtistDto.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct ArtistDto : Codable {
    internal init(data: [ArtistDtoItem]? = nil, error: String? = nil, message: String? = nil, status: Int? = nil, totalPage: Int? = nil, totalRecords: Int? = nil) {
        self.data = data
        self.error = error
        self.message = message
        self.status = status
        self.totalPage = totalPage
        self.totalRecords = totalRecords
    }
    
    let data: [ArtistDtoItem]?
    let error: String?
    let message: String?
    let status: Int?
    let totalPage: Int?
    let totalRecords: Int?
}

extension ArtistDto {
    func copy(data: [ArtistDtoItem]? = nil, error: String? = nil, message: String? = nil, status: Int? = nil, totalPage: Int? = nil, totalRecord: Int? = nil) -> ArtistDto {
        ArtistDto(data: data ?? self.data, error: error ?? self.error, message: message ?? self.message, status: status ?? self.status, totalPage: totalPage ?? self.totalPage, totalRecords: self.totalRecords)
    }
}
