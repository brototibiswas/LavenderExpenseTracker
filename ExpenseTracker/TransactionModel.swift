//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Brototi Biswas on 6/29/23.
//

import Foundation

struct Transaction: Identifiable, Decodable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    let amount: Double
    let type: TransactionType.RawValue
    var merchant: String
    var categoryId: Int
    var category: String
    let isPending: Bool
    let isTransfer: Bool
    let isExpense: Bool
    let isEdited: Bool
    
    var dateParsed: Date {
        date.dateParsed()
    }
    
    var signedAmount: Double {
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
}


enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}
