//
//  PrayerLearnig.swift
//  muslimbd
//
//  Created by Al Faruk on 26/1/25.
//

import SwiftUI

struct PrayerLearnig: View {
    let category: CategoryDtoItem
    
    var body: some View {
        VStack{
            ForwardButton(category: category)
            HStack{
                NavigationLink(destination: CategoryScreen(category: CategoryDtoItem(name: AppConstants.prayerLearning, id: AppConstants.malePrayerId, icon: .prayerLearning, selectedTab: 0)), label: {
                    Image(.prayerMen).resizable().clipShape(RoundedRectangle(cornerRadius: 10)).padding(.horizontal, 2).scaledToFit().clipped().shadow(radius: 2)
                })
                NavigationLink(destination: CategoryScreen(category: CategoryDtoItem(name: AppConstants.prayerLearning, id: AppConstants.femalePrayerId, icon: .prayerLearning, selectedTab: 1)), label: {
                    Image(.prayerWomen).resizable().clipShape(RoundedRectangle(cornerRadius: 10)).padding(.horizontal, 2).scaledToFit().clipped().shadow(radius: 2)
                })
            }.padding(.horizontal, 10)
        }
        
    }
}

#Preview{
    PrayerLearnig(category: CategoryDtoItem())
}
