//
//  muslimbdApp.swift
//  muslimbd
//
//  Created by Al Faruk on 13/11/24.
//

import SwiftUI

@main
struct MuslimbdApp: App {
    
    var isPremium = false
    static var token = "Bearer jvaltwhqvpwfqypxowjyohpkgfmhflevxazwosqwoosyvmkwbgforpbkboqvikhuljyrzlmjwdspbtutocwtmvljbkmtfpvpffqj"
    
    var body: some Scene {
        WindowGroup {
            MainScreen()
        }
    }
}
