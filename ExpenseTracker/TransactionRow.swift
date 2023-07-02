//
//  TransactionRow.swift
//  ExpenseTracker
//
//  Created by Brototi Biswas on 6/29/23.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionRow: View {
    var transaction: Transaction
    
    var body: some View {
        HStack(spacing: 20) {
            
            // Category Icon
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.icon.opacity(0.4))
                .frame(width: 44, height: 44)
                .overlay {
                    FontIcon.text(.awesome5Solid(code: .icons), fontsize: 24, color: Color.text)
                }
            
            VStack(alignment: .leading, spacing: 8) {
                // Merchant
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                // Category
                Text(transaction.category)
                    .font(.footnote)
                    .fontWeight(.light)
                    .lineLimit(1)
                
                // Date
                Text(transaction.dateParsed,
                     format: .dateTime.year().month().day())
                    .font(.footnote)
                    .fontWeight(.thin)
                    .lineLimit(1)
            }
            
            Spacer()
            
            // Amount
            Text(transaction.signedAmount, format: .currency(code: "USD"))
                .bold()
                .font(.subheadline)
                .foregroundColor(transaction.type == TransactionType.debit.rawValue ? Color.text : .red)
            
        }
        .frame(alignment: .topLeading)
        .background(Color.containerColor)
        .padding([.top, .bottom], 8)
        
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow(transaction: transactionPreviewData).preferredColorScheme(.light)
        TransactionRow(transaction: transactionPreviewData).preferredColorScheme(.dark)
    }
}
