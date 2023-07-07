//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Brototi Biswas on 6/29/23.
//

import Foundation
import SwiftUIFontIcon

struct Transaction: Identifiable, Decodable, Hashable {
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
    
    var icon: FontAwesomeCode {
        for category in Category.allCategories {
            if category.id == categoryId {
                return category.icon
            }
        }
        return .question
    }
}


enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}

struct Category {
    let id: Int
    let name: String
    let icon: FontAwesomeCode
    var mainCategoryId: Int?
}

extension Category {
    static let autoAndTransport = Category(id: 1, name: "Auto & Transportation", icon: .car)
    static let billsAndUtilities = Category(id: 2, name: "Bills & Utilities", icon: .file_invoice)
    static let entertainment = Category(id: 3, name: "Entertainment", icon: .film)
    static let feesAndCharges = Category(id: 4, name: "Fees and Charges", icon: .donate)
    static let foodAndDining = Category(id: 5, name: "Food & Dining", icon: .hamburger)
    static let home = Category(id: 6, name: "Home", icon: .home)
    static let income = Category(id: 7, name: "Income", icon: .money_check)
    static let shopping = Category(id: 8, name: "Shopping", icon: .shopping_bag)
    static let transfer = Category(id: 9, name: "Transfer", icon: .exchange_alt)
    
    
    static let publictransportation = Category(id: 101, name: "Public Transportation", icon: .bus, mainCategoryId: 1)
    static let taxi = Category(id: 102, name: "Taxi", icon: .taxi, mainCategoryId: 1)
    static let mobilePhone = Category(id: 201, name: "Mobile Phone", icon: .mobile, mainCategoryId: 2)
    static let moviesAndDVDs = Category(id: 301, name: "Movies & DVDs", icon: .video, mainCategoryId: 3)
    static let bankFees = Category(id: 401, name: "Bank Fees", icon: .hand_holding_usd, mainCategoryId: 4)
    static let financialCharge = Category(id: 402, name: "Finance Charges", icon: .hand_holding_usd, mainCategoryId: 4)
    static let groceries = Category(id: 501, name: "Groceries", icon: .carrot, mainCategoryId: 5)
    static let restaurants = Category(id: 502, name: "Restaurants", icon: .utensils, mainCategoryId: 5)
    static let coffeeShops = Category(id: 503, name: "Coffee Shop", icon: .coffee, mainCategoryId: 5)
    static let rent = Category(id: 601, name: "Rent", icon: .building, mainCategoryId: 6)
    static let homeSupplies = Category(id: 602, name: "Home Supplies", icon: .couch, mainCategoryId: 6)
    static let paycheque = Category(id: 701, name: "Paycheque", icon: .money_bill, mainCategoryId: 7)
    static let software = Category(id: 801, name: "Software", icon: .laptop, mainCategoryId: 8)
    static let creditCardPayment = Category(id: 901, name: "Credit Card Payment", icon: .credit_card, mainCategoryId: 9)
}

extension Category {
    static let categories: [Category] = [
        .autoAndTransport,
        .billsAndUtilities,
        .entertainment,
        .feesAndCharges,
        .foodAndDining,
        .home,
        .income,
        .shopping,
        .transfer
    ]
    
    static let subCategories: [Category] = [
        .publictransportation,
        .taxi,
        .mobilePhone,
        .moviesAndDVDs,
        .bankFees,
        .financialCharge,
        .groceries,
        .restaurants,
        .rent,
        .homeSupplies,
        .paycheque,
        .software,
        .creditCardPayment
    ]
    
    static let allCategories: [Category] = categories + subCategories
}
