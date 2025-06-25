//
//  DhikrItem.swift
//  muslimbd
//
//  Created by Al Faruk on 19/1/25.
//

import SwiftUI

struct DhikrItem: View {
    let dhikr: Dhikr
    let selectedDhikr: Int
    let changeDhikr: (Int) -> Void
    let index: Int
    
    let width = UIScreen.main.bounds.width * 0.75
    
    var body: some View {
        ZStack(){
            VStack(alignment: .leading){
                Text(dhikr.name)
                    .foregroundColor(Color.primary)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(style: StrokeStyle(lineWidth: 1))).foregroundColor(Color.gray)
                
                Spacer().frame(height: 10)
                
                Text(dhikr.arabic).font(.system(size: 18)).fontWeight(.bold).foregroundColor(Color.primary).multilineTextAlignment(.trailing)
                
                Spacer().frame(height: 5)
                
                Text(dhikr.dhikr).foregroundColor(Color.gray)
                
                Spacer().frame(height: 5)
                
                Text(dhikr.meaning).foregroundColor(Color.grayLight)
                
            }.padding(12).frame(maxWidth: .infinity).background(RoundedRectangle(cornerRadius: 10).stroke(selectedDhikr == dhikr.id ? Color.primary : .clear, lineWidth: 2)).background(
                LinearGradient(gradient: Gradient(colors: [index % 2 == 0 ? Color.textGradientColor2 : Color.textGradientColor, .white]), startPoint: .top, endPoint: .bottom).cornerRadius(10)
            )
        }.padding(2).frame(width: width).onTapGesture {
            changeDhikr(dhikr.id)
        }
    }
}

#Preview {
    DhikrItem(dhikr: Dhikr(id: 1, name: "Name", arabic: "Arabic", dhikr: "Dhikr", meaning: "Meaning"), selectedDhikr: 1, changeDhikr: {_ in}, index: 0)
}
