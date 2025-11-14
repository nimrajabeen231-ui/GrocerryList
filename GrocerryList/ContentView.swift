//
//  ContentView.swift
//  GrocerryList
//
//  Created by Nimra Jabeen on 11/11/25.
//



/*
import SwiftUI
import UserNotifications

// 1. DATA MODEL (Includes Reminder Properties, Codable, and Equatable)
struct ShoppingItem: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var isCompleted: Bool = false
    var quantity: String = ""
    
    var scheduledDate: Date?
    var notificationID: String?

    init(name: String, quantity: String = "", isCompleted: Bool = false, scheduledDate: Date? = nil, notificationID: String? = nil) {
        self.id = UUID()
        self.name = name
        self.quantity = quantity
        self.isCompleted = isCompleted
        self.scheduledDate = scheduledDate
        self.notificationID = notificationID
    }
}

// 2. MAIN VIEW
struct ContentView: View {

    // DATA PERSISTENCE: Loads and saves the list
    @AppStorage("shopping_list_items") var shoppingItemsData: Data = Data()
    @State private var shoppingItems: [ShoppingItem] = []
    
    @State private var showingAddItemSheet = false
    
    // Subtly whitish gradient for the background
    let gradient = LinearGradient(
        colors: [
            Color.blue.opacity(0.35),
            Color.green.opacity(0.3)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    var body: some View {
        NavigationView {
            ZStack {
                gradient.ignoresSafeArea()
                
                // Card Structure (Always Present)
                VStack {
                    if shoppingItems.isEmpty {
                        // Empty State View
                        VStack {
                            Image(systemName: "basket.fill")
                                .font(.largeTitle)
                                .foregroundColor(.gray)
                            Text("Your list is empty!")
                                .font(.title3)
                                .foregroundColor(.primary)
                            Text("Tap the '+' button to add items.")
                                .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } else {
                        // List View (with front-facing delete button)
                        List {
                            ForEach($shoppingItems) { $item in
                                HStack {
                                    // Checkmark icon & Haptics
                                    Image(systemName: $item.wrappedValue.isCompleted ? "checkmark.circle.fill" : "circle")
                                        .foregroundColor($item.wrappedValue.isCompleted ? Color.mint : Color.gray)
                                        .onTapGesture {
                                            $item.wrappedValue.isCompleted.toggle()
                                        }
                                        .sensoryFeedback(.success, trigger: $item.wrappedValue.isCompleted)

                                    // Item Name, Quantity, and Reminder Info
                                    VStack(alignment: .leading) {
                                        HStack {
                                            Text($item.wrappedValue.name)
                                                .strikethrough($item.wrappedValue.isCompleted)
                                                .font(.headline)
                                                .foregroundColor(.primary)

                                            if !$item.wrappedValue.quantity.isEmpty { // Show quantity if not empty
                                                Text("(\($item.wrappedValue.quantity))")
                                                    .font(.subheadline)
                                                    .foregroundColor(.secondary)
                                            }
                                        }
                                        
                                        // Conditional Reminder Display
                                        if let date = $item.wrappedValue.scheduledDate {
                                            Text("Reminder: \(date, style: .date) \(date, style: .time)")
                                                .font(.caption)
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                    
                                    Spacer()

                                    // FRONT-FACING DELETE BUTTON
                                    Button {
                                        deleteItem(itemToDelete: $item.wrappedValue)
                                    } label: {
                                        Image(systemName: "trash.circle.fill")
                                            .font(.title2)
                                            .foregroundColor(.red)
                                    }
                                }
                                .listRowBackground(Color.clear)
                            }
                        }
                        // List Styling
                        .scrollContentBackground(.hidden)
                    }
                }
                // Card Container Styling
                .background(Color.white.opacity(0.8))
                .cornerRadius(25)
                .padding(.horizontal)
                .padding(.top, 20)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                
                Spacer()
            }
            .navigationTitle("My Shopping List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddItemSheet = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.blue)
                    }
                }
            }
            .preferredColorScheme(.light)
        }
        // Load data when view appears
        .onAppear(perform: loadData)
        // Save data every time the list changes
        .onChange(of: shoppingItems, perform: saveData)
        .sheet(isPresented: $showingAddItemSheet) {
            AddItemView(items: $shoppingItems)
                .presentationDetents([.fraction(0.6), .large]) // 🚨 FIX: Compact modal height 🚨
        }
    }
    
    // --- PERSISTENCE AND DELETION FUNCTIONS ---
    
    func deleteItem(itemToDelete: ShoppingItem) {
        // 1. Cancel the scheduled notification
        if let id = itemToDelete.notificationID {
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id])
        }
        
        // 2. Remove the item from the array based on its unique ID
        if let index = shoppingItems.firstIndex(where: { $0.id == itemToDelete.id }) {
            shoppingItems.remove(at: index)
        }
        saveData(items: shoppingItems)
    }

    func loadData() {
        guard let savedItems = try? JSONDecoder().decode([ShoppingItem].self, from: shoppingItemsData) else { return }
        shoppingItems = savedItems
    }
    
    func saveData(items: [ShoppingItem]) {
        guard let encoded = try? JSONEncoder().encode(items) else { return }
        shoppingItemsData = encoded
    }
}

#Preview {
    ContentView()
}
*/





