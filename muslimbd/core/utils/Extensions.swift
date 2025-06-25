//
//  Extensions.swift
//  muslimbd
//
//  Created by Al Faruk on 9/1/25.
//

import Foundation

extension Date {
    var day: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter.string(from: self)
    }
    
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
    
    var date: String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        return dateformatter.string(from: self)
    }
}
