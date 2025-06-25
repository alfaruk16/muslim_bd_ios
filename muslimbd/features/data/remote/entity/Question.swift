//
//  Question.swift
//  muslimbd
//
//  Created by Al Faruk on 31/12/24.
//

struct Question: Encodable {
    let AppLanguage: String = "bn"
    let AppTypes: String = "mb"
    let Question: String
    let IsPrivate: Bool
}
