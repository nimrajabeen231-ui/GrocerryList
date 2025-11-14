//
//  AddItemView.swift
//  GrocerryList
//
//  Created by Nimra Jabeen on 11/11/25.
//


/*
import SwiftUI
import UserNotifications

struct AddItemView: View {
    @Environment(\.dismiss) var dismiss
    @State private var newItemName: String = ""
    @State private var newItemQuantity: String = ""
    @Binding var items: [ShoppingItem]
    
    @State private var isScheduled: Bool = false
    @State private var selectedDate: Date = Date().addingTimeInterval(3600)

    let gradient = LinearGradient(
        colors: [
            Color.gray.opacity(0.1),
            Color.blue.opacity(0.05)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    var body: some View {
        ZStack {
            gradient.ignoresSafeArea()
            
            VStack {
                Text("Add New Item")
                    .font(.title2.bold())
                    .padding(.top, 40)
                
                // Item Name Input
                TextField("Item name (e.g., Apples)", text: $newItemName)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .foregroundColor(.primary)
                    .padding(.horizontal, 20)
                
                // Quantity/Notes Input
                TextField("Quantity or Notes (e.g., 2 lbs or organic)", text: $newItemQuantity)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .foregroundColor(.primary)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                
                // Schedule Toggle
                Toggle("Set Reminder", isOn: $isScheduled)
                    .padding(.horizontal, 25)
                    .tint(.blue)
                
                // Date Picker (using .compact style to prevent clipping)
                if isScheduled {
                    DatePicker("Buy on", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(.compact)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 10)
                }

                // Save Item Button
                Button("Save Item") {
                    saveItemAndScheduleNotification()
                    dismiss()
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding(.vertical, 12)
                .padding(.horizontal, 40)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                )
                .padding(.top, 15)
                .disabled(newItemName.isEmpty)
                
                Spacer()
            }
            
            // Cross Button (Manual placement)
            VStack {
                HStack {
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.blue) // Matches save button color
                            .padding(.trailing, 20)
                            .padding(.top, 15)
                    }
                }
                Spacer()
            }
        }
    }
    
    // --- SAVE AND SCHEDULE FUNCTIONS ---

    func saveItemAndScheduleNotification() {
        let notificationID = UUID().uuidString
        
        // Pass name and quantity to the item initializer
        var newItem = ShoppingItem(name: newItemName, quantity: newItemQuantity)
        
        if isScheduled && selectedDate > Date() {
            scheduleNotification(for: newItemName, on: selectedDate, id: notificationID)
            
            newItem.scheduledDate = selectedDate
            newItem.notificationID = notificationID
        }
        
        items.append(newItem)
    }
    
    func scheduleNotification(for itemName: String, on date: Date, id: String) {
        let content = UNMutableNotificationContent()
        content.title = "Shopping Reminder"
        content.body = "Time to buy: \(itemName)"
        content.sound = UNNotificationSound.default
        
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }
        }
    }
}

*/

/*

import SwiftUI
import UserNotifications

struct AddItemView: View {
    @Environment(\.dismiss) var dismiss
    @State private var newItemName: String = ""
    @State private var newItemQuantity: String = ""
    @Binding var items: [ShoppingItem]
    
    @State private var isScheduled: Bool = false
    @State private var selectedDate: Date = Date().addingTimeInterval(3600)

    let gradient = LinearGradient(
        colors: [
            Color.gray.opacity(0.1),
            Color.blue.opacity(0.05)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    var body: some View {
        // 🚨 CRITICAL CHANGE: Apply gradient to the VStack directly, and add .ignoresSafeArea(.all, edges: .bottom) 🚨
        VStack(spacing: 15) {
            
            // Cross Button (manual placement, ensures it's above the title)
            HStack {
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .padding(.trailing, 20)
                        .padding(.top, 15)
                }
            }
            
            // 1. Title
            Text("Add New Item")
                .font(.title2.bold())
                .padding(.top, 0) // Adjusted padding as cross button is now above
            
            // 2. Item Name Input
            TextField("Item name (e.g., Apples)", text: $newItemName)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .foregroundColor(.primary)
                .padding(.horizontal, 20)
                
            // 3. Quantity/Notes Input
            TextField("Quantity or Notes (e.g., 2 lbs or organic)", text: $newItemQuantity)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .foregroundColor(.primary)
                .padding(.horizontal, 20)
            
            // 4. Schedule Toggle
            Toggle("Set Reminder", isOn: $isScheduled)
                .padding(.horizontal, 25)
            .tint(.blue)
            
            // 5. Date Picker (conditionally shown)
            if isScheduled {
                DatePicker("Buy on", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(.compact)
                    .padding(.horizontal, 25)
            }

            // 6. Save Item Button
            Button("Save Item") {
                saveItemAndScheduleNotification()
                dismiss()
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding(.vertical, 12)
            .padding(.horizontal, 40)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
            )
            .padding(.top, 5)
            .padding(.bottom, 20)
            .disabled(newItemName.isEmpty)
            
            Spacer() // This Spacer will push content up if modal is full screen
            
        } // End of VStack
        .background(gradient) // 🚨 Apply gradient directly to the VStack content 🚨
        .ignoresSafeArea(.all, edges: .bottom) // Ensure gradient extends to the bottom edge when full screen
    }
    
    // --- SAVE AND SCHEDULE FUNCTIONS ---

    func saveItemAndScheduleNotification() {
        let notificationID = UUID().uuidString
        var newItem = ShoppingItem(name: newItemName, quantity: newItemQuantity)
        
        if isScheduled && selectedDate > Date() {
            scheduleNotification(for: newItemName, on: selectedDate, id: notificationID)
            newItem.scheduledDate = selectedDate
            newItem.notificationID = notificationID
        }
        items.append(newItem)
    }
    
    func scheduleNotification(for itemName: String, on date: Date, id: String) {
        let content = UNMutableNotificationContent()
        content.title = "Shopping Reminder"
        content.body = "Time to buy: \(itemName)"
        content.sound = UNNotificationSound.default
        
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }
        }
    }
}
*/

