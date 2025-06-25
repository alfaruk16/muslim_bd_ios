//
//  PrayerLearning.swift
//  muslimbd
//
//  Created by Al Faruk on 19/1/25.
//

import SwiftUI

struct PrayerLearningTabs: View {
    var selectedTab: Int = 0
    var tabChanged: (Int) -> ()
    let prayerTypes: [String] = [AppConstants.malePrayer, AppConstants.femalePrayer]
    let prayerImage: [ImageResource] = [.malePrayerIcon, .femalePrayerIcon]
    
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
    PrayerLearningTabs(selectedTab: 0, tabChanged: {_ in })
}
