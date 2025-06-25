//
//  ZakatCalculatorViewModel.swift
//  muslimbd
//
//  Created by Al Faruk on 22/1/25.
//

import Foundation

class ZakatCalculatorViewModel: ObservableObject {
    
    @Published var state: ZakatCalculatorState = ZakatCalculatorState()
    
    func calculate(nagadTaka: String, bankTaka: String, shornoTaka: String, rupaTaka: String, shareBazarTaka: String, onnannoBiniog: String, bashaVara: String, shompotti: String, nagadBabsha: String, ponno: String, pension: String, paribarikRin: String, onnannoMuldhon: String, krishi: String, creditCard: String, gariPayment: String, babshaPayment: String, familyRin: String, onnannoRin: String) {
        
        let total = addAll(items: [nagadTaka, bankTaka, shornoTaka, rupaTaka, shareBazarTaka, onnannoBiniog, bashaVara, shompotti, nagadBabsha, ponno, pension, paribarikRin, onnannoMuldhon, krishi]) - addAll(items: [creditCard, gariPayment, babshaPayment, familyRin, onnannoRin])
        
        let zakat = total * 2.5 / 100
        
        state = state.copy(total: String(total), zakat: String(zakat))
    }
    
    private func addAll(items: [String]) -> Double {
        var sum: Double = 0.0
        for num in items {
            sum += Double(num) ?? 0
        }
        return sum
    }
}
