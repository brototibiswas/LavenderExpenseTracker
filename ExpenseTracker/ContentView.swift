//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Brototi Biswas on 6/28/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Title
                    Text("OverView")
                        .font(.title2)
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Recent Transaction View
                    RecentTransactionList()
                }
                .padding()
                //make whole screen scrollable
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                //Notification Bell Icon
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.notificationIcon, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    // RecentTransactionList is a child of ContenView and dependent on environmentObject TransactionListViewModel. So ContentView also needs an instance of TransactionListViewModel
    static let transactionListViewModel: TransactionListViewModel = {
        let viewModel = TransactionListViewModel()
        print(viewModel.transactions)
        return viewModel
    }()
    
    static var previews: some View {
        Group{
            ContentView()
            ContentView().preferredColorScheme(.dark)
        }
        .environmentObject(transactionListViewModel)
    }
}
