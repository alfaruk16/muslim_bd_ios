//
//  TashbeehViewModel.swift
//  muslimbd
//
//  Created by Al Faruk on 19/1/25.
//

import Foundation


class TashbeehViewModel: ObservableObject {
    
    @Published var state: TasbeehState = TasbeehState()
    
    func increateCount() {
        if(state.count < state.tasbeeh) {
            state = state.copy(count: state.count + 1)
        }
    }
    
    func reset() {
        state = state.copy(count: 0)
    }
    
    func changeTasbeeh(tashbeeh: String) {
        reset()
        state = state.copy(tasbeeh: tashbeeh == Language.ninetyNineTimes ? 99 : tashbeeh == Language.thirtyFourTimes ? 34 : 33, selectedTasbeeh: tashbeeh)
    }
    
    func changeDhikr(id: Int) {
        reset()
        state = state.copy(selectedDhikr: id)
        if(id == 3){
            changeTasbeeh(tashbeeh: Language.thirtyFourTimes)
        }else{
            changeTasbeeh(tashbeeh: Language.thirtyThreeTimes)
        }
    }
}
