//
//  Sizes.swift
//  muslimbd
//
//  Created by Al Faruk on 25/1/25.
//

let seventyTwo = "72"
let hundredNinetyTwo = "192"
let twoHundredTen = "210"
let threeHundred = "300"
let fourHundred = "400"
let twelveHundred = "1280"

func replaceSize(url: String, replaceWith: String) -> String {
    
    return url.replacingOccurrences(of: "<$size$>", with: replaceWith).replacingOccurrences(of: "\\", with: "/")
}
