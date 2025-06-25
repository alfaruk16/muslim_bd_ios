//
//  TashbeehTypes.swift
//  muslimbd
//
//  Created by Al Faruk on 19/1/25.
//

import SwiftUI

struct TashbeehTypes: View {
    let selected: String
    let change: (String) -> Void
    
    let list = [Language.thirtyThreeTimes, Language.thirtyFourTimes, Language.ninetyNineTimes]
    
    var body: some View {
        HStack(spacing: 20) {
            ForEach(list.indices, id: \.self) { index in
                HStack{
                    Group {
                        if(list[index] == selected){
                            ZStack{
                                Circle().fill(Color.white).frame(width: 20, height: 20).overlay(Circle().stroke(Color.primary))
                                Circle().fill(Color.primary).frame(width: 15, height: 15)
                            }
                        }else{
                            Circle().fill(Color.white).frame(width: 20, height: 20).overlay(Circle().stroke(Color.gray))
                        }
                    }
                    Spacer().frame(width: 10)
                    Text(list[index])
                }.frame(maxWidth: .infinity).onTapGesture {
                    change(list[index])
                }
            }
        }
    }
}

#Preview {
    TashbeehTypes(selected: Language.thirtyThreeTimes, change: {_ in })
}
