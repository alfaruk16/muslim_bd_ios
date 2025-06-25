//
//  PrayerTimes.swift
//  muslimbd
//
//  Created by Al Faruk on 9/1/25.
//

import SwiftUI

struct PrayerTimes: View {
    internal init(prayer: Prayer, location: String, isNavToAll: Bool = true) {
        self.prayer = prayer
        self.location = location
        self.isNavToAll = isNavToAll
    }
    
    let prayer: Prayer
    let location: String
    let isNavToAll: Bool
    
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        
        ZStack (alignment: .leading){
            Image(prayer.image ?? .prayerTime1).resizable()
            
            VStack(alignment: .leading) {
                
                HStack (alignment: .firstTextBaseline){
                    
                    VStack (alignment: .leading){
                        Text(prayer.nowTime).foregroundStyle(.white)
                        if(prayer.prayerName != nil){
                            Text(prayer.prayerName ?? "").foregroundStyle(.white).font(.system(size: 20)).fontWeight(.medium)
                        }
                        if(prayer.time != nil){
                            Text(prayer.time ?? "").foregroundStyle(.white)
                        }
                    }
                    
                    Spacer()
                    Text(location).foregroundStyle(.white).fontWeight(.medium)
                    Spacer()
                    
                    VStack (alignment: .listRowSeparatorTrailing){
                        Text(Language.next_prayer).foregroundStyle(.white)
                        if(prayer.prayerName != nil){
                            Text(prayer.nextPrayerName ?? "").foregroundStyle(.white).font(.system(size: 20)).fontWeight(.medium)
                        }
                        if(prayer.time != nil){
                            Text(prayer.nextPrayerTime ?? "").foregroundStyle(.white)
                        }
                    }
                    
                }.padding(10).frame(maxWidth: .infinity).background(Color.ramadanColor.opacity(0.75))
                Spacer()
                
                VStack {
                    HStack {
                        Text(Language.sehri_last_time).foregroundStyle(.white)
                        Spacer()
                        Text(prayer.sehri ?? "").foregroundStyle(.white)
                        
                    }
                    HStack {
                        Text(Language.iftar).foregroundStyle(.white)
                        Spacer()
                        Text(prayer.iftar ?? "").foregroundStyle(.white)
                        
                    }
                    if(isNavToAll){
                        NavigationLink(destination: AllPrayerScreen(category: CategoryDtoItem(name: "Prayer Times", icon: .prayerLearning)), label: {
                            Text(Language.all_prayer_times).foregroundStyle(Color.amberColor)
                        })
                    }
                }.frame(maxWidth: .infinity).padding(10).background(Color.ramadanColor.opacity(0.75))
                
            }.frame(height: width * 0.5)
        }.frame(width: width, height: width * 0.5)
    }
}


#Preview {
    PrayerTimes(prayer: Prayer(nowTime: "now time", prayerName: "Fazr", time: "05:00", image: .prayerTime1, nextPrayerName: "Duhr", nextPrayerTime: "05:00", isFinished: false, sehri: "06:00", iftar: "06:00"), location: "Dhaka")
}
