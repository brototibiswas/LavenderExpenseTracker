//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Brototi Biswas on 6/29/23.
//

import Foundation

var transactionPreviewData = Transaction(id: 0, date: "06/29/2023", institution: "NYU", account: "Croods", amount: 10.89, type: "debit", merchant: "Library", categoryId: 400, category: "Book", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

// Repeating list of 10 data
var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
