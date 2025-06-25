//
//  ZakatCalculatorState.swift
//  muslimbd
//
//  Created by Al Faruk on 22/1/25.
//

struct ZakatCalculatorState {
    internal init(isLoading: Bool = false, total: String = "", zakat: String = "") {
        self.isLoading = isLoading
        self.total = total
        self.zakat = zakat
    }
    
    let isLoading: Bool
    let total: String
    let zakat: String
}

extension ZakatCalculatorState {
    func copy(
        isLoading: Bool? = nil,
        total: String? = nil,
        zakat: String? = nil
    ) -> ZakatCalculatorState {
        return ZakatCalculatorState(
            isLoading: isLoading ?? self.isLoading,
            total: total ?? self.total,
            zakat: zakat ?? self.zakat
        )
    }
}