import SwiftUI
import UserNotifications

// 1. DATA MODEL (No Change)
struct ShoppingItem: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var isCompleted: Bool = false
    var quantity: String = ""
    
    var scheduledDate: Date?
    var notificationID: String?

    init(name: String, quantity: String = "", isCompleted: Bool = false, scheduledDate: Date? = nil, notificationID: String? = nil) {
        self.id = UUID()
        self.name = name
        self.quantity = quantity
        self.isCompleted = isCompleted
        self.scheduledDate = scheduledDate
        self.notificationID = notificationID
    }
}

// 2. MAIN VIEW
struct ContentView: View {

    @AppStorage("shopping_list_items") var shoppingItemsData: Data = Data()
    @State private var shoppingItems: [ShoppingItem] = []
    
    @State private var showingAddItemSheet = false
    
    // Subtly whitish gradient for the background
    let gradient = LinearGradient(
        colors: [
            Color.blue.opacity(0.35),
            Color.green.opacity(0.3)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    var body: some View {
        NavigationView {
            ZStack {
                gradient.ignoresSafeArea()
                
                // Card Structure (Always Present)
                VStack {
                    if shoppingItems.isEmpty {
                        // Empty State View
                        VStack {
                            Image(systemName: "basket.fill")
                                .font(.largeTitle)
                                .foregroundColor(.gray)
                            Text("Your list is empty!")
                                .font(.title3)
                                .foregroundColor(.primary)
                            Text("Tap the '+' button to add items.")
                                .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } else {
                        // List View (with front-facing delete button)
                        List {
                            ForEach($shoppingItems) { $item in
                                HStack {
                                    // Checkmark icon & Haptics
                                    Image(systemName: $item.wrappedValue.isCompleted ? "checkmark.circle.fill" : "circle")
                                        .foregroundColor($item.wrappedValue.isCompleted ? Color.mint : Color.gray)
                                        .onTapGesture {
                                            $item.wrappedValue.isCompleted.toggle()
                                        }
                                        .sensoryFeedback(.success, trigger: $item.wrappedValue.isCompleted)

                                    // Item Name, Quantity, and Reminder Info
                                    VStack(alignment: .leading) {
                                        HStack {
                                            Text($item.wrappedValue.name)
                                                .strikethrough($item.wrappedValue.isCompleted)
                                                .font(.headline)
                                                .foregroundColor(.primary)

                                            if !$item.wrappedValue.quantity.isEmpty { // Show quantity if not empty
                                                Text("(\($item.wrappedValue.quantity))")
                                                    .font(.subheadline)
                                                    .foregroundColor(.secondary)
                                            }
                                        }
                                        
                                        // Conditional Reminder Display
                                        if let date = $item.wrappedValue.scheduledDate {
                                            Text("Reminder: \(date, style: .date) \(date, style: .time)")
                                                .font(.caption)
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                    
                                    Spacer()

                                    // FRONT-FACING DELETE BUTTON
                                    Button {
                                        deleteItem(itemToDelete: $item.wrappedValue)
                                    } label: {
                                        Image(systemName: "trash.circle.fill")
                                            .font(.title2)
                                            .foregroundColor(.red)
                                    }
                                }
                                .listRowBackground(Color.clear)
                            }
                        }
                        // List Styling
                        .scrollContentBackground(.hidden)
                    }
                }
                // Card Container Styling
                .background(Color.white.opacity(0.8))
                .cornerRadius(25)
                .padding(.horizontal)
                .padding(.top, 20)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                
                Spacer()
            }
            .navigationTitle("My Shopping List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddItemSheet = true
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.blue)
                    }
                }
            }
            .preferredColorScheme(.light)
        }
        // Load data when view appears
        .onAppear(perform: loadData)
        // Save data every time the list changes
        .onChange(of: shoppingItems, perform: saveData)
        
        // 🚨 REVERTED TO STANDARD .sheet PRESENTATION 🚨
        .sheet(isPresented: $showingAddItemSheet) {
            AddItemView(items: $shoppingItems)
                // Use a standard detent to prevent full screen stretching
                .presentationDetents([.medium, .large])
        }
    }
    
    // --- PERSISTENCE AND DELETION FUNCTIONS ---
    
    func deleteItem(itemToDelete: ShoppingItem) {
        if let id = itemToDelete.notificationID {
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id])
        }
        
        if let index = shoppingItems.firstIndex(where: { $0.id == itemToDelete.id }) {
            shoppingItems.remove(at: index)
        }
        saveData(items: shoppingItems)
    }

    func loadData() {
        guard let savedItems = try? JSONDecoder().decode([ShoppingItem].self, from: shoppingItemsData) else { return }
        shoppingItems = savedItems
    }
    
    func saveData(items: [ShoppingItem]) {
        guard let encoded = try? JSONEncoder().encode(items) else { return }
        shoppingItemsData = encoded
    }
}

#Preview {
    ContentView()
}






