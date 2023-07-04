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
    
    var body: some View {
        VStack {
            HStack {
                // Header Title
                Text("Recent Transactions")
                    .font(.title2)
                    .bold()
                
                Spacer()
                
                // Header Link
                NavigationLink {
                    //
                } label: {
                    HStack(spacing: 4) {
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color("highlight"))
                } 
            }
            .padding()
            
            // Transaction List: Loop through each transaction row in TransactionListViewModel. pass transaction preview data to transaction row for it to work
            ForEach(transactionListViewModel.transactions) { transaction in
                TransactionRow(transaction: transaction)
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
