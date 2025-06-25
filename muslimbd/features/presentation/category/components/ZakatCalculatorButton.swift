//
//  ZakatCalculatorButton.swift
//  muslimbd
//
//  Created by Al Faruk on 22/1/25.
//

import SwiftUI

struct ZakatCalculatorButton: View {
    var body: some View {
        HStack{
            Image(.zakat).resizable().frame(width: 24, height: 24)
            Spacer().frame(width: 12)
            Text(Language.zakat_calculator).font(.system(size: 20)).lineLimit(1).foregroundStyle(Color.gray)
            Spacer()
            Image(systemName: "chevron.right").resizable().frame(width: 16, height: 16).foregroundStyle(Color.gray)
        }.padding(15).background(Color.backgroundDark).cornerRadius(8).padding(.horizontal, 10)
    }
}
