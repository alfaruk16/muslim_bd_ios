//
//  PromotionsDto.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct PromotionsDto : Codable {
    internal init(data: [PromotionsDtoItem]? = nil, error: String? = nil, message: String? = nil, status: Int? = nil, totalPage: Int? = nil, totalRecords: Int? = nil) {
        self.data = data
        self.error = error
        self.message = message
        self.status = status
        self.totalPage = totalPage
        self.totalRecords = totalRecords
    }
    
    let data: [PromotionsDtoItem]?
    let error: String?
    let message: String?
    let status: Int?
    let totalPage: Int?
    let totalRecords: Int?
}

extension PromotionsDto {
    func copy(
            data: [PromotionsDtoItem]? = nil,
            error: String? = nil,
            message: String? = nil,
            status: Int? = nil,
            totalPage: Int? = nil,
            totalRecords: Int? = nil
        ) -> PromotionsDto {
            return PromotionsDto(
                data: data ?? self.data,
                error: error ?? self.error,
                message: message ?? self.message,
                status: status ?? self.status,
                totalPage: totalPage ?? self.totalPage,
                totalRecords: totalRecords ?? self.totalRecords
            )
        }
}
