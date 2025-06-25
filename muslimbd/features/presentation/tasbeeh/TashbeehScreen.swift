//
//  TashbeehScreen.swift
//  muslimbd
//
//  Created by Al Faruk on 19/1/25.
//

import SwiftUI

struct TashbeehScreen: View {
    let category: CategoryDtoItem
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewmodel = TashbeehViewModel()
    
    let width = UIScreen.main.bounds.width / 1.75
    
    var body: some View {
        let state = viewmodel.state
        
        NavigationStack {
            
            VStack{
                
                ScrollView{
                    LazyVStack{
                        Spacer().frame(height: 20)
                        
                        Tasbeeh(count: Float(state.count), tashbeeh: Float(state.tasbeeh))
                        
                        Spacer().frame(height: 50)
                        
                        TashbeehTypes(selected: state.selectedTasbeeh, change: { it in
                            viewmodel.changeTasbeeh(tashbeeh: it)
                        })
                        
                        Spacer().frame(height: 50)
                        
                        ScrollView (.horizontal){
                            LazyHStack {
                                ForEach(state.dhikrs.indices, id: \.self){ index in
                                    DhikrItem(dhikr: state.dhikrs[index], selectedDhikr: state.selectedDhikr, changeDhikr: { id in
                                        viewmodel.changeDhikr(id: id) }, index: index)
                                }
                            }.padding(.horizontal, 10)
                        }
                    }
                    
                }.background(Color.backgroundColor).frame(maxHeight: .infinity, alignment: .top)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement: .principal) {
                            AppBar(title: category.name ?? "", icon: category.icon, image: (category.contentBaseURL ?? "") + (category.imageURL ?? ""), dismiss: { dismiss() })
                        }
                    }
                
                HStack(alignment: .center) {
                    Image(.tasbeehAdd).resizable().frame(width: 60, height: 60)
                }
                .padding(5)
                .background(Color.white).onTapGesture {
                    viewmodel.increateCount()
                }
            }
            
        }.navigationBarBackButtonHidden(true)
        
    }
}


#Preview {
    TashbeehScreen(category: CategoryDtoItem(name: "Tashbeeh", icon: .home))
}
