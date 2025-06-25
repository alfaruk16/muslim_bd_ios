//
//  CancelDto.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

import Foundation

struct CancelDto : Codable {
    internal init(response: String) {
        self.response = response
    }
    
    let response: String
}
