//
//  IslamicNameTab.swift
//  muslimbd
//
//  Created by Al Faruk on 28/1/25.
//

import SwiftUI

struct IslamicNameTab: View {
    var selectedTab: Int = 0
    var tabChanged: (Int) -> ()
    let prayerTypes: [String] = [AppConstants.boy, AppConstants.girl]
    let prayerImage: [ImageResource] = [.boySmall, .girlSmall]
    
    var body: some View {
        HStack(alignment: .center){
            ForEach(0..<prayerTypes.count, id: \.self) { index in
                Button (action: {
                    tabChanged(index)
                }){
                    HStack{
                        Image(prayerImage[index]).resizable().frame(width: 20, height: 20).clipShape(Circle())
                        Spacer().frame(width: 10)
                        Text(prayerTypes[index])
                            .font(.headline)
                            .foregroundColor(selectedTab == index ? Color.primary : Color.gray)
                    }.padding(5)
                        .frame(maxWidth: .infinity)
                        .background(selectedTab == index ? Color.white : Color.backgroundColor)
                }
            }
        }.background(.white).cornerRadius(20)
    }
}

#Preview {
    IslamicNameTab(selectedTab: 0, tabChanged: {_ in })
}
