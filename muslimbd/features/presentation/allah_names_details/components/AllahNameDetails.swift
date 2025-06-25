//
//  AllahNameDetails.swift
//  muslimbd
//
//  Created by Al Faruk on 16/1/25.
//

import SwiftUI

struct AllahNameDetails: View {
    let allahName: AllahNamesDtoItem
    
    var body: some View {
        VStack{
            VStack{
                Text((String(allahName.sequenceNo ?? 0) + " of 99")).foregroundStyle(Color.gray)
                Text(allahName.name ?? "").foregroundStyle(Color.primary).foregroundStyle(Color.primary).fontWeight(.bold).font(.system(size: 23))
                Spacer().frame(height: 30)
                ZStack{
                    Image(.oval).resizable().frame(width: 200, height: 200)
                    if(allahName.id == "1"){
                        Image(.allahText).resizable().frame(width: 50, height: 50)
                    }else{
                        Text(allahName.arabic ?? "").foregroundStyle(.white).font(.system(size: 40)).fontWeight(.medium)
                    }
                }
            }.frame(maxWidth: .infinity).padding(.vertical, 20).background(
                LinearGradient(gradient: Gradient(colors: [.gradientColor2, .gradientColor1]), startPoint: .top, endPoint: .bottom).cornerRadius(15).padding(.horizontal, 20)
            )
            Spacer().frame(height: 30)
            
            VStack(alignment: .leading){
                Text(Language.meaning).foregroundStyle(Color.grayLight).padding(.bottom, 4)
                Text(allahName.meaning ?? "").foregroundStyle(Color.primary).font(.system(size: 20)).fontWeight(.medium).padding(.bottom, 4)
                Text(allahName.fazilat ?? "").foregroundStyle(Color.grayLight).font(.system(size: 20))
            }.frame(maxWidth: .infinity).padding(20).background(.white).cornerRadius(15).padding(.horizontal, 20)
                
        
        }
    }
}

#Preview {
    AllahNameDetails(allahName: AllahNamesDtoItem(about: "", appLanguage: "", arabic: "arabic", contentBaseUrl: "", contentUrl: "", createdBy: "", createdOn: "", fazilat: "Fazilat", id: "1", imageUrl: "", isActive: true, meaning: "Meaning", name: "name", sequenceNo: 1, updatedBy: "", updatedOn: ""))
}
