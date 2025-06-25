//
//  AudioVideoTab.swift
//  muslimbd
//
//  Created by Al Faruk on 13/3/25.
//

import SwiftUI

struct AudioVideoTab: View {
    @Binding var selectedTab: Int
    var tabChanged: (Int) -> Void

    let list = [AppConstants.audio, AppConstants.video]

    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<list.count, id: \.self) { index in
                Button(action: {
                    self.selectedTab = index
                    self.tabChanged(index)
                }) {
                    Text(list[index])
                        .font(.system(size: 16))
                        .foregroundColor(selectedTab == index ? .white : Color.primary)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .frame(maxWidth: .infinity)
                        .background(selectedTab == index ? Color.primary : .white)
                        .cornerRadius(50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.primary, lineWidth: 0.5)
                        )
                }.frame(maxWidth: .infinity)
                .padding(.horizontal, 5)
                .background(Color.clear)
                .cornerRadius(25)
                
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
    }
}

#Preview {
    @Previewable @State var tab  = 0
    AudioVideoTab(selectedTab: $tab, tabChanged: {_ in})
}
