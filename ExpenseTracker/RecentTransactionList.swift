//
//  RecentTransactionList.swift
//  ExpenseTracker
//
//  Created by Brototi Biswas on 7/4/23.
//

import SwiftUI

struct RecentTransactionList: View {
    // transactionListviewModel is set as environment object in main
    @EnvironmentObject var transactionListViewModel: TransactionListViewModel
    private let maxRecentItemsToDisplay = 5;
    
    var body: some View {
        VStack {
            HStack {
                // Header Title
                Text("Recent Transactions")
                    .font(.title2)
                    .bold()
                
                Spacer()
                
                // Header Link
                NavigationLink(
                    destination: AllTransactionView(),
                    label: {
                        HStack(spacing: 4) {
                            Text("See All")
                            Image(systemName: "chevron.right")
                        }
                        .foregroundColor(Color("highlight"))
                    }
               )
            }
            .padding()
            
            // Transaction List: Loop through each transaction row in TransactionListViewModel. pass transaction preview data to transaction row for it to work
            // prefix: returns specified number of elements from list
            // Array(list.enumerated()) -> access both index and element of the list. Closure takes in index and element and use the index to figure out the divider visibility
            ForEach(Array(transactionListViewModel.transactions.prefix(maxRecentItemsToDisplay).enumerated()), id: \.element) { index, transaction in
                TransactionRow(transaction: transaction)
                
                // conditionally show Divider() until last-to-second element
                if index != maxRecentItemsToDisplay - 1 {
                    Divider()
                }
            }
        }
        .padding()
        .background(Color.containerColor)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.1), radius: 10, x: 0, y: 5)
    }
}

struct RecentTransactionList_Previews: PreviewProvider {
    // Initialize and pass preview data to viewModel for the environment Object property to function
    static let transactionListViewModel: TransactionListViewModel = {
        let viewModel = TransactionListViewModel()
//        viewModel.transactions = transactionListPreviewData
        print(viewModel.transactions)
        return viewModel
    }()
    
    static var previews: some View {
        Group {
            RecentTransactionList()
            RecentTransactionList()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListViewModel)
    }
}
