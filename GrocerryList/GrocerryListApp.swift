//
//  GrocerryListApp.swift
//  GrocerryList
//
//  Created by Nimra Jabeen on 11/11/25.
//

import SwiftUI
import UserNotifications

@main
struct GroceryListApp: App {
    
    init() {
        // Request notification permission when the app starts (unchanged)
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Notification permission granted.")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            // 🚨 START WITH SPLASH SCREEN 🚨
            SplashScreenView()
        }
    }
}
