//
//  AlbumTrackDto.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

struct AlbumTrackDto : Codable {
    internal init(data: [AlbumTrackDtoItem]? = nil, error: String? = nil, message: String? = nil, status: Int? = nil, totalPage: Int? = nil, totalRecords: Int? = nil) {
        self.data = data
        self.error = error
        self.message = message
        self.status = status
        self.totalPage = totalPage
        self.totalRecords = totalRecords
    }
    
    let data: [AlbumTrackDtoItem]?
    let error: String?
    let message: String?
    let status: Int?
    let totalPage: Int?
    let totalRecords: Int?
}

extension AlbumTrackDto {
    func copy(data: [AlbumTrackDtoItem]? = nil, error: String? = nil, message: String? = nil, status: Int? = nil, totalPage: Int? = nil, totalRecord: Int? = nil) -> AlbumTrackDto {
        AlbumTrackDto(data: data ?? self.data, error: error ?? self.error, message: message ?? self.message, status: status ?? self.status, totalPage: totalPage ?? self.totalPage, totalRecords: self.totalRecords)
    }
}
