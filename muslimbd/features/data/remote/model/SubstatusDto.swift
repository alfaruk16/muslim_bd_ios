//
//  SubstatusDto.swift
//  muslimbd
//
//  Created by Al Faruk on 6/1/25.
//

struct SubstatusDto: Codable {
    internal init(status: Int? = nil, message: String? = nil, totalRecords: Int? = nil, totalPage: Int? = nil, data: SubStatusDtoItem? = nil, error: String? = nil) {
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
    let data: SubStatusDtoItem?
    let error: String?

    enum CodingKeys: String, CodingKey {
        case status
        case message
        case totalRecords
        case totalPage
        case data
        case error
    }
}