import SwiftUI
import UserNotifications

struct AddItemView: View {
    @Environment(\.dismiss) var dismiss
    @State private var newItemName: String = ""
    @State private var newItemQuantity: String = ""
    @Binding var items: [ShoppingItem]
    
    @State private var isScheduled: Bool = false
    @State private var selectedDate: Date = Date().addingTimeInterval(3600)

    // The gradient definition
    let gradient = LinearGradient(
        colors: [
            Color.gray.opacity(0.08), // 🚨 REDUCED OPACITY 🚨 Very light gray
            Color.blue.opacity(0.04)  // 🚨 REDUCED OPACITY 🚨 Almost transparent blue
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    var body: some View {
        // 🚨 CRITICAL FIX: Apply the gradient as the main background 🚨
        ZStack {
            gradient.ignoresSafeArea() // This ensures the gradient fills the entire sheet
            
            VStack(spacing: 15) {
                
                // 1. Top Bar (Title and Cross Button)
                HStack {
                    Text("Add New Item")
                        .font(.title2.bold())
                    
                    Spacer()
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                    }
                }
                .padding(.top, 25)
                .padding(.horizontal, 20)
                
                // 2. Item Name Input
                TextField("Item name (e.g., Apples)", text: $newItemName)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .foregroundColor(.primary)
                    .padding(.horizontal, 20)
                    
                // 3. Quantity/Notes Input
                TextField("Quantity or Notes (e.g., 2 lbs or organic)", text: $newItemQuantity)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .foregroundColor(.primary)
                    .padding(.horizontal, 20)
                
                // 4. Schedule Toggle
                Toggle("Set Reminder", isOn: $isScheduled)
                    .padding(.horizontal, 25)
                .tint(.blue)
                
                // 5. Date Picker (conditionally shown)
                if isScheduled {
                    DatePicker("Buy on", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(.compact)
                        .padding(.horizontal, 25)
                }

                // 6. Save Item Button
                Button("Save Item") {
                    saveItemAndScheduleNotification()
                    dismiss()
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding(.vertical, 12)
                .padding(.horizontal, 40)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                )
                .padding(.top, 5)
                .padding(.bottom, 20)
                .disabled(newItemName.isEmpty)
                
                Spacer() // Pushes content up when modal is large
                
            } // End of VStack
        } // End of ZStack
    }
    
    // --- SAVE AND SCHEDULE FUNCTIONS ---

    func saveItemAndScheduleNotification() {
        let notificationID = UUID().uuidString
        var newItem = ShoppingItem(name: newItemName, quantity: newItemQuantity)
        
        if isScheduled && selectedDate > Date() {
            scheduleNotification(for: newItemName, on: selectedDate, id: notificationID)
            newItem.scheduledDate = selectedDate
            newItem.notificationID = notificationID
        }
        items.append(newItem)
    }
    
    func scheduleNotification(for itemName: String, on date: Date, id: String) {
        let content = UNMutableNotificationContent()
        content.title = "Shopping Reminder"
        content.body = "Time to buy: \(itemName)"
        content.sound = UNNotificationSound.default
        
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }
        }
    }
}
