//
//  CategoryDto.swift
//  muslimbd
//
//  Created by Al Faruk on 9/12/24.
//

public struct CategoryDto: Codable {
    internal init(status: Int? = nil, message: String? = nil, totalRecords: Int? = nil, totalPage: Int? = nil, data: [CategoryDtoItem]? = nil, error: String? = nil) {
        self.status = status
        self.message = message
        self.totalRecords = totalRecords
        self.totalPage = totalPage
        self.data = data
        self.error = error
    }
    
    let status: Int?
    let message: String?
    let totalRecords: Int?
    let totalPage: Int?
    let data: [CategoryDtoItem]?
    let error: String?
}

extension CategoryDto {
    func copy(status: Int? = nil, message: String? = nil, totalRecords: Int? = nil, totalPage: Int? = nil, data: [CategoryDtoItem]? = nil, error: String? = nil) -> CategoryDto {
        CategoryDto(status: status ?? self.status, message: message ?? self.message, totalRecords: totalRecords ?? self.totalRecords, totalPage: totalPage ?? self.totalPage, data: data ?? self.data, error: error ?? self.error)
    }
}

