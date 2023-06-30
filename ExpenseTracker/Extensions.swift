//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by Brototi Biswas on 6/28/23.
//

import Foundation
import SwiftUI

extension Color {
    static let background = Color("Background")
    static let icon = Color("IconGeneral")
    static let notificationIcon = Color("Notification")
    static let text = Color("Text")
    static let containerColor = Color("Container")
    static let systemBackground = Color(uiColor: .systemBackground)
}

extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
        print("Initializing Dateformatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter
    }()
}

extension String {
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else {
            return Date()
        }
        
        return parsedDate
    }
}
