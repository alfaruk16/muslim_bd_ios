//
//  Name.swift
//  muslimbd
//
//  Created by Al Faruk on 28/1/25.
//

import SwiftUI

struct Name: View {
    let name: IslamicNamesDtoItem
    let index: Int
    
    var body: some View {
        HStack(){
            ZStack{
                Image(.allahNameSequence).resizable().frame(width: 36, height: 36)
                Text(String(index + 1)).foregroundColor(Color.primary).fontWeight(.medium)
            }
            Spacer().frame(width: 12)
            
            VStack(alignment: .leading){
                Text(name.name ?? "").font(.system(size: 16)).fontWeight(.medium).foregroundColor(Color.gray).fontWeight(.medium)
                Spacer().frame(height: 2)
                Text(name.meaning ?? "").foregroundColor(Color.gray).lineLimit(1)
            }
            
            Spacer().frame(width: 10)
            Spacer()
        }.frame(maxWidth: .infinity).padding(.horizontal, 12).padding(.vertical, 10).background(Color.backgroundDark).cornerRadius(8)
    }
}

#Preview {
    Name(name: IslamicNamesDtoItem(), index: 0)
}
