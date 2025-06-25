//
//  CategoryViewModel.swift
//  muslimbd
//
//  Created by Al Faruk on 12/1/25.
//

import Foundation
import Combine
import Resolver
import UIKit

class AllPrayerViewModel: ObservableObject {
    @Injected private var getPrayerTimesMonthlyUseCase: GetPrayerTimesMonthlyUseCase
    @Injected private var getPrayerTimesByCitiesUseCase: GetPrayerTimesByCityUseCase
    
    
    private var cancelables = [AnyCancellable]()

    @Published var state: AllPrayerState = AllPrayerState()
    
    func initiate(category: CategoryDtoItem) {
        getCities()
        getPrayerTimes()
    }
    
    func getCities(){
        getPrayerTimesByCitiesUseCase.invoke().receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.state = self?.state.copy(isLoading: false, cityPrayerTimes: response) ?? AllPrayerState()
            }).store(in: &cancelables)
    }
    
    func getPrayerTimes() {
        getPrayerTimesMonthlyUseCase.invoke().receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                
                self?.state = self?.state.copy(isLoading: false, prayerTimes: response) ?? AllPrayerState()
                self?.preparePrayerTimes()
                
            }).store(in: &cancelables)
    }
    
    func preparePrayerTimes() {
        do {
            let now = Date()
            let dateMonth = now.day + "-" + now.month
            
            if(todaysPrayerTime(dateMonth: dateMonth)){
                var startDay = 0
                
                for date in 0..<(state.prayerTimes.data?.count ?? 0){
                    let today = state.prayerTimes.data?[date].date_month?.split(separator: "-")
                    if(today?[0] ?? "" == now.day && now.month.uppercased().starts(with: today?[1].uppercased() ?? "")){
                        startDay = date
                        break
                    }
                }
                
                for day in startDay...(startDay + 2){
                    let prayerTime = state.prayerTimes.data?[day]
                    let cityTime = state.city
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                    let timeFormatter = DateFormatter()
                    timeFormatter.dateFormat = "hh:mm a"
                    
                    let fazr = dateFormatter.date(from: Date().date + " " + (prayerTime?.fazr ?? ""))?.addingTimeInterval(cityTime.fazr ?? 0 * 60)
                    let sunrise = dateFormatter.date(from: Date().date + " " + (prayerTime?.sunrise ?? ""))?.addingTimeInterval(cityTime.sunrise ?? 0 * 60)
                    let juhr = dateFormatter.date(from: Date().date + " " + (prayerTime?.juhr ?? ""))?.addingTimeInterval(cityTime.johr ?? 0 * 60)
                    let asr = dateFormatter.date(from: Date().date + " " + (prayerTime?.asr ?? ""))?.addingTimeInterval(cityTime.asr ?? 0 * 60)
                    let magrib = dateFormatter.date(from: Date().date + " " + (prayerTime?.magrib ?? ""))?.addingTimeInterval(cityTime.magrib ?? 0 * 60)
                    let isha = dateFormatter.date(from: Date().date + " " + (prayerTime?.isha ?? ""))?.addingTimeInterval(cityTime.isha ?? 0 * 60)
                    let sehri = dateFormatter.date(from: Date().date + " " + (prayerTime?.sehri ?? ""))?.addingTimeInterval(cityTime.seheri ?? 0 * 60)
                    let tahajjut = dateFormatter.date(from: Date().date + " " + (prayerTime?.tahajjut ?? ""))?.addingTimeInterval(cityTime.tahajjud ?? 0 * 60)
                    let ishrak = dateFormatter.date(from: Date().date + " " + (prayerTime?.ishraq ?? ""))?.addingTimeInterval(cityTime.ishrak ?? 0 * 60)
                    
                    if(day == startDay){
                        let times = [Prayer(nowTime: nowTime(start: fazr, end: sunrise), prayerName: Language.fajr, time: timeFormatter.string(from: fazr ?? Date()), image: .prayerTime1, nextPrayerName: Language.dhuhr, nextPrayerTime: timeFormatter.string(from: juhr ?? Date()), sehri: timeFormatter.string(from: sehri ?? Date()), iftar: timeFormatter.string(from: magrib ?? Date())),
                                     Prayer(nowTime: nowTime(start: juhr, end: asr), prayerName: Language.dhuhr, time: timeFormatter.string(from: juhr ?? Date()), image: .prayerTime2, nextPrayerName: Language.asr, nextPrayerTime: timeFormatter.string(from: asr ?? Date()), sehri: timeFormatter.string(from: sehri ?? Date()), iftar: timeFormatter.string(from: magrib ?? Date())),
                                     Prayer(nowTime: nowTime(start: asr, end: magrib), prayerName: Language.asr, time: timeFormatter.string(from: asr ?? Date()), image: .prayerTime3, nextPrayerName: Language.maghrib, nextPrayerTime: timeFormatter.string(from: magrib ?? Date()), sehri: timeFormatter.string(from: sehri ?? Date()), iftar: timeFormatter.string(from: magrib ?? Date())),
                                     Prayer(nowTime: nowTime(start: magrib, end: isha), prayerName: Language.maghrib, time: timeFormatter.string(from: magrib ?? Date()), image: .prayerTime4, nextPrayerName: Language.maghrib, nextPrayerTime: timeFormatter.string(from: isha ?? Date()), sehri: timeFormatter.string(from: sehri ?? Date()), iftar: timeFormatter.string(from: magrib ?? Date())),
                                     Prayer(nowTime: nowTime(start: isha, end: dateFormatter.date(from: Date().date + " :23:59:59")), prayerName: Language.isha, time: timeFormatter.string(from: isha ?? Date()), image: .prayerTime5, nextPrayerName: Language.fajr, nextPrayerTime: timeFormatter.string(from: fazr ?? Date()), sehri: timeFormatter.string(from: sehri ?? Date()), iftar: timeFormatter.string(from: magrib ?? Date()))
                        ]
                        
                        var current = 0
                        for i in 0..<times.count {
                            if(!times[i].nowTime.isEmpty){
                                current = i
                            }
                        }
                        
                        let otherTimes = [Prayer(prayerName: Language.tahajjut, time: timeFormatter.string(from: tahajjut ?? Date())), Prayer(prayerName: Language.sunrise, time: timeFormatter.string(from: sunrise ?? Date())), Prayer(prayerName: Language.ishrak, time: timeFormatter.string(from: ishrak ?? Date()))]
                        
                        self.state = self.state.copy(prayerTime: times, otherTimes: otherTimes, currentPrayer: current)
                        
                    }
                }
            }
            
        } catch {
            print("Error \(error)")
        }
    }
    
    func todaysPrayerTime(dateMonth: String) -> Bool {
        for prayer in state.prayerTimes.data ?? [] {
            if(dateMonth.lowercased().starts(with: prayer.date_month?.lowercased() ?? "")){
                return true
            }
        }
        return false
    }
    
    func nowTime(start: Date?, end: Date?) -> String {
        if(Date() > start ?? Date() && Date() < end ?? Date()) {
            return "এখনকার ওয়াক্ত"
        }
        return ""
    }
    
    func updateSelectedIndex(index: Int){
        state = state.copy(currentPrayer: index)
    }
}
