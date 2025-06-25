//
//  AutoScroller.swift
//  muslimbd
//
//  Created by Al Faruk on 9/1/25.
//

import SwiftUI

struct HomeBanners: View {
    let banners: [CategoryDtoItem]
    let prayer: Prayer
    let location: String
    
    @State private var selectedIndex: Int = 5
    let width = UIScreen.main.bounds.size.width
    
    var body: some View {
        VStack{
            TabView (selection: $selectedIndex){
                ForEach(0..<banners.count, id: \.self){ i in
                    if(i != 5){
                        NavigationLink(destination: {
                            switch(banners[i].id){
                            case AppConstants.islamicNameId: IslamicNamesScreen(category: banners[i])
                            case AppConstants.tasbeehId: TashbeehScreen(category: banners[i])
                            case AppConstants.allahNamesId: AllahNamesScreen(category: banners[i])
                            case AppConstants.alQuranId: AlQuranScreen(category: banners[i])
                            default: CategoryScreen(category: banners[i])
                            }
                        }, label: {
                            Image(banners[i].image ?? .prayerTime1).resizable().frame(width: width, height: width * 0.5).padding(.vertical, 10).padding(.horizontal, 5)
                        })
                        
                    }else{
                        PrayerTimes(prayer: prayer, location: location)
                    }
                }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)).frame(width: width, height: width * 0.5)
            
            HStack {
                ForEach(0..<banners.count, id: \.self){ index in
                    Capsule().fill(Color.primary.opacity(selectedIndex == index ? 1 : 0.33)).frame(width: selectedIndex == index ? 16 : 8, height: 8)
                        .onTapGesture {
                            selectedIndex = index
                        }
                }
            }
        }
//        .onReceive(timer) { _ in
//            withAnimation(.default) {
//                selectedIndex = (selectedIndex + 1) % banners.count
//            }
//        }
    }
}
