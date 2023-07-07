//
//  AllTransactionView.swift
//  ExpenseTracker
//
//  Created by Brototi Biswas on 7/6/23.
//

import SwiftUI

//@Binding var allTransaction: Bool

struct AllTransactionView: View {
    var body: some View {
        VStack {
            ScrollView {
                AllTransactionList()
            }
            .padding(.top)
        }
        .frame(maxWidth: .infinity)
        .background(Color.background)
    }
}

struct AllTransactionView_Previews: PreviewProvider {
    static let transactionListViewModel: TransactionListViewModel = {
        let viewModel = TransactionListViewModel()
        return viewModel
    }()
    
    static var previews: some View {
        Group {
            AllTransactionView()
            AllTransactionView().preferredColorScheme(.dark)
        }
        .environmentObject(transactionListViewModel)
        
    }
}
