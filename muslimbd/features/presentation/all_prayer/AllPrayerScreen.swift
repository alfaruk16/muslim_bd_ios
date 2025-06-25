//
//  CategoryScreen.swift
//  muslimbd
//
//  Created by Al Faruk on 12/1/25.
//

import SwiftUI

struct AllPrayerScreen: View {
    let category: CategoryDtoItem
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewmodel = AllPrayerViewModel()
    
    @State private var selectedIndex: Int = 0
    let width = UIScreen.main.bounds.size.width
    
    var body: some View {
        let state = viewmodel.state
        
        NavigationStack {
            
            ZStack (alignment: .top){
                
                ScrollView{
                    LazyVStack{
                        
                        TabView (selection: $selectedIndex){
                            ForEach(0..<state.prayerTime.count, id: \.self){ i in
                                let prayer = state.prayerTime[i]
                                PrayerTimes(prayer: prayer, location: state.city.placeName ?? "", isNavToAll: false)
                            }
                        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)).frame(width: width, height: width * 0.5)
                        
                        HStack {
                            ForEach(0..<state.prayerTime.count, id: \.self){ index in
                                Capsule().fill(Color.primary.opacity(selectedIndex == index ? 1 : 0.33)).frame(width: selectedIndex == index ? 16 : 8, height: 8)
                                    .onTapGesture {
                                        selectedIndex = index
                                    }
                            }
                        }
                        Spacer().frame(height: 20)
                        
                        ForEach(state.prayerTime, id: \.id){ prayer in
                            
                            HStack{
                                Image(.prayerLearning).resizable().frame(width: 20, height: 20)
                                Text(prayer.prayerName ?? "").foregroundColor(Color.gray).font(.system(size: 16))
                                Spacer()
                                Text(prayer.time ?? "").foregroundColor(Color.gray).font(.system(size: 16))
                                Image(systemName: "bell.fill")
                                    .foregroundColor(Color.grayLight)
                                            .frame(width: 20, height: 20)
                            }.padding(12)
                                .background(prayer.nowTime.isEmpty ? .white : Color.backgroundDark)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .overlay(RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.grayLightExtra)).padding(.horizontal, 10)
                        }
                        
                                                
                        VStack{
                            ForEach(state.otherTimes, id: \.id){ prayer in
                                HStack{
//                                    Image(.prayerLearning).resizable().frame(width: 20, height: 20).foregroundColor(.white)
                                    Text(prayer.prayerName ?? "").foregroundColor(Color.white).font(.system(size: 16))
                                    Spacer()
                                    Text(prayer.time ?? "").foregroundColor(Color.white).font(.system(size: 16))
                                    Image(systemName: "bell.fill")
                                        .foregroundColor(Color.white)
                                        .frame(width: 20, height: 20)
                                }
                            }
                        }.padding(12).background(Color.primary).clipShape(RoundedRectangle(cornerRadius: 8)).padding(10)
                    }
                    
                }
                
            }.background(Color.backgroundColor).frame(maxHeight: .infinity, alignment: .top)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .principal) {
                        AppBar(title: category.name ?? "", icon: category.icon, image: (category.contentBaseURL ?? "") + (category.imageURL ?? ""), dismiss: { dismiss() })
                    }
                }
        }.navigationBarBackButtonHidden(true)
            .onAppear(perform: {
                viewmodel.initiate(category: category)
            })
        
    }
}


#Preview {
    AllPrayerScreen(category: CategoryDtoItem(name: "Category", icon: .home))
}
