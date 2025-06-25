//
//  ShowMoreButton.swift
//  muslimbd
//
//  Created by Al Faruk on 30/12/24.
//
import SwiftUI

struct ShowMoreButton: View {
    let isShowMore: Bool
    let showMore: () -> Void
    
    var body: some View {
        Button(action: {
            showMore()
        }){
            HStack(spacing: 8){
                Text(isShowMore ? "Show more" : "Show less").fontWeight(.medium).font(.system(size: 14)).foregroundStyle(Color.primary)
                Image(systemName: isShowMore ? "chevron.down": "chevron.up").foregroundStyle(Color.primary)
            }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.backgroundDark, lineWidth: 1))
                .padding(.horizontal, 12)
                
        }
    }
}

#Preview {
    ShowMoreButton(isShowMore: true, showMore: {})
}
