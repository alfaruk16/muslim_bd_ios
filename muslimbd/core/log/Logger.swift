//
//  Logger.swift
//  muslimbd
//
//  Created by Al Faruk on 29/12/24.
//

import Foundation
import OSLog

public class Log {
    
    static func debug(category: String = "MyApp", _ message: String) {
        Logger.message().debug("[Debug] \(message)")
    }
    
    static func info(category: String = "MyApp", _ message: String) {
        Logger.message().info("[Info] \(message)")
    }
    
    static func notice(category: String = "MyApp", _ message: String) {
        Logger.message().notice("[Notice] \(message)")
    }
    
    static func warning(category: String = "MyApp", _ message: String) {
        Logger.message().warning("[Warning] \(message)")
    }
    
    static func error(category: String = "MyApp", _ message: String) {
        Logger.message().error("[Error] \(message)")
    }
    
    static func critical(category: String = "MyApp", _ message: String) {
        Logger.message().critical("[Attention] \(message)")
    }
}

extension Logger {
    private static var bundleIdentifier = Bundle.main.bundleIdentifier!
    
    static func message(_ category: String = "MyApp") -> Logger {
        Logger(subsystem: "\(bundleIdentifier)", category: "MyApp")
    }
    
    static func retrieveLogs(interval: Double = -86400) throws -> [OSLogEntryLog] {
        let logStore = try OSLogStore(scope: .currentProcessIdentifier)
        
        let oneDayAgo = logStore.position(date: Date().addingTimeInterval(interval))
        
        let allEntries = try logStore.getEntries(at: oneDayAgo)
        
        return allEntries.compactMap {
            $0 as? OSLogEntryLog
        }
        .filter {
            $0.subsystem == Bundle.main.bundleIdentifier!
        }
    }
}
