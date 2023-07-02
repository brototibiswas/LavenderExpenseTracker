//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Brototi Biswas on 6/28/23.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    // Initialize viewmodel when app launches
    // @StateObject : follows lifecyles of the app. SwiftUI will reserve memory for this
    @StateObject var transactionListViewModel = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListViewModel) // any child of ContentView() can access the object passed
        }
    }
}
