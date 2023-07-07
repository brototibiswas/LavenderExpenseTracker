//
//  AllTransactionList.swift
//  ExpenseTracker
//
//  Created by Brototi Biswas on 7/6/23.
//

import SwiftUI

struct AllTransactionList: View {
    @EnvironmentObject var transactionListViewModel: TransactionListViewModel
    
    var body: some View {
        VStack {
            Text("Pending Transaction")
                .font(.title2)
                .bold()
            
            // transactions
            ForEach(Array(transactionListViewModel.transactions)) {  transaction in
                TransactionRow(transaction: transaction)
                
                Divider()
            }
        }
        .padding()
        .background(Color.containerColor)
    }
}

struct AllTransactionList_Previews: PreviewProvider {
    // Initialize and pass preview data to viewModel for the environment Object property to function
    static let transactionListViewModel: TransactionListViewModel = {
        let viewModel = TransactionListViewModel()
        return viewModel
    }()
//
    static var previews: some View {
        Group {
            AllTransactionList()
            AllTransactionList().preferredColorScheme(.dark)
        }
        .environmentObject(transactionListViewModel)
    }
}
