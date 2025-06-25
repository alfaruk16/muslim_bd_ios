//
//  BilboardBanners.swift
//  muslimbd
//
//  Created by Al Faruk on 6/3/25.
//

import SwiftUI

struct BillboardBanners: View {
    let banners: TrackBillboardDto
    let onTap: (TrackBillboardDtoItem) -> Void
    
    @State private var selectedIndex: Int = 0
    let timer = Timer.publish(every: 5.0, on: .main, in: .common).autoconnect()
    
    let width = UIScreen.main.bounds.size.width
    
    var body: some View {
        VStack{
            TabView (selection: $selectedIndex){
                ForEach(0..<(banners.data?.count ?? 0), id: \.self){ i in
                    let item = banners.data?[i] ?? TrackBillboardDtoItem()
                    
                    AsyncImage(url: URL(string: (item.contentBaseUrl ?? "") + replaceSize(url: (item.imageUrl ?? ""), replaceWith: fourHundred))){
                        image in
                        image.resizable().frame(width: width, height: width * 9 / 16).onTapGesture(perform: {
                            onTap(item)
                        })
                    } placeholder: {
                        ProgressView()
                    }
                    
                }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)).frame(width: width, height: width * 0.5)
            
            HStack {
                ForEach(0..<(banners.data?.count ?? 0), id: \.self){ index in
                    Capsule().fill(Color.primary.opacity(selectedIndex == index ? 1 : 0.33)).frame(width: selectedIndex == index ? 16 : 8, height: 8)
                        .onTapGesture {
                            selectedIndex = index
                        }
                }
            }
        }
        .onReceive(timer) { _ in
            withAnimation(.default) {
                selectedIndex = (selectedIndex + 1) % (banners.data?.count ?? 0)
            }
        }
    }
}
