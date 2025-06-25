//
//  ContentDetails.swift
//  muslimbd
//
//  Created by Al Faruk on 14/1/25.
//

import SwiftUI

struct ContentDetails: View {
    let content: TextContentDtoItem
    
    var body: some View {
        VStack{
            if (content.billBoardImageUrl != nil && (content.category == AppConstants.prayerLearningId || content.category == AppConstants.malePrayerId || content.category == AppConstants.femalePrayerId)){
                AsyncImage(url: URL(string: (content.contentBaseUrl ?? "") + (content.billBoardImageUrl ?? ""))) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    
                }
            }

            Text(content.text ?? "").foregroundStyle(Color.gray).padding(.horizontal, 15).padding(.bottom, 5)
            
            if (content.billBoardImageUrl != nil && content.category != AppConstants.prayerLearningId && content.category != AppConstants.malePrayerId && content.category != AppConstants.femalePrayerId){
                AsyncImage(url: URL(string: (content.contentBaseUrl ?? "") + (content.billBoardImageUrl ?? ""))) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    
                }
            }

            
            if(content.textInArabic != nil){
                Text(content.textInArabic ?? "").foregroundStyle(Color.gray).fontWeight(.medium).padding(.horizontal, 15).padding(.bottom, 5)
            }
            
            if(content.pronunciation != nil){
                Text(content.pronunciation ?? "").foregroundStyle(Color.gray).fontWeight(.medium).padding(.horizontal, 15).padding(.bottom, 5)
            }
            
            if(content.address != nil){
                Text(content.address ?? "").foregroundStyle(Color.gray).padding(.horizontal, 15).padding(.bottom, 5)
            }
            
            if(content.refUrl != nil){
                Text(content.refUrl ?? "").foregroundStyle(Color.grayLight).padding(.horizontal, 15).padding(.bottom, 5)
            }
        }
    }
}

#Preview {
    ContentDetails(content: TextContentDtoItem())
}
