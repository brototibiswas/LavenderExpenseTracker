//
//  TransactionListViewModel.swift
//  ExpenseTracker
//  Duty:
//  1. Manages calls to API via Combine
//  2. Save the returned data to state property
//  3. Use state property throughout the app
//
//  Created by Brototi Biswas on 7/1/23.
//

import Foundation
import Combine

// ObservableObject: Part of Combine framework that turns any object into publisher
// Notifies all its subscriber on state change so the subscriber can refresh their views
final class TransactionListViewModel: ObservableObject {
    
    // @Published: this property sends notification to subscriber when the var value changes
    @Published var transactions: [Transaction] = []
    
    // Reference to cancellables
    private var cancellables = Set<AnyCancellable>()
    
    
    init() {
        getTransactions()
    }
    
    func getTransactions() {
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
            print("Invalid URL")
            return
        }
        
        // Use Combine as data-task to combine events via operators
        //  and handle response and data in each step
        // tryMap: Allows error throwing during mapping response. Ends stream with failure completion during failed mapping
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
        
            //decode to our TransactionModel
            .decode(type: [Transaction].self, decoder: JSONDecoder())
        
            //receive on main thread to enable updates on UI
            .receive(on: DispatchQueue.main)
        
            .sink { completion in
                // closure receiveCompletion : handles success/failure of case
                // print appropriate msg based on status
                switch completion {
                case .failure(let error):
                    print("Error fetching transactions", error.localizedDescription)
                case .finished:
                    print("Finished fetching transactions")
                }
                
            } receiveValue: { [weak self] result in
                // closure receiveValue : handles output.
                // Store it in @published transactions array
                // [weak self] = prevents memory leaks
                self?.transactions = result
            }
        
            // sink conforms to Cancellable protocol -> returns AnyCancellable
            // Store cancellable reference to the subscriber in set of cancellables
            // Cancels subscription when the reference gets deallocated -> frees up space
            .store(in: &cancellables)

    }
}
