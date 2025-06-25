//
//  ZakatItem.swift
//  muslimbd
//
//  Created by Al Faruk on 22/1/25.
//

import SwiftUI

struct ZakatItem: View {
    let title: String
    let amount: Binding<String>
    
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        HStack {
            Text(title).frame(width: width * 0.33, alignment: .leading)
            
            HStack{
                Spacer().frame(width: 10)
                Text("৳").foregroundColor(Color.primary)
                TextField("", text: amount).keyboardType(.numberPad).padding(.vertical, 5)
            }.overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.grayLight))
            
        }.padding(.horizontal, 10).padding(.vertical, 5).background(Color.white)
    }
}


