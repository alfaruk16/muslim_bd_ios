//
//  BismillahView.swift
//  muslimbd
//
//  Created by Al Faruk on 13/1/25.
//

import SwiftUI

struct BismillahView: View {
    let width: CGFloat
    let icon: ImageResource
    let background: ImageResource? = nil
    
    var body: some View {
        ZStack {
            if (background != nil) {
                Image(background!).resizable()
            } else {
                Color.primary
                    .ignoresSafeArea()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: width)
        .overlay(
            VStack(alignment: .center, spacing: 10) {
                Spacer()
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 50).frame(height: 60)
                Text("Bismillahir Rahmanir Raheem")
                    .foregroundColor(Color.white.opacity(0.7))
                    .font(.system(size: 16))
                Text("বিসমিল্লাহির রহমানির রাহীম")
                    .foregroundColor(Color.white.opacity(0.7))
                    .font(.system(size: 16))
                
                Spacer()
            }
        ).clipShape(.rect(bottomLeadingRadius: 20, bottomTrailingRadius: 20))
    }
}

#Preview {
    BismillahView(width: UIScreen.main.bounds.width, icon: .bismillah)
}
