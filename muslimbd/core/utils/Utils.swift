//
//  Utils.swift
//  muslimbd
//
//  Created by Al Faruk on 27/1/25.
//
import Foundation

private let bengaliNumbers: [Character : String] = ["1" : "১", "2" : "২", "3" : "৩", "4" : "৪", "5" : "৫",
                                                    "6" : "৬", "7" : "৭", "8" : "৮", "9" : "৯", "0" : "০"]

func englishToBengaliNumber(number: String) -> String {
    var bengali = ""
    
    for ch in number {
        bengali += bengaliNumbers[ch] ?? ""
    }
    
    return bengali
}
