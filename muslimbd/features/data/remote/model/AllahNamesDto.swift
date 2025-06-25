//
//  AllahNamesDto.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

struct AllahNamesDto : Codable {
    internal init(data: [AllahNamesDtoItem]? = nil, error: String? = nil, message: String? = nil, status: Int? = nil, totalPage: Int? = nil, totalRecords: Int? = nil) {
        self.data = data
        self.error = error
        self.message = message
        self.status = status
        self.totalPage = totalPage
        self.totalRecords = totalRecords
    }
    
    let data: [AllahNamesDtoItem]?
    let error: String?
    let message: String?
    let status: Int?
    let totalPage: Int?
    let totalRecords: Int?
}
